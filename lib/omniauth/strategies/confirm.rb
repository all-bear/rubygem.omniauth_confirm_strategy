module OmniAuth
  module Strategies
    class Confirm
      include OmniAuth::Strategy

      option :on_login, nil
      option :on_confirm, nil

      #option :add_error_to_flash, true
      #option :invalid_code_error, "Invalid confirmation code"

      option :auth_subject, "auth_key"
      option :validator, OmniAuth::Confirm::Validator
      option :generator, OmniAuth::Confirm::Generator
      option :transport, OmniAuth::Confirm::Transport
      option :storage, OmniAuth::Confirm::Storage

      uid { auth_subject }
      info { {:nickname => auth_subject} }

      def request_phase
        login_form
      end

      def other_phase
        if on_confirm_path? && request.get?

          return redirect_to_request_path unless validator.validate(auth_subject)

          proceed_confirm_code(auth_subject)

          confirm_form(auth_subject)
        else
          call_app!
        end
      end

      def callback_phase
        code = request[:confirm_code]

        return fail!(:invalid_credentials) unless valid_code?(code, auth_subject)

        super
      end

      protected
      def proceed_confirm_code(auth_subject)
        code = generator.generate(auth_subject)

        transport.deliver(auth_subject, code)

        storage.save(auth_subject, code)
      end

      def confirm_form(auth_subject)
        if options[:on_confirm]
          options[:on_confirm].call(self.env)
        else
          OmniAuth::Confirm::Form.build(
              :title  => ("#{auth_subject_title} Confirmation"),
              :method => :get,
              :url    => callback_path
          ) do |f|
            f.text_field "Confirm", "confirm_code"
            f.hidden_value auth_subject, auth_subject_name
          end.to_response
        end
      end

      def login_form
        if options[:on_login]
          options[:on_login].call(self.env)
        else
          OmniAuth::Confirm::Form.build(
              :title  => ("#{auth_subject_title} Verification"),
              :url    => confirm_path,
              :method => :get
          ) do |f|
            f.text_field auth_subject_title, auth_subject_name
          end.to_response
        end
      end

      def valid_code?(code, auth_subject)
        storage.check?(auth_subject, code)
      end

      def redirect_to_request_path
        redirect "#{path_prefix}/#{name}"
      end

      def confirm_path
        "#{path_prefix}/#{name}/confirm"
      end

      def on_confirm_path?
        on_path?(confirm_path)
      end

      def auth_subject_name
        options[:auth_subject]
      end

      def auth_subject
        auth_subject
      end

      def transport
        options[:transport]
      end

      def storage
        options[:storage]
      end

      def generator
        options[:generator]
      end

      def validator
        options[:validator]
      end

      private
      def auth_subject_title
        auth_subject_name.to_s.titleize
      end
    end
  end
end