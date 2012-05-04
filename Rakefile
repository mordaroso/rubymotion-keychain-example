$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'KeychainExample'

  app.frameworks += ['Security']

  app.vendor_project('vendor/GenericKeychain', :xcode,
    :headers_dir => 'GenericKeychain')

  app.entitlements['keychain-access-groups'] = [
    app.seed_id + '.' + app.identifier
  ]
end
