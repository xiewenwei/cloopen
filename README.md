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

### 申请云通讯的短信通道服务

1. 注册 [云通讯](http://www.yuntongxun.com) ，申请企业认证（只有企业帐号才可以发短信）。

2. 在 [这个页面](http://www.yuntongxun.com/member/main) 查看帐号的 account_sid, auth_token

3. 在 [这个页面](http://www.yuntongxun.com/member/app/view) 创建 App，获得 app_id

4. 在 [这里](http://www.yuntongxun.com/member/smsTemplate/view) 创建你的短信模板，比如：

    `【薄荷网】您的的验证码是{1}`

5. 等待云通讯的管理员审核，大概需要 2 个小时的时间。

    * App 通过审核
    * 短信模板通过审核

### 生成配置文件

1. 执行 `rails g cloopen` 生成配置文件 `config/initialiers/cloopen_setup.rb`

2. 替换 sid、token、app_id、env

```ruby
# config/initialiers/cloopen_setup.rb
Cloopen.account_sid = "Your Yuntongxun Account Sid"
Cloopen.auth_token = "Your Yuntongxun Auth token"
Cloopen.app_id = "Your Yuntongxun App id"
Cloopen.env = "production" # 如果是测试环境，填写 "development"
```


### 发送短信

```ruby
  Cloopen::SMS.deliver(18668189884, 3127, ['a32d1k'])
```
* 第一个参数是手机号码

* 第二个是模板id。只有模板通过审核后，才可以用这个模板发短信。

* 第三个是模板中的变量的值。用于替换  `【薄荷网】您的的验证码是{1}` 中的变量。

## 荣耀归给仨小伙

* [tteng](http://github.com/tteng)
* [xiaoronglv](https://github.com/xiaoronglv)
* [Teddy](https://github.com/teddy1004)

## Contributing

1. Fork it ( https://github.com/xiaoronglv/cloopen/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
