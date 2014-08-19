require 'rest_client'
require 'json'

module Cloopen
  module ShortMessage
    # options = {
    #   cellphone: "18668189882",
    #   template_id: "1",
    #   datas: ["test", "test"],
    #   env: "production",
    # }
    def self.send(options)
      sig_parameter, authorization = Cloopen::Sign.generate_sig_and_auth

      if options[:env] == "production"
        api_uri = "https://app.cloopen.com:8883/2013-12-26/Accounts/"
      else
        api_uri = "https://sandboxapp.cloopen.com:8883/2013-12-26/Accounts/"
      end

      url = api_uri + Cloopen.account_sid + "/SMS/TemplateSMS?sig=" + sig_parameter

      payload = {
        "to"         => options[:cellphone],
        "appId"      => Cloopen.app_id,
        "templateId" => options[:template_id],
        "datas"      => options[:datas]
      }.to_json

      header = {
        "Content-type" => "application/json;charset=utf-8",
        "Accept" => "application/json",
        "Authorization" => authorization
      }

      res = RestClient.post url, payload, header
      result(res)
    end

    def self.result(res)
      res = JSON.parse res
      {
        statusCode: res["statusCode"],
        statusMsg:  res["statusMsg"]
      }
    end
  end
end