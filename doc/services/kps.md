KPS
===

KPS servisi, SOAP arayüzünü kullanarak [KPS](https://kimlikdogrulama.nvi.gov.tr) tarafından sunulan servislerle haberleşir.

Endpoints
---------

Mevcut endpoint ve YOKSIS'teki karşılıkları tablodadır.

|Endpoint       |KPS'deki karşılığı       |
|---------------|-------------------------|
|`Queries`      |Sorgulama servisleri     |
|`Verifications`|Doğrulama servisleri     |

### Queries

Kimlik ve adres sorguları yapan arayüze sahiptir.

|Action      |Method  |Required parameters|
|------------|--------|-------------------|
|`addresses` |GET     |`id_number`        |
|`identities`|GET     |`id_number`        |