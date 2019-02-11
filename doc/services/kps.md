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

|Action      |Method|Required parameters|Description|
|------------|------|-------------------|-----------|
|`id_cards`  |GET   |`id_number`, `first_name`, `last_name`, `day_of_birth`, `month_of_birth`, `year_of_birth`, `serial`, `number`, `document_number`|Kişinin kimlik kartını doğrular
|`id_numbers`|GET   |`id_number`, `first_name`, `last_name`, `year_of_birth`                                                                         |Kişinin kimlik numarasını doğrular

- `serial`: Kimlik kartı üzerindeki seri numarası
- `number`: Kimlik kartı üzerindeki kart numarası
- `document_number`: Dijital kimlik kartları üzerindeki seri numarası

**Not:** Yabancı ve Türk uyruklu kimlik doğrulamaları tek bir endpoint üzerinden
yapılmaktadır. Bu yüzden `/id_cards` endpoint'i için her iki doğrulamada da
aşağıdaki parametreler zorunlu iken sadece Türk uyrukluları doğrularken
`serial` ve `number` eklenmelidir. Doğrulanan kişi için `document_number`
kullanılacak ise `serial` ve `number` kullanmayın.

- `id_number`
- `first_name`
- `last_name`
- `day_of_birth`
- `month_of_birth`
- `year_of_birth`

Endpoints:

- https://api.omu.sh/kps/verifications/identity_cards
- https://api.omu.sh/kps/verifications/identity_numbers
- https://api.omu.sh/kps/verifications/identity_foreign_nationals
