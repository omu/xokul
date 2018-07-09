Xokul
=====

[![Beta](https://assets.omu.sh/badge/beta.svg)](https://baum.omu.edu.tr "BAUM
Beta")
[![CircleCI](https://circleci.com/gh/omu/xokul/tree/master.svg?style=svg&circle-token=35d56d8f2a30dabd31232fa0426841724b2e5789)](https://circleci.com/gh/omu/xokul/tree/master)

Nokul projesi kapsamında geliştirilen bir alt projedir ve kullanılan dış
servislerin tek bir noktadan API olarak hizmet vermesini hedeflemektedir.

Problem
-------

Üniversite bünyesinde geliştirilen çeşitli uygulamalarda kullanılan harici
servislere erişimin mevcut durumda güvenlik zaafiyetleri içermesi, yöntem
sıkıntılarının bulunması ve geliştirici/müşteri mutluluğu açısından son derece
kullanışsız olması.

Harici servisler

- [`YOKSIS`](/doc/yoksis.md)
- [`MERNIS`](/doc/mernis.md)
- [`KAYSIS`](/doc/kaysis.md)
- [`OSYM`](/doc/osym.md)

Mevcut
------

[Bu bölüm henüz olgunlaşmadı. Review'larla veya Twistapp üzerinde açılacak
thread üzerinden katkı verilebilir.]

- Harici servislere erişim gerçek kişilere açılan hesaplar ile sağlanmakta
- Üniversite bu hesaplar üzerinden hizmet dağıtmak için PHP ile [bir
  servis](https://services.omu.edu.tr) geliştirmiş
- Hesap bilgileri kaynak kodda "clear-text" olarak tutuluyor
- Bu anlamda hem yöntem hem de güvenlik açısından oldukça kötü durumda
- İstemciler servise IP bazlı izinlerle erişiyor ve bu kısıtlama kaynak kodda
  gerçeklenmiş. Yani her IP eklemesi için kaynak kod değişmekte
- Kaynak kodda yapılan değişiklik FTP ile tekrar sunucuya gönderiliyor. Bu
  sebeple sürüm kontrolü yok
- Hiçbir noktada API dokümantasyonu mevcut değil
- Metotlar ve çoğu zaman çağrı cevapları tutarsız
- Herhangi bir loglama ve analitik tool kullanılmamış
- Servisin bir yedeği yok
- Servisin deploy edildiği sunucuya erişim birçok kişiye verilmiş ve erişim
  denetimi yok

Hedef
-----

Tüm bu servislere erişimin tek bir noktadan yapılmasına olanak sağlayan **API
servisi** ve bunu takip eden **teknolojiler bütünü**.

Filozofi
--------

"UX ilk kez tadılan yemek gibidir. İlk deneyim kötüyse nedenleri önemsizleşir ve
her zaman ön yargı taşır." felsefesiyle yola çıkarak bazı hususlar göz önünde
tutuldu.

### Basitlik

Kullanıcı açısından bakıldığında API kullanarak bir işi yapması ne kadar basit?
Geliştirici açısından bakıldığında ise mimari veya codebase ne kadar
anlaşılabilir ve adapte olunabilir?

### Dokümantasyon ve açıklık

Kullanıcı, kullanacağı API metoduna ait bir dokümana sahip mi? Eğer sahipse
doküman yeterli seviyede açıklayılığa sahip mi?

### Tutarlılık

API ait davranışlar tutarlı mı? Yani ilgili API çağrısı için dönen cevap, durum
yönünden veya format olarak tutarlı ve dokümanda doğru mu?

### Standartlara uygunluk

En önemli hususlardan birisidir. Tasarımın belirli bir standarda uygun olması
hem mevcut geliştiricinin hem de sonradan ekibe dahil olacak geliştiricilerin
adaptasyon sürecinde harcayacağı eforu minimuma indirger. Katkı verilebilirlik
ve sürdürülebilirliği artırır. Tasarımı güvenli hale getirir ve kullanıcının
işini kolaylaştırır.

İdeal
-----

Çeşitli okumlar sonucu çıkarımlara göre ideal bir API servisinde olması gereken
standartlar aşağıdaki gibi. Fakat bu standartların hepsini "codebase"de
gerçeklemek oldukça maliyetli olduğu için sıklıkla "3rd-party tooling"
kullanılmakta.

- API conventions

  - Naming
  - Versioning
  - Routing
  - Error handling and true status codes
  - Filtering

- Authentication
- Documentation
- Security

  - SSL
  - IP restriction

- Traffic Control

  - Rate limiting

- Logging
- Analytics

MVP
---

MVP'de beklenen çıktı şu şekilde

- Harici servislerin tüm lojik pisliğini halı altına süpürüp, kullanıcıya daha
  iyi bir API arayüzü sunan bir servis

  Bu servis şu 4 konvansiyona sahip olmalı

  1. Naming convention
  2. Versioning
  3. Routing
  4. Error handling

- Test edilebilirlik
- Güvenli bir "authentication" katmanı

Mimari
------

![Mimari](https://raw.githubusercontent.com/omu/xokul/master/misc/architecture.png?token=AKVjCgM_IjL06JzOL2_15DRq9Di8U1xMks5bNjZTwA%3D%3D)

İstemci, hedeflenen durumda geliştiricidir. Geliştirici API çağrısı yapmak
istediği servisin endpoint'ini bilmek zorunda değildir. Servis adını ve API
isimlendirme konvansiyonunu bilmesi yeterlidir. Geliştirici tarafından
gönderilen istek API gateway servisine ulaşır.

API Gateway servisi bir "orchestrator" görevi görmektedir. Sıklıkla
"microservice" mimarisinde kullanılmasına rağmen burada Authentication, Logging,
Analytic ve Security katmanlarının yükünü API servisten alması yönüyle
bulunmaktadır. Kendisine gelen isteği "authorize" ederek belirli yönergeleri
takip eder ve backend servise gönderir. Ayrıca "Load Balancing" desteği ile
isteği ölçeklenmiş backend servislere taşıyıp, cevap dönebilir.

API servisi tüm alt servislere ait bilgi ve yöntemleri bulunduran "monolithic"
bir uygulamadır. Tüm request-response lojiği bu katmanda yer almaktadır.
"Response" API gateway servisine taşınır.

Gerçekleme
----------

### API servisi

- Rails API only
- Ruby, Rails ve kullanılan her kitaplık sürekli güncel
- "Code quality" için [Codacy](https://www.codacy.com), "linter" için
  [Rubocop](http://rubocop.readthedocs.io/en/latest)
- VCS olarak Git ve servis olarak GitHub
- CI olarak [Circle CI 2.0](https://circleci.com)
- Serializer olarak [JSON-API](http://jsonapi.org)
- Test için henüz karar yok, "minitest" ve "rspec" bakmak gerek
- MVP konvansiyonlarını karşılayan

#### Naming (WIP)

- Tek bir kök URL kullanılmalı

  ```txt
  https://api.<domain>
  ```

- Kök URL sonrası servis adı kullanılmalı. Version bilgisi, servis adı
  sonrasında gelmeli

  ```txt
  https://api.<domain>/<service>/<version>
  ```

- Çoğu zaman `GET` metodunun kullanmasını da göz önünde tutarak API
  fonksiyonları "plural (çoğul)" olmalı

  ```txt
  https://api.<domain>/<service>/<version>/<function>s
  ```

### API Gateway

API Gateway olarak [Kong](https://konghq.com) tercih edildi.

### Dokümantasyon

Dokümantasyon için [API BluePrint](https://apiblueprint.org) düşünülüyor.

İş akışı
--------

- Harici servislere ait dokümanları [`doc`](/doc) dizini altında tut
- Test betikleri [`scripts`](/scripts) dizini altında tut
- Proje detaylarını [`README.md`](/README.md) dosyasında tut
- Proje yönetimini [Tayga](https://tayga.omu.sh)'da yap
- Geliştirmeyi "feature-branch"larda yap ve "master" dalına PR aç
- Her PR'ın CI'dan geçiyor olmasına dikkat et
- Her yeni özellik için mümkün oldukça test yaz

License
-------

The MIT License - see [`LICENSE`](/LICENSE) for more details