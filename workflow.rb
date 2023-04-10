#!/usr/bin/env ruby

# workflow.rb: Create rich css-enabled html and pdfs from markdown documents

require 'kramdown'
require 'kramdown-parser-gfm'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: workflow.rb [options] [filename]"

  opts.on("-c", "--code-highlighting", "Use code syntax highlighting") { options[:highlighting] = true }
  opts.on("-f", "--fixes", "Fixes some common display problems with pdfs") { options[:fixes] = true }
  opts.on("-h", "--header TEXT", "Add arbitrary header text to top of each pdf page") { |v| options[:header] = v }
  opts.on("-o", "--output NAME", "Basename of output file (by default same as input file)") { |v| options[:output] = v }
  opts.on("-p", "--pdf", "Create pdf instead of html") { options[:pdf] = true }
  opts.on("-n", "--numbers", "Add a footer with page numbers") { options[:numbers] = true }
  opts.on("-s", "--stylesheet NAME", "Specify name of stylesheet to use instead of CSS switcher") { |v| options[:stylesheet] = v }

end.parse!

f = ""
if ARGV[0]
  f = ARGV[0]
else
  abort("  No markdown file specified")
end

basename = File.basename(f, File.extname(f))
html_name = basename + ".html"
content = File.read(f)
script_dir = File.expand_path(File.dirname(__FILE__)) + "/"

$title = basename.capitalize
if content.match(/^# (.*?)$/)
  $title = Regexp::last_match[1]
end

$switcher = '    <script src="https://dohliam.github.io/dropin-minimal-css/switcher.js" type="text/javascript"></script>'

fixes = ""
if options[:fixes]
  fixes = "      h1,h2,h3,h4 {\n        letter-spacing: 0rem;\n      }\n"
end

$css = ""
if options[:stylesheet]
  name = options[:stylesheet]
  $switcher = ""
  padding = "\n    <style type=\"text/css\">\n      body {\n        padding-left: 24px;\n      }\n"
  close_tag = "    </style>\n"
  $css = '    <link href="https://dohliam.github.io/dropin-minimal-css/min/' + name + '.min.css" type="text/css" rel="stylesheet">' + padding + fixes + close_tag
end

if options[:highlighting]
  $pygments = '    <link rel="stylesheet" type="text/css" class="pygments-css" href="https://dohliam.github.io/pygments-css/solarized-light.css">'
end

# html = Kramdown::Document.new(content).to_html
html = Kramdown::Document.new(content, input: 'GFM').to_html
$content = html
# $content = html.gsub(/^/, "    ")

output = ERB.new(File.read(script_dir + "template.rhtml")).result

File.open(html_name, "w") { |o| o << output }

outfile = basename
if options[:output]
  outfile = options[:output]
end

if options[:pdf]
  if options[:numbers]
    `wkhtmltopdf --enable-local-file-access --footer-center "[page]" '#{basename}.html' '#{outfile}.pdf'`
  elsif options[:header]
    header = options[:header]
    `wkhtmltopdf --enable-local-file-access --header-right "#{header}" '#{basename}.html' '#{outfile}.pdf'`
  else
    `wkhtmltopdf --enable-local-file-access '#{basename}.html' '#{outfile}.pdf'`
  end
end
