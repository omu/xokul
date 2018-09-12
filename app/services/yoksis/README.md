YOKSIS
======

Bu servis, SOAP arayüzünü kullanarak [YOKSIS](https://yoksis.yok.gov.tr) tarafından sunulan servislerle haberleşir. Asıl hedefi REST sorgular için formatlanmış, kullanıcı dostu JSON veriler üretmektir.

Dizin yapısı
------------

Geleneksel [Ruby Gem](https://rubygems.org) dizin yapısı kullanılıyor. Birtakım dosyalar hakkında bilinmesi gerekenler şöyle:

- `lib/yoksis/base.rb`: Tüm endpoint'ler için ortak metotların tutulduğu ve daha sonra alt servis sınıflarının miras alacağı tekil bir sınıf tutar.

- `lib/yoksis/constants.rb`: SOAP isteklerinden dönen yanıtların gövdesinde ihtiyaç duyulan asıl veriye, hata gövdesine ve metodun SOAP karşılığına ulaşmak için "hash path"ler tutmak gerekiyor. Bunlar ayrı bir dosyada olmadan isteğin yapıldığı yerde de gerçekleştirilebilir fakat kirliliği kaynak koda bulaştırmamak adına bu dosyadadır.
- `lib/yoksis/endpoints`: Altında alt servis gerçeklemeleri vardır.

Alt servisler (Endpoints)
-------------------------

Kullanılabilir alt servislerin tablosu aşağıdadır. Alt servislere ait metotların YOKSIS karşılıkları için `lib/yoksis/constants.rb` dosyasına bakın.

|Endpoint     |YOKSIS'teki karşılığı    |
|-------------|-------------------------|
|`Graduations`|Mezun Bilgileri          |
|`MEB`        |MEB Mezun Bilgileri      |
|`References` |Referanslar              |
|`Resumes`    |Özgeçmiş                 |
|`Staff`      |Akademik Personel        |
|`Students`   |Öğrenci Sorgulama Servisi|
|`Unit`       |Birimler                 |

Kullanım
--------

Alt servislerin bir kısmı "Authentication" gerektiriyor, buna dikkat edin.

```ruby
references = Services::Yoksis::References.new
puts references.cities
puts references.districts city_code: 55
```