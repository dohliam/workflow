# Workflow - Quick prototyping script for creating rich html and pdfs from markdown documents

[Workflow](https://github.com/dohliam/workflow) is a small script for generating nice-looking web pages and pdf documents from markdown using a [CSS switcher](https://github.com/dohliam/dropin-minimal-css). This means that creating a webpage or pdf is simply a matter of writing some content in markdown and choosing a CSS template, which can drastically reduce the amount of time required to put documentation online.

## Requirements

* [ruby](https://www.ruby-lang.org/en/) and the [kramdown](https://github.com/gettalong/kramdown) gem
* [wkhtmltopdf](https://github.com/wkhtmltopdf/wkhtmltopdf)

## Usage

Given a plain markdown document, Workflow by default will create an html file with an embedded switcher, allowing you to cycle interactively through a list of CSS templates to see which one works best with your document. You can try this by [cloning or downloading the project](https://github.com/dohliam/workflow) and running the following command on this readme file from within the project directory:

    /.workflow.rb README.md

Once you have decided on a CSS template, just run workflow.rb again with the `-s` option to generate a permanent file with your chosen CSS included:

    ./workflow.rb -s siimple README.md

Use the `-p` option to create a PDF using your selected CSS template:

    ./workflow.rb -ps siimple README.md

You can view an [online demo](https://dohliam.github.io/workflow) or [download a pdf](https://dohliam.github.io/workflow/workflow.pdf) which is the result of running the above commands.

## Related projects

* [dropin-minimal-css](https://github.com/dohliam/dropin-minimal-css), on which this script is based
* [asciidoctor-skins](https://github.com/darshandsoni/asciidoctor-skins), for a similar idea but with asciidoctor

## License

MIT.
