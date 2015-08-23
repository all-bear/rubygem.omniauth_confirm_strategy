module OmniAuth
  module Confirm
    # Same as OmniAuth::Form, except form method that added to options
    # and added hidden field
    class Form < OmniAuth::Form
      def initialize(options = {})
        options[:method] ||= :get
        super
      end

      def self.build(options = {}, &block)
        form = self.new(options)
        if block.arity > 0
          yield form
        else
          form.instance_eval(&block)
        end
        form
      end

      def hidden_value(value, name)
        @html << "\n<input type='hidden' id='#{name}' name='#{name}' value='#{value}'/>"
        self
      end

      def header(title, header_info)
        @html << <<-HTML
      <!DOCTYPE html>
      <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>#{title}</title>
        #{css}
        #{header_info}
      </head>
      <body>
      <h1>#{title}</h1>
      <form #{"method='#{options[:method]}'"} #{"action='#{options[:url]}' " if options[:url]}noValidate='noValidate'>
        HTML
        self
      end
    end
  end
end