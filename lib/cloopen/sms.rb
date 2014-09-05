require 'rest_client'
require 'uri'
require 'json'

module Cloopen
  module SMS
    # 发送短信
    # Cloopen::SMS.deliver(18668189882, 3127, ["w1n2ty"])
    # 手机号: 18668189882
    # 模板 id: 3127
    # 模板变量替换值: ["937218"]
    def self.deliver(cellphone, template_id, contents)
      sig_parameter, authorization = Sign.generate_sig_and_auth

      if Cloopen.env == "production"
        base_uri = "https://app.cloopen.com:8883/2013-12-26/Accounts/"
      else
        base_uri = "https://sandboxapp.cloopen.com:8883/2013-12-26/Accounts/"
      end

      sms_url = "#{base_uri}#{Cloopen.account_sid}/SMS/TemplateSMS?sig=#{sig_parameter}"


      # 不得不说一个很奇葩的问题，java 的强类型弱爆了！
      # 所有的参数必须是 string， integer 会报错 500
      # * 错误的datas: [311233, 112311]
      # * 正确的datas: ["311233", "112311"]
      payload = {
        to:         cellphone.to_s,
        appId:      Cloopen.app_id.to_s,
        templateId: template_id.to_s,
        datas:      contents.map(&:to_s)
      }.to_json

      header = {
        "Content-type"  => "application/json;charset=utf-8",
        "Accept"        => "application/json",
        "Authorization" => authorization
      }

      res = JSON.parse(RestClient.post sms_url, payload, header)
      [res["statusCode"], res["statusMsg"]]
    end
  end
end
