require File.expand_path('../features/session_helpers', __FILE__)
require File.expand_path('../features/create_works', __FILE__)

RSpec.configure do |config|
  config.include Warden::Test::Helpers, type: :feature
  config.include Features::SessionHelpers, type: :feature
  config.include Features::CreateWorks, type: :feature
  
  config.before(:each, type: :feature) do
    Warden.test_mode!
    @old_resque_inline_value = Resque.inline
    Resque.inline = true
  end

  config.after(:each, type: :feature) do
    Warden.test_reset!
    Resque.inline = @old_resque_inline_value
  end
end
