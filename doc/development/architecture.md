Genel Bakış
===========

Projede iki temel parça vardır. Bu iki parça, "production" ortamında teknik olarak sınırları belirlenmiş görevleri
yerine getiren iki ayrı katmandır.

1. 3rd-party servislerle haberleşen ve JSON olarak servis eden uygulama katmanı
2. API Gateway katmanı

![Diagram](https://raw.githubusercontent.com/omu/xokul/dev/doc/development/img/application.png?token=AKVjCh5Dga2UwAmMPXwj5Vjpco3dKgIzks5bqL9bwA%3D%3D)

Monolitik API Uygulaması
------------------------

Bu katmanda hedef 3rd-party servislerle haberleşmek ve formatlanmış JSON veriler döndürmektir.

Authentication, Security, Traffic Control, Logging gibi mekanizmalar gerçekleme maliyeti açısından uygulamadan
soyutlanmıştır.

Uygulama, Ruby on Rails ile "API only" olarak geliştirilmektedir. Servisler, mikroservis mimarisinin aksine tek bir
yerde gerçeklenmekte ve uygulama ile servis edilmektedir.

Servislere genel olarak SOAP ile erişilmektedir. Ruby özelinde bu istekler "Savon" ile yapılır. Bununla birlikte dönen
yanıtlar XML'dir ve JSON olarak "serialize" edilmeye ihtiyaç duyar. Serializing işlemi "controller" katmanında
tetiklenir ve "Active Model Serializer" ile yapılır.

![Diagram](https://raw.githubusercontent.com/omu/xokul/dev/doc/development/img/architecture.png?token=AKVjClTUTlRPrnl0ZIMTueGgRDECE1u0ks5bqL96wA%3D%3D)

API Gateway
-----------

API Gateway temel olarak Nginx vb. web sunuculara benzer bir iş yapmaktadır. HTTP üzerinden gelen istekleri API'ye ait
backend uçlarına iletir. Avantaj olarak görülebilecek nokta farklı türdeki API endpoint'lerin organizasyonunu sağlamak
ve endpoint özelinde çeşitli doğrulama ve/veya kısıtlamalar yapabilmektir.

API Gateway olarak Kong Community Edition (CE) sürümü kullanılmaktadır. Kong, açık kaynaktır ve belirli bir komüniteye
sahiptir.

Tüm API istekleri ilk olarak buraya yapılır. Yapılan istek, önceden belirlenmiş yönergeler izlenerek uygulamaya
gönderilir. Ayrıca Authentication ve Traffic Control tamamen bu katmandadır ve "consumer" özelinde yapılır. DNS
kayıtları da bu makine baz alınarak oluşturulmaktadır
