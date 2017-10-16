require 'faraday'

# Client
require 'underarmour/version'
require 'underarmour/config'
require 'underarmour/clients/base_client'
require 'underarmour/clients/api_client'
require 'underarmour/json_converter'


# User
require 'underarmour/resources/user'
require 'underarmour/resources/user/privacy_option'
require 'underarmour/resources/user/user_profile_photo'
require 'underarmour/resources/user/user_role'
require 'underarmour/resources/user/user_stats'
require 'underarmour/resources/all_day/activity_type'
require 'underarmour/resources/all_day/actigraphy'