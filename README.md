# Cloopen

云通讯发送短信的 Gem.

## Installation

Add this line to your application's Gemfile:

    gem 'cloopen'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloopen

## Usage

### Config

1. 注册 [云通讯](http://www.yuntongxun.com) ，并通过企业认证（只有企业帐号才可以发短信）。

2. 在 [这个页面](http://www.yuntongxun.com/member/main) 查看 account_sid, auth_token

3. 在 [这个页面](http://www.yuntongxun.com/member/app/view) 创建 App，获得 app_id

4. 在 [这里](http://www.yuntongxun.com/member/smsTemplate/view) 创建你的短信模板

5. 静静等待云通讯的管理员审核

    * App 通过审核
    * 短信模板通过审核

6. 在你的项目中设置以下配置文件

```ruby
Cloopen.account_sid = "Your Yuntongxun Account Sid"
Cloopen.auth_token = "Your Yuntongxun Auth token"
Cloopen.app_id = "Your Yuntongxun App id"

```

### Send Short Message

参数说明：

* cellphone 手机号
* datas 短信模板中的变量的替换值
* template_id 短信模板 id
* evn 分为 production(生产环境), development(测试环境)


```ruby
Cloopen::ShortMessage.send(
  cellphone: "18668189111",
  datas: [" 测试", "测试"],
  template_id: "1"
  env: "production"
)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cloopen/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
