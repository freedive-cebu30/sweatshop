# Be sure to restart your server when you modify this file.

#Sweatshop::Application.config.session_store :cookie_store, :key => '_sweatshop_session'
Sweatshop::Application.config.session_store :active_record_store
Sweatshop::Application.config.session = {
  :key => '_sweatshop_session',
  :httponly => true
}
# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Sweatshop::Application.config.session_store :active_record_store
