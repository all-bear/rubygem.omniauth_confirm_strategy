module OmniAuth
  module Confirm
    # Only fo testing. It print code to console
    class Transport
      def self.deliver(auth_subject, code)
        print "Code for #{auth_subject.to_s.humanize} - #{code} \n"
      end
    end
  end
end