# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_paperclip_recipes_session',
  :secret      => '68c0da4a43d68fb8b7dcc1b3f336fa7e6b1538b553c306fa6af1ecfae17ca1b324af0364d5ca04b289fc5f6baffb388022b5df625aa49c1ddd82587b0fc04fc7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
