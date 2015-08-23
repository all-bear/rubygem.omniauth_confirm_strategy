require "redis"

module OmniAuth
  module Confirm
    # Store confirmation codes
    class Storage
      AVAILABLE_TIME = 10 * 60

      @storage = Redis.new

      def self.save(auth_subject, code)
        @storage.set(auth_subject, code, :ex => AVAILABLE_TIME)
      end

      def self.check?(auth_subject, code)
        @storage.get(auth_subject) == code
      end
    end
  end
end