Servisler
=========

YOKSIS
-------

Bu servis, SOAP arayüzünü kullanarak [YOKSIS](https://yoksis.yok.gov.tr) tarafından sunulan servislerle haberleşir. Asıl hedefi REST sorgular için formatlanmış, kullanıcı dostu JSON veriler üretmektir.

### Dizin yapısı

Geleneksel [Ruby Gem](https://rubygems.org) dizin yapısı kullanılıyor.

### Alt servisler (Endpoints)

Kullanılabilir alt servislerin tablosu aşağıdadır. Alt servislere ait metotların YOKSIS karşılıkları için `constants.rb` dosyasına bakın.

|Endpoint     |YOKSIS'teki karşılığı    |
|-------------|-------------------------|
|`Graduations`|Mezun Bilgileri          |
|`MEB`        |MEB Mezun Bilgileri      |
|`References` |Referanslar              |
|`Resumes`    |Özgeçmiş                 |
|`Staff`      |Akademik Personel        |
|`Students`   |Öğrenci Sorgulama Servisi|
|`Unit`       |Birimler                 |

#### Kullanım

Alt servislerin bir kısmı "Authentication" gerektiriyor, buna dikkat edin.

```ruby
references = Services::Yoksis::References.new
puts references.cities
puts references.districts city_code: 55
```