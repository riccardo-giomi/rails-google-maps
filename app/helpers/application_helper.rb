# frozen_string_literal: true

# :nodoc:
module ApplicationHelper
  # Returns the Google API key used by the application if it is defined either
  # in the application credentials or as an environment variable.
  def google_api_key
    ENV.fetch('GOOGLE_API_KEY', nil) || raise('This application requires a Google API key.')
  end
end
