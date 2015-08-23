module OmniAuth
  module Confirm
    class Validator
      def self.validate(auth_subject)
        !auth_subject.to_s.blank?
      end
    end
  end
end