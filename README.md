Xokul
=====

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
  sepeble sürüm kontrolü yok
- Hiçbir noktada API dokümantasyonu mevcut değil
- Metotlar ve çoğu zaman çağrı cevapları tutarsız
- Herhangi bir loglama ve analitik tool kullanılmamış
- Servisin bir yedeği yok
- Servisin deploy edildiği sunucuya erişim birçok kişiye verilmiş ve erişim
  denetimi yok

Hedef
-----

Tüm bu servislere erişimin tek bir noktadan yapılmasına olanak sağlayan **API
servisi**

Çıktıda beklenen minimum özellikler (MVP):

- Anlamlı endpoint ve path'lere sahip olmalı
- Herbir servis versiyonlanabilir olmalı
- Dokümantasyon olmalı ve API versiyonlarını takip ediyor olmalı
- Authentication katmanı olmalı (LDAP-based ve/veya diğer)
- Security katmanı olmalı
- Logging katmanı olmalı
- Analytic katmanı olmalı
- Eğer mümkünse ölçeklenebilir olmalı

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
bulunmaktadır. Kendisine gelen isteği authorize ederek belirli yönergeleri takip
eder ve backend servise gönderir. Ayrıca "Load Balancing" desteği ile isteği
ölçeklenmiş backend servislere taşıyıp, cevap dönebilir.

API servisi tüm alt servislere ait bilgi ve yöntemleri bulunduran "monolithic"
bir uygulamadır. Tüm request-response lojiği bu katmanda yer almaktadır.
"Response" API gateway servisine taşınır.

Gerçekleme
----------

WIP

### Konvansiyonlar

Gerçeklemede aşağıdaki herbir API tasarım prensibindeki ilkeler uygulanacaktır.

#### 1. İsimlendirme (naming)

WIP

#### 2. Versiyonlama (versioning)

WIP

#### 3. Metotlar (methods)

WIP

### API Gateway

WIP

### API servis

WIP

### Dokümantasyon

WIP

### DevOps

WIP

Yol Haritası (WIP)
------------------

- Test için Kong kur