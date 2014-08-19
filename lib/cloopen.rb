require "cloopen/version"
require "cloopen/sign"
require "rest_client"
require "cloopen/short_message"

module Cloopen
  class << self
    attr_accessor :account_sid
    attr_accessor :auth_token
    attr_accessor :app_id
  end
end
