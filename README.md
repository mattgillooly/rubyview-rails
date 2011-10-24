# Rubyview-Rails &mdash; Rubyview templates for Rails views

[Rubyview](https://github.com/mattgillooly/rubyview) is a template-less view layer for your Rails apps.

## Installation

`gem install rubyview-rails`

## Usage

Rubyview-Rails provides a Rails 3 template handler allowing you to create 
view templates using Rubyview. Any template with a `.rubyview` will be handled by Rails.

The Rubyview template handler will interpret your template as a regular Ruby method, and render the return value as its output.

    "Hello #{@world}!"

## Authors

* [Matt Gillooly](https://github.com/mattgillooly)
