require "cloopen/version"
require "cloopen/sms"
require "cloopen/voice"
require "cloopen/sign"

module Cloopen
  class << self
    attr_accessor :account_sid, :auth_token, :app_id, :env
  end
end
