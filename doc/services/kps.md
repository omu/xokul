KPS
===

KPS servisi, SOAP arayüzünü kullanarak [KPS](https://kimlikdogrulama.nvi.gov.tr) tarafından sunulan servislerle haberleşir.

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

Endpoints:

- https://api.omu.sh/kps/queries/addresses
- https://api.omu.sh/kps/queries/identities

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.

### Verifications

Kişiye ait çeşitli doğrulamalar yapan arayüze sahiptir.

|Action             |Method|Required parameters|Description|
|-------------------|------|-------------------|-----------|
|`identity_cards`   |GET   |`id_number`, `first_name`, `last_name`, `day_of_birth`, `month_of_birth`, `year_of_birth`, `card_serial_code`, `card_number`|Kişinin kimlik kartını doğrular
|`identity_numbers` |GET   |`id_number`, `first_name`, `last_name`, `year_of_birth`                                                                     |Kişinin kimlik numarasını doğrular
|`foreign_nationals`|GET   |`id_number`, `first_name`, `last_name`, `day_of_birth`, `month_of_birth`, `year_of_birth`                                   |Yabancı uyruklu kişi doğrular

- `card_serial_code`: Kimlik kartı üzerindeki seri numarası
- `card_number`: Kimlik kartı üzerindeki kart numarası

Endpoints:

- https://api.omu.sh/kps/verifications/identity_cards
- https://api.omu.sh/kps/verifications/identity_numbers
- https://api.omu.sh/kps/verifications/identity_foreign_nationals
