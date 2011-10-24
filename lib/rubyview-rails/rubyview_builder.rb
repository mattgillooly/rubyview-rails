require 'action_view'
module ActionView
  module Template::Handlers
    if ::Rails::VERSION::MAJOR == 3 && ::Rails::VERSION::MINOR < 1
      class RubyviewBuilder < Template::Handler
        include Compilable

        self.default_format = Mime::JSON

        def compile(template)
          template.source
        end
      end
    else
      class RubyviewBuilder
        def default_format
          Mime::JSON
        end

        def self.call(template)
          template.source
        end
      end
    end
  end
end

ActionView::Template.register_template_handler :rubyview, ActionView::Template::Handlers::RubyviewBuilder
