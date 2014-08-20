require 'rest_client'
require 'uri'
require 'json'

module Cloopen

  class Sms 

    def initialize(cellphone, tmpl_id, contents)
      @cellphone   = cellphone
      @template_id = tmpl_id
      @contents    = contents
      @sig_parameter, @authorization = Sign.generate_sig_and_auth
    end

    def deliver
      sms_url = "#{Cloopen.sms_uri}/#{Cloopen.account_sid}/SMS/TemplateSMS?sig=#{@sig_parameter}"

      payload = {
        to:         @cellphone,
        appId:      Cloopen.app_id,
        templateId: @template_id,
        datas:      @contents
      }.to_json

      header = {
        "Content-type"  => "application/json;charset=utf-8",
        "Accept"        => "application/json",
        "Authorization" => @authorization
      }

      res = JSON.parse(RestClient.post sms_url, payload, header)
      [res["statusCode"], res["statusMsg"]]

    end

  end

end
