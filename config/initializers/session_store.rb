# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lakotaspirit_session',
  :secret      => '1edd806311e7612ff19a78894a8e7a7d8db9ab348a631e3607e975011b600a7b73369672a83e629ab85a4637b0625f73896d903d165e506939b6b111058e1025'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
