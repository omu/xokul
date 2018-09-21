Services
========

Servisler, depo kökünden itibaren `app/services` dizini altında konumlandırılmıştır. Tüm servisler tek bir gem gibi davranır ve dizin yapısı ona göre ayarlanmıştır.

Servis
------

### Servis ekleme

- `lib/services` altında servis adında bir dizin ve `service.rb` dosyası oluştur
- `service.rb` dosyasında mutlaka endpoint listesini içeren bir sabit olmalı

  ```ruby
  module Services
    module Service
      ENDPOINTS = %i[]
    end
  end
  ```

- Endpoint eklemek için dokümanın [bu bölümünü](#endpoint-ekleme) incele
- `lib/services.rb` dosyasında servisi `require` et

  ```ruby
  require_relative 'lib/service'
  ```

- `config/routes.rb` dosyasını düzenle

  ```ruby
  namespace :service
  ```

### Doküman ekleme

Servislere ait dokümanlar depo kökünden itibaren `doc/services` dizini altındadır.

Endpoint
--------

### Endpoint ekleme

- `lib/services/service` altında `endpoint.rb` dosyası oluştur
- Eğer servis SOAP ise gerçeklemede yeniden yazılmış olan [Client](https://github.com/omu/xokul/blob/dev/doc/development/helpers.md#soap-client)'ı kullan
- Metot eklemek için dokümanın [bu bölümünü](#metot-ekleme) incele
- `lib/services/service.rb` dosyasında endpoint'i `require` et

  ```ruby
  require_relative 'service/endpoint'
  ```

- Controller oluştur

  ```sh
  rails generate controller service::endpoint
  ```

- `config/routes.rb` dosyasını düzenle

  ```ruby
  namespace(:service) { resources :endpoint }
  ```

### Metot ekleme

- Metotlar `lib/services/service/endpoint.rb` dosyasında gerçeklenmeli
- Controller'da metot ismiyle bir action olmalı
- JSON render etmek için [`render_as_json`](#) yardımcı metodunu kullan
- Action için bir "Serializer" oluştur

  ```sh
  rails generate serializer service::endpoint::method
  ```

- [Talimatları](#) takip ederek "Serialization" işlemini yap
- `config/routes.rb` dosyasını düzenle

  ```ruby
  namespace(:service) { resources(:endpoint) { get :method } }
  ```
