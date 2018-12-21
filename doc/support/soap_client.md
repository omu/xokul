---
author: Hüseyin Tekinaslan
---

`SoapClient`
=============

`SoapClient` sınıfı, Savon istemcisini sarmalayan çok basit bir SOAP istemcisidir.

Kullanım
--------

Sınıf nesnesi, arayüzünde iki adet metot bulundurur.

|Method     |Description                                  |
|-----------|---------------------------------------------|
|`configure`|İçerdeki Savon nesnesini yapılandırır        |
|`request`  |Savon nesenesi üzerinden SOAP isteği gönderir|

### İstemci üretme

"Constructor" prototip şu şekilde:

```ruby
SoapClient.new(WSDL_URL, **savon_options)
```

Savon parametreleri hakkında daha detaylı bilgi için
[buraya](http://savonrb.com/) bakın.

### İstek gönderme

```ruby
client = SoapClient.new(WSDL_URL, **savon_options)
client.request(:test_operation, message: {foo: 'bar'})
```

### Konfigürasyon

```ruby
client = SoapClient.new(WSDL_URL, **savon_options)
client.configure do
  namespace foo: 'bar'
  encoding 'UTF-8'
end
```

SOAP yanıtı
-----------

Yanıt, Savon cevabının sarmalanmış ve çeşitli metotlarla zenginleştirilmiş
halidir.

Yanıt nesnesinin sahip olduğu metotlar:

|Method  |Description          |
|--------|---------------------|
|`header`|Yanıt başlığını tutar|
|`body`  |Yanıt gövdesini tutar|
|`dig`   |Yanıt gövdesinin `Hash` formunda, verilen yolu kullanarak değerlere erişen bir erişici metot|
