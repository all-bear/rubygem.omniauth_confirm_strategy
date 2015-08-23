Rails.application.config.middleware.use OmniAuth::Builder do
  provider :confirm
end