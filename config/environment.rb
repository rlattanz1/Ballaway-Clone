# Load the Rails application.
require_relative "application"

# config/environment.rb

# ...
Jbuilder.key_format camelize: :lower
Jbuilder.deep_format_keys true

# Initialize the Rails application.
Rails.application.initialize!
