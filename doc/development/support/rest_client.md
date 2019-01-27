---
author: Hüseyin Tekinaslan
---

`RestClient`
=============

`RestClient` modülü basit bir HTTP ve REST istemcisidir. Arayüzü temel
HTTP metotlarından oluşmaktadır.

- DELETE
- GET
- PATCH
- POST
- PUT

Kullanım
--------

### Prototip

Tüm metotlar aşağıdaki arayüze sahiptir.

```ruby
method(url, header: {}, payload: nil, **http_options)
```

Örnek `GET` isteği

```ruby
RestClient.get('http://example.com')
```

### HTTP Options

İstemci, içeride `net/http` kitaplığını kullanır ve bu ayarlanabilir
değildir. Prototipte görünen `http_object`, içte sarmalanmış olan bu `http`
nesnesine ayar geçirmek için kullanılır.

Kullanılabilir HTTP ayarları ve öntanımlı değerleri

|Option        |Default value              |
|--------------|---------------------------|
|`open_timeout`|`60`                       |
|`read_timeout`|`60`                       |
|`use_ssl`     |`false`                    |
|`verify_mode` |`OpenSSL::SSL::VERIFY_NONE`|

### Authentication

Temel "HTTP Authentication" şeması kullanılmalı.

```ruby
RestClient.get('http://example.com', header: { Authorization: 'Bearer <token>' })
```

### SSL

SSL kullanmak için

```ruby
RestClient.get('https://example.com', use_ssl: true)
```

SSL doğrulama modunu değiştirmek için

```ruby
require 'openssl'

RestClient.get('https://example.com', use_ssl: true, verify_mode: OpenSSL::SSL::VERIFY_PEER)
```

### Timeouts

Verilen değerlerin birim türü **saniye**dir.

```ruby
RestClient.get('https://example.com', use_ssl: true, open_timeout: 5)
RestClient.get('https://example.com', use_ssl: true, read_timeout: 5)
```

HTTP yanıtı
------------

İstek sonucu dönen her yanıt için kullanılabilir metotlar şu şekilde:

|Method  |Description                                                       |
|--------|------------------------------------------------------------------|
|`body`  |HTTP yanıt gövdesi                                                |
|`code`  |HTTP yanıt kodu                                                   |
|`error!`|Yanıt bir HTTP hata sınıfı ise bu hatayı "raise" eder             |
|`decode`|Yanıt gövdesini JSON varsayarak `decode` eder. "Parsing" hatalarını "raise" eder|
|`ok?`   |Yanıt kodu 200 ise `true` aksi halde `false` döner                |

Hata sınıfları
--------------

Bu başlık altında özel olarak belirtilmiş hatalar dışındaki hatalar
için Ruby standart kitaplığına bakın.

### `HTTPMethodError`

`Request` sınıfı "internal" işleri yaptığı için "private"dır. Sınıf düzeyinde
kullanılamaz. Fakat bir şekilde desteklenmeyen bir HTTP metodu ile kullanılırsa
bu hatayı üretir.

```ruby
RestClient::Request.new(:unsupported_http_method)
```

### `HTTPOptionError`

İstek, `net/http` için geçersiz bir HTTP opsiyonu ile yapılırsa bu hata
üretilir. Desteklenen opsiyonlar için dokümanını [bu bölümüne](#http-options)
bakın.

```ruby
RestClient.get('http://example.com', invalid_option: 'value')
```
