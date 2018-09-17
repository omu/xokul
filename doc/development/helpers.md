Yardımcılar
===========

Bu dokümanda projenin çeşitli yerlerinde kullanılan yardımcı `class`, `module` ve `method`lar dokümante edilmektedir.

Client
------

`Client`, SOAP istek ve yanıtları için `Savon` istemcisinin sarmalandığı bir sınıftır. İhtiyaç duyulmasının sebebi tutarsız servis yanıtlarındaki kirliliği yönetmek ve hata denetimini genişletmektir.

```ruby
client = Client.new(wsdl_url, savon_options: [])
response = client.request(operation, args: {})
```

### `status_body_path`

Servis yanıtlarının birçoğunda şöyle durumlar var:

- Yanıt hatalı, SOAP ve HTTP hatasız
- Yanıt boş, SOAP veya HTTP hatasız
- Yanıt boş, SOAP hatalı veya HTTP hatasız

Buna rağmen tüm yanıtlarda ortak olan bir durum gövdesi var. Fakat durum gövdesine erişilebilecek standart bir yol yok. Bu değişken ile gövdenin tam yolu tutulmaktadır. Hata denetimi yapılırken bu gövde de ele alınmaktadır.

```ruby
response.status_body_path = %[foo bar baz]
```

### `successful?`

Yanıtın başarılı olup olmadğını döndürür.

```ruby
response.successful?
```

Çeşitli
-------

### `safe_request`

`Client` sınıfı, servisten dönen yanıtın gövdesine ve hata denetimine odaklanmıştır. Fakat servislerin birçoğunda asıl veri, yanıt gövdesinin iç içe geçmiş başka bir düğümündedir. Bu sebeple her metodun bu düğüme giden bir yolu var.

Servislerde kirliliği tek bir dosyada tutmak adına durum gövdesi yolu, asıl veri yolu ve SOAP operasyonu, ilgili endpoint sınıflarında hash olarak tutulmaktadır.

Bu metot, gövde yollarını ve operasyonlarını metot adına göre bularak güvenli ve temiz bir veri döndürür. Bu metodu kullanmak için endpoint'lerde, [burada](#)olduğu gibi sabitler ve hash veri tipleri mutlaka bulunmaktadır.

```ruby
safe_request(method_name, args: {})
```
