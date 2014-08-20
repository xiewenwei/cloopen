require "cloopen/version"

module Cloopen

  attr_accessor :app_root, :account_sid, :auth_token, :app_id, :sms_uri

  def setup
    yield self
  end

  extend self

end

require "cloopen/engine"
require "cloopen/sms"
require "cloopen/sign"
