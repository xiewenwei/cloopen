require 'digest/md5'
require 'base64'

module Cloopen

  class Sign

    # 生成验证参数
    # 1. SigParameter
    # 2. Authorization
    def self.generate_sig_and_auth
      time = Time.now.strftime("%Y%m%d%H%M%S")
      sig_parameter = Digest::MD5.hexdigest(Cloopen.account_sid + Cloopen.auth_token + time).upcase
      authorization = Base64.strict_encode64("#{Cloopen.account_sid}:#{time}")
      [sig_parameter, authorization]
    end

  end

end
