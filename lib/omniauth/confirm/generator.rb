module OmniAuth
  module Confirm
    # Generate confirmation code
    class Generator
      MAX_CODE_VALUE = 9999
      MIN_CODE_VALUE = 1000

      def self.generate(auth_subject)
        MIN_CODE_VALUE + Random.rand(MAX_CODE_VALUE - MIN_CODE_VALUE)
      end
    end
  end
end