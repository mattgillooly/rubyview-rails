require 'spec_helper'

describe 'Rubyview template handler' do
  
  Handler = ActionView::Template::Handlers::RubyviewBuilder
  ViewTemplate = Struct.new(:source)

  class MyContext
    def initialize(a, b)
      @foo, @bar = a, b
    end
  end

  let( :handler ) { Handler.new }

  let( :simple_template ) do
    ViewTemplate.new(<<EOF
      require 'json'

      hello = 'world'
      h = {}

      h['hello'] = hello
      h.to_json
EOF
    )
  end

  let( :interpolated_template ) do
    ViewTemplate.new("
      require 'json'

      h = { :foo => @foo,
            :bar => @bar }

      h.to_json"
    )
  end

  context "#{Rails.version}" do
    before do
      Rails.stub_chain(:application, :config, :rubyview_format).and_return( :plain )
    end

    it 'should use JSON as its default output format' do
      handler.default_format.should == Mime::JSON
    end

    it 'should compile a simple template to JSON' do
      result = eval( Handler.call simple_template )
      result.should == '{"hello":"world"}'
    end

    it 'should compile an interpolated template to JSON' do
      c = MyContext.new('1', '23')
      result = c.instance_eval( Handler.call interpolated_template )
      result.should == '{"foo":"1","bar":"23"}'
    end
  end

end
