require 'rest_client'
require 'uri'
require 'json'

module Cloopen
  class Sender

    # self << class
    #
    # def deliver(cellphone, template_id, contents)
    #   generate_sig_and_auth
    #   get_base_uri
    #   connect_url
    #   fill_json
    #   set_header
    #   send_message
    #   get_result
    # end
    #
    # def generate_sig_and_auth
    #
    # end
    #
    # def get_base_uri
    #
    # end
    #
    # def connect_url
    #
    # end
    #
    # def fill_json
    #
    # end
    #
    # def set_header
    #
    # end
    #
    # def send_message
    #
    # end
    #
    # def get_result
    #
    # end

    # 
    # def self.deliver(cellphone, template_id, contents)
    #   sig_parameter, authorization = Sign.generate_sig_and_auth
    #
    #   if Cloopen.env == "production"
    #     base_uri = "https://app.cloopen.com:8883/2013-12-26/Accounts/"
    #   else
    #     base_uri = "https://sandboxapp.cloopen.com:8883/2013-12-26/Accounts/"
    #   end
    #
    #   sms_url = "#{base_uri}#{Cloopen.account_sid}/Calls/VoiceVerify?sig=#{sig_parameter}"
    #
    #   payload = {
    #     to:         cellphone.to_s,
    #     appId:      Cloopen.app_id.to_s,
    #     templateId: template_id.to_s,
    #     verifyCode: contents,
    #     playTimes:  2.to_s
    #   }.to_json
    #
    #   header = {
    #     "Content-type"  => "application/json;charset=utf-8",
    #     "Accept"        => "application/json",
    #     "Authorization" => authorization
    #   }
    #
    #   res = JSON.parse(RestClient.post sms_url, payload, header)
    #   [res["statusCode"], res["statusMsg"]]
    # end
  end
end
