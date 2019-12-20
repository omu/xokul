Osym
====

Osym servisi, SOAP arayüzünü kullanarak [OSYM](https://osym.gov.tr) tarafından sunulan servislerle haberleşir.

Endpoints
---------

Mevcut endpoint ve third-party servisteki karşılıkları tablodadır.

|Endpoint     |Third-party|
|-------------|-----------|
|`Examination`|Sınav servisi

### Examination

Sınav türlerini ve sonuç bilgilerini getiren arayüze sahiptir.

|Action               |Method|Required parameters            |Description|
|---------------------|------|-------------------------------|-----------|
|`groups`             |GET   |-                              |Sınav grup bilgileri
|`result_informations`|GET   |`id_number`, `year`, `group_id`|Kişinin girdiği sınavın sonucuna dair sınav bilgileri

**Not**: Bu endpoint'in şu action'ları eksiktir:

- `sinav_sonuc_xml`
