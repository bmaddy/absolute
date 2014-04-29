Curate.configure do |config|
  # Injected via `rails g curate:work Text`
  config.register_curation_concern :text
  config.register_curation_concern :generic_work
  config.register_curation_concern :image
  
  # # You can override curate's antivirus runner by configuring a lambda (or
  # # object that responds to call)
  # config.default_antivirus_instance = lambda {|filename| … }

  # # Used for constructing permanent URLs
  # config.application_root_url = 'https://repository.higher.edu/'

  # # Override the file characterization runner that is used
  # config.characterization_runner = lambda {|filename| … }
end
