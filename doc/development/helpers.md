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

String, Integer ve Nil nesneleri için kullanılabilir. Serializer katmanında tipe bağlı hataları absorbe etmek için ihtiyaç duyuldu.

- String nesnelerinde `to_i` metoduyla aynı işi yapar
- Nil nesnelerinde yine `nil` döndürür
- Integer nesnelerinde `to_i` metoduyla aynı işi yapar

#### `safe_to_f`

Nil ve String nesneleri için kullanılabilir.

- String nesnelerinde nesne virgülle yazılmış ise noktayla değiştirerek `Float` sayı döndürür

  ```ruby
  puts '1,3'.safe_to_f # 1.3
  puts '1.3'.safe_to_f # 1.3
  ```

- Nil nesnelerinde ise yine `nil` döndürür

#### `camelize`

Yalnızca Symbol nesneleri için kullanılabilir. Symbol nesnesini `camelize` eder.

```ruby
puts :foo_bar.camelize # FooBar
```

#### `titleize_tr`

Nil ve String nesneleri için kullanılabilir.

- String nesnelerinde "Turkish Special Chars" baz alarak `titleize` yapar

  ```ruby
  puts 'örnek'.titleize_tr # Örnek
  ```

- Nil nesnelerinde yine `nil` döndürür

#### `downcase_tr`

Nil ve String nesneleri için kullanılabilir.

- String nesnelerinde "Turkish Special Chars" baz alarak `downcase` yapar

  ```ruby
  puts 'ÖRNEK'.downcase_tr # örnek
  ```

- Nil nesnelerinde yine `nil` döndürür

#### `upcase_tr`

Nil ve String nesneleri için kullanılabilir.

- String nesnelerinde "Turkish Special Chars" baz alarak `upcase` yapar

  ```ruby
  puts 'örnek'.upcase_tr # ÖRNEK
  ```

- Nil nesnelerinde yine `nil` döndürür

#### `capitalize_tr`

Nil ve String nesneleri için kullanılabilir.

- String nesnelerinde "Turkish Special Chars" baz alarak `capitalize` yapar

  ```ruby
  puts 'örnek bilgi'.capitalize_tr # Örnek bilgi
  ```

- Nil nesnelerinde yine `nil` döndürür