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