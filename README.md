# Workflow - Quick prototyping script for creating rich html and pdfs from markdown documents

[Workflow](https://github.com/dohliam/workflow) is a small script for generating nice-looking web pages and pdf documents from markdown using a [CSS switcher](https://github.com/dohliam/dropin-minimal-css). This means that creating a webpage or pdf is simply a matter of writing some content in markdown and choosing a CSS template, which can drastically reduce the amount of time required to put documentation online.

## Requirements

* [ruby](https://www.ruby-lang.org/en/) and the [kramdown](https://github.com/gettalong/kramdown) gem
* [wkhtmltopdf](https://github.com/wkhtmltopdf/wkhtmltopdf)
* [rinku](https://github.com/vmg/rinku) for autolinking

## Usage

Given a plain markdown document, Workflow by default will create an html file with an embedded switcher, allowing you to cycle interactively through a list of CSS templates to see which one works best with your document. You can try this by [cloning or downloading the project](https://github.com/dohliam/workflow) and running the following command on this readme file from within the project directory:

```bash
/.workflow.rb README.md
```

Once you have decided on a CSS template, just run workflow.rb again with the `-s` option to generate a permanent file with your chosen CSS included:

```bash
./workflow.rb -s siimple README.md
```

Use the `-p` option to create a PDF using your selected CSS template:

```bash
./workflow.rb -ps siimple README.md
```

You can view an [online demo](https://dohliam.github.io/workflow) or [download a pdf](https://dohliam.github.io/workflow/workflow.pdf) which is the result of running the above commands.

## Code highlighting

Syntax highlighting for code blocks uses [pygments-css](https://github.com/richleland/pygments-css) via the [Pygments CSS Stylesheets Previewer](https://dohliam.github.io/pygments-css/).

Use the `-c` option to turn on syntax highlighting.

```bash
./workflow.rb -cps siimple README.md
```

To use a different highlighting theme than the default, specify a Pygments CSS style using the `-C` option. For example, to use the Solarized Light theme:

```bash
./workflow.rb -cps siimple -C solarized-light README.md
```

To see all the available syntax highlighting themes, take a look at the [online style switcher](https://dohliam.github.io/pygments-css/) for Pygments CSS, with sample code in a variety of programming languages.

## Options

* `-c`, `--code-highlighting`: _Use code syntax highlighting_
* `-C`, `--code-style [STYLE]`: _Specify style to use for syntax highlighting_
* `-f`, `--fixes`: _Fixes some common display problems with pdfs_
* `-h`, `--header TEXT`: _Add arbitrary header text to top of each pdf page_
* `-o`, `--output NAME`: _Basename of output file (by default same as input file)_
* `-p`, `--pdf`: _Create pdf instead of html_
* `-n`, `--numbers`: _Add a footer with page numbers_
* `-s`, `--stylesheet NAME`: _Specify name of stylesheet to use instead of CSS switcher_

## Related projects

* [dropin-minimal-css](https://github.com/dohliam/dropin-minimal-css), on which this script is based
* [asciidoctor-skins](https://github.com/darshandsoni/asciidoctor-skins), for a similar idea but with asciidoctor

## License

MIT.
