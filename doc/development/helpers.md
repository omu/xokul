Çeşitli Yardımcılar
===================

Bu dokümanda projenin çeşitli yerlerinde kullanılan yardımcı `class`, `module` ve `method`lar dokümante edilmektedir.

SOAP Client
-----------

### Client

Client, SOAP istek ve yanıtları için [`savon`](https://savonrb.com) istemcisinin sarmalandığı bir sınıftır. İhtiyaç duyulmasının sebebi, tutarsız servis yanıtlarındaki kirliliği yönetmek ve hata denetimini genişletmektir. 

Gerçekleme, `lib/client` dizini altındadır.

```ruby
client = Client.new(wsdl_url, savon_options: { basic_auth: [username, password] })
```

#### `add_soap_header(key, value)`

SOAP istemcisine başlık ekler. Aldığı ilk argüman başlık anahtarı, ikinci argüman ise değeridir.

```ruby
client.add_soap_header 'foo', 'bar'
```

#### `add_namespace(key, value)`

SOAP sorgusundaki XML gövde için bir namespace builder'dır.

```ruby
client.add_namespace 'xmlns:foo', 'http://example.com'
```

#### `configure`

İstemci ayarlayıcısıdır. Savon istemcisindeki parametrelerin özelleştirilmesini kolaylaştırır.

```ruby
client.configure do |config|
  config.encoding 'UTF-8'
end
```

#### `request(operation, args: {})`

İlk argümanı istek yapılacak SOAP operation'dır. Aldığı ikinci hash tipindeki argüman ise istek mesajıdır (message).

```ruby
response = client.request :foo, args: { bar: ' baz' }
```

### Response

SOAP isteklerinden dönen yanıtları temsil eder.

#### `dig(*args)`

Yanıt gövdesi daima `Hash` nesnesidir. Bu metod, hash nesnesinde değeri alınmak istenen `key`e giden yolu (path) argüman olarak alır.

```ruby
response.dig(:foo, :bar, :baz)
```

Support
-------

Code base'in çeşitli yerlerinde kullanılan yardımcıları içerir. Tüm gerçeklemeler `lib/support` dizini altındadır.

### Core Exts

#### `safe_to_i`

String, Integer ve Nil sınıfları için gerçeklendi. Serializer katmanında tipe bağlı hataları absorbe etmek için yazıldı.

- String sınıfında `to_i` metoduyla aynı işi yapar
- Nil sınıfında `nil` döndürür
- Integer sınıfında `to_i` metoduyla aynı işi yapar

#### `safe_to_f`

Nil ve String sınıfları için gerçeklendi.

- String sınıfında `float` sayı eğer virgülle yazılmış ise noktayla değiştirerek `Float` sayı nesnesi döndürür

  ```ruby
  puts '1,3'.safe_to_f # 1.3
  puts '1.3'.safe_to_f # 1.3
  ```

- Nil sınıfında ise yine `nil` döndürür

#### `camelize`

Yalnızca Symbol nesneleri için geçerlidir. Symbol nesnesini `camelize` eder.

```ruby
puts :foo_bar.camelize # FooBar
```