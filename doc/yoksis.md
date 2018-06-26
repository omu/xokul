YOKSIS API
==========

- Protocol olarak SOAP
- Authentication için YOKSIS web servislerine erişebilen bir kullanıcı gerekli
  (şu an bu kişi İsmail Can) fakat İsmail Can, istekler için farklı YOKSIS
  kullanıcılarına da rol atanabiliyor
- YOKSIS kullanıcı adı ve parola KeePass'te

Referanslar
-----------

- Tüm istekler GET metodu
- Versionlama var, şu an ki version `v1` olarak geçiyor

### Operations

|Operation                        |Parameters       |
|---------------------------------|-----------------|
|**`getAktiflikDurumu`**          | -
|**`getBirimTuru`**               | -
|**`getCezaTuru`**                | -
|**`getGirisTuru`**               | -
|**`getIdariBirimler`**           | -
|**`getIlGetir`**                 | -
|**`getIlceGetir`**               | `ILKODU`
|**`getKadroGorevUnvan`**         | -
|**`getKodBid`**                  | -
|**`getMernisCinsiyet`**          | -
|**`getMernisUlke`**              | -
|**`getMernisUyruk`**             | -
|**`getOgrenciAyrilmaNedeni`**    | -
|**`getOgrenciDoykm`**            | -
|**`getOgrenciEngelTuru`**        | -
|**`getOgrenciSehitGaziYakini`**  | -
|**`getOgrenciGirisPuanTuru`**    | -
|**`getOgrenciGirisTuru`**        | -
|**`getOgrencilikStatusu`**       | -
|**`getOgrenciOgrencilikHakki`**  | -
|**`getOgrenciSinif`**            | -
|**`getOgrenimDili`**             | -
|**`getOgrenimTuru`**             | -
|**`getPersonelGorev`**           | -
|**`getUniversiteTuru`**          | -

*WSDL URL* https://servisler.yok.gov.tr/ws/Referanslarv1?WSDL

Akademik Personel
-----------------

- Tüm istekler GET metodu
- "Basic Auth" var, İsmail Can'ın kullanıcı adı ve parolası gerekli
- Versionlama var, şu an ki version `v1` olarak geçiyor

### Operations

|Operation                        |Parameters       |
|---------------------------------|-----------------|
|**`getMernisUyruk`**             | -
|**`kullaniciyaGoreTcKimlikNodan_Akademik_Personel_Bilgisiv1`**                  | `AKPER_TC_KIMLIK_NO (required)`, `SORGULAYAN_TC_KIMLIK_NO (required)`
|**`kullaniciyaGoreUniversitedeki_Akademik_Personel_Bilgisiv1`**                 | `SORGULAYAN_TC_KIMLIK_NO (required)`, `PAGE (required)`
|**`kullaniciyaGoreUniversiteki_Akademik_Personel_SayfaSayisiv1`**               | `SORGULAYAN_TC_KIMLIK_NO (required)`

*WSDL URL* http://servisler.yok.gov.tr/ws/UniversiteAkademikPersonelv1?WSDL

Mezun Bilgileri
---------------

- Tüm istekler GET metodu
- "Basic Auth" var, "client id" ve "client secret" gerekiyor. Bu bilgi
  KeePass'te
- Versionlama var, şu an ki version `v2` olarak geçiyor ve `v1` kaldırılmış

### Operations

|Operation                               |Parameters         |
|----------------------------------------|-------------------|
|**`TcKimlikNoilMezunOgrenciSorgulav2`** | `TCKNO (optional)`

*WSDL URL* https://servisler.yok.gov.tr/ws/TcKimlikNoileMezunOgrenciSorgulav2?WSDL

### Durumlar

- Parametre "optional". Cevap olarak değeri "nil" olan "key - value" çiftleri
  dönüyor

Birimler
--------

- Tüm istekler GET metodu
- Versionlama var, şu an ki version `v4` olarak geçiyor diğerleri kaldırılmış

### Operations

|Operation                            |Parameters            |
|-------------------------------------|----------------------|
|**`UniversiteleriGetirv4`**          | -
|**`AltBirimdekiProgramlariGetirv4`** | `BIRIM_ID (optional)`
|**`AltBirimleriGetirv4`**            | `BIRIM_ID (optional)`
|**`TarihtenBirimDegisiklikGetirv4`** | `GUN (required)`, `AY (required)`, `YIL (required)`
|**`IDdenBirimAdiGetirv4`**           | `BIRIM_ID (optional)`

*WSDL URL* https://servisler.yok.gov.tr/ws/UniversiteBirimlerv4?WSDL

### Durumlar

- "optional" parametreye sahip tüm isteklerde cevap değeri "nil" olan "key -
  value" çiftleriyle dönüyor
- `TarihtenBirimDegisiklikGetirv4` parametreler boş gönderilirse `Sistem Hatası`
  diye bir hata dönüyor

Elektronik Kayıt
----------------

- Tüm istekler GET metodu
- "Basic Auth" var, "client id" ve "client secret" gerekli. Bu bilgi KeePass'te
- Versionlama var, şu an ki version `v1` olarak geçiyor

### Operations

|Operation                            |Parameters            |
|-------------------------------------|----------------------|
|**`BelirtilenGunOnlineKayitOlanOgrencileriGetirv1`** | `GUN (required)`, `AY (required)`, `YIL (required)`, `YOKSIS_UNIVERSITE_BIRIM_ID (required)`
|**`TcKimlikNoileOnlineKayitOgrenciBilgiGetirv1`**    | `TCKN (required)`, `YOKSIS_UNIVERSITE_BIRIM_ID (required)`
|**`VakifOgrenimUcretiv1`**                           | `TCKN (required)`, `OGRENIM_UCRETI_ODENDI_MI (required`, `OGRENIM_UCRETI_ODENDI_MI (required)`

*WSDL URL* https://servisler.yok.gov.tr/ws/ekayitv1?wsdl

Öğrenci Sorgulama (Mezunlar hariç)
----------------------------------

- Tüm istekler GET metodu
- "Basic Auth" var, "client id" ve "client secret" gerekli. Bu bilgi KeePass'te
- Versionlama var, şu an ki version `v4` olarak geçiyor, diğer versionlar
  kaldırılmış

### Operations

|Operation                                |Parameters            |
|-----------------------------------------|----------------------|
|**`TcKimlikNoileOgrenciSorgulaDetayv4`** | `TC_KIMLIK_NO (required)`

*WSDL URL* https://servisler.yok.gov.tr/ws/TcKimlikNoileOgrenciSorgulaDetayv4?WSDL