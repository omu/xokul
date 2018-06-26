YOKSIS API
==========

- Protocol olarak SOAP
- "Basic Auth" var
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
- Versionlama var, şu an ki version `v2` olarak geçiyor ve `v1` kaldırılmış

### Operations

|Operation                               |Parameters         |
|----------------------------------------|-------------------|
|**`TcKimlikNoilMezunOgrenciSorgulav2`** | `TCKNO (required)`

*WSDL URL* https://servisler.yok.gov.tr/ws/TcKimlikNoileMezunOgrenciSorgulav2?WSDL