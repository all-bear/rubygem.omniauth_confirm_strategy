require "omniauth"

module OmniAuth
  module Strategies
    autoload :Confirm, 'omniauth/strategies/confirm'
  end

  module Confirm
    autoload :Form, 'omniauth/confirm/form'
    autoload :Generator, 'omniauth/confirm/generator'
    autoload :Storage, 'omniauth/confirm/storage'
    autoload :Transport, 'omniauth/confirm/transport'
    autoload :Validator, 'omniauth/confirm/validator'
  end
end
