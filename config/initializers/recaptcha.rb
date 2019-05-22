Recaptcha.configure do |config|
  config.site_key  = env['RECAPTCHA_ASKME_PUBLIC_KEY']
  config.secret_key = env['RECAPTCHA_ASKME_PRIVATE_KEY']
end
