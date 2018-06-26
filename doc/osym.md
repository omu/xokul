OSYM VPS (Veri Paylaşım Sistemi)
================================

- Protocol olarak SOAP
- "Basic Auth" ve "WSSE Auth" var
- Tüm sorgular "GET" method
- Kullanıcı adı ve parola KeePass'te
- Version yok

Operations
----------

|Operation    |Parameters       |
|-------------|-----------------|
|**`SinavGrupBilgileriniGetir`**| -
|**`SinavSonucHtml`**           | `adayTcKimlikNo (optional)`, `sonucId(optional)`
|**`SinavSonucXml`**            | `adayTcKimlikNo (optional)`, `sonucId(optional)`
|**`SinavSonuclariGetir`**      | `adayTcKimlikNo (optional)`, `Yil (optional)`, `grupId (optional)`

WSDL URL https://vps.osym.gov.tr/Ext/Provider/BilgiServisi/Sonuc?wsdl

Durumlar
--------

- Tüm sorgularda parametreler "optional" demesine karşın optional değil. Hepsi
  "mandatory". Eksik parametrede ürettiği hataya da dikkat! Şöyle bir şey

  ```txt
  (999) Sisteme Giriş Hatası (Savon::SOAPFault)
  Kullanıcı veya parola hatalı.
  ```