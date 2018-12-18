Serialization
=============

Serialization, third-party servise yapılan istekten dönen JSON verinin "key" ve
"value" yönünden işlenerek yeni bir JSON veri üretme işlemidir.

Third-party servise istek "controller"da yapılır. Servise ait "serializer"
dosyaları
[`app/serializers`](https://github.com/omu/xokul/tree/dev/app/serializers)
dizini altındadır.

Serializer, istek sonrasında `render_as_json` "controller" yardımcısıyla
tetiklenir. Bu yardımcı, isteğin hangi "controller", hangi "service" ve hangi
"action"dan yapıldığını tespit ederek ilgili "serializer"ı çalıştırır ve sonucu
JSON olarak "render" eder.

```ruby
render_as_json @endpoint.action key: value
```

Object serialize
----------------

Object serialize, JSON türündeki yanıtın "serialize" edilmesidir. Öncelikle
"controller" ve third-party servise yapılacak isteğin olduğu "action"
gerçeklenmelidir. Bunun için [şu
dokümanı](https://github.com/omu/xokul/blob/dev/doc/howto/services.md)
inceleyin.

- Serializer oluştur

  ```sh
  rails generate serializer service::endpoint::method
  ```

- Serializer, baz bir sınıftan miras almalı

  ```ruby
  module Service
    module Endpoint
      class MethodSerializer < Serializer
      end
    end
  end
  ```

- Serializer altında sadece tek seviyede `attribute` ve `attributes` isimli
  kullanabileceğimiz iki adet metot var. Bu metotlar, işlenecek verinin
  "key"lerini oluşturur.

  ```ruby
  module Service
    module Endpoint
      class MethodSerializer < Serializer
        attribute :foo # { foo: nil }
      end
    end
  end
  ```

- Yukarıdaki metotlarda sadece blok içinde kullanabileceğimiz `object` isimli
  bir değişken var. Bu değişken, "serializer"a gönderilen veriyi tutar.

  ```ruby
  module Service
    module Endpoint
      class MethodSerializer < Serializer
        # object: { bar: 'baz' }
        attribute(:foo) { object[:bar] } # { foo: 'baz' }
      end
    end
  end
  ```

- `attribute` içerisinde `attribute` kullanılamaz. Bu tip durumlarda `attribute`
  hash dönmeli

  ```ruby
  module Service
    module Endpoint
      class MethodSerializer < Serializer
        # object: { hede: 'hodo' }
        attribute(:foo) do
          {
            bar: object[:hede]
          }
        end # { foo: { hede: 'hodo' } }
      end
    end
  end
  ```

- Eğer gün, ay, yıl kullanarak tarih üretmek gerekiyorsa baz `Serializer` sınıf
  içerisinde bunun için bir yardımcı var

  ```ruby
  build_date(year, month, day)
  ```

- Eğer saat, dakika, saniye kullanarak zaman üretmek gerekiyorsa baz
  `Serializer` sınıf içerisinde bunun için bir yardımcı var

  ```ruby
  build_time(year, month, day, hour, minute, second)
  ```

  Dikkat, bu metod UTC kullanır.
