KPS
===

KPS servisi, SOAP arayüzünü kullanarak [KPS](https://kimlikdogrulama.nvi.gov.tr)
tarafından sunulan servislerle haberleşir.

Endpoints
---------

Mevcut endpoint ve third-party servisteki karşılıkları tablodadır.

|Endpoint       |Third-party|
|---------------|-----------|
|`Queries`      |Sorgulama servisleri
|`Verifications`|Doğrulama servisleri

### Queries

Kimlik ve adres sorguları yapan arayüze sahiptir.

|Action      |Method|Required parameters|Description|
|------------|------|-------------------|-----------|
|`addresses` |GET   |`id_number`        |Kişinin adres bilgileri
|`identities`|GET   |`id_number`        |Kişinin kimlik bilgileri

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.

### Verifications

Kişiye ait çeşitli doğrulamalar yapan arayüze sahiptir.

|Action      |Method|Required parameters|Description|
|------------|------|-------------------|-----------|
|`identities`|GET   |`id_number`        |Kişinin kimlik bilgilerini doğrulama

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.
