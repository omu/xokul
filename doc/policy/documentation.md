---
author: Hüseyin Tekinaslan (@huseyin)
tags: policy, documentation
---

Dokümantasyon
=============

Dokümanlar, [`doc`](https://github.com/omu/xokul/tree/master/doc) dizini
altında, türlerine göre sınıflandırılmış şekilde tutulmaktadır. Mevcut türlerin
dışındaki katkılar için öncelikle **iş kaydı** açarak doküman türü önerisinde
bulunun.

| Tür                           | Açıklama                                              |
|:------------------------------|:------------------------------------------------------|
| [basics](../basics)           | Problemi, çözümü ve mimariyi anlatan temel dokümanlar |
| [development](../development) | Geliştirici ve katkıcılar için geliştirme dokümanları |
| [operations](../operations)   | Operatör ve sistem yöneticileri için dokümanlar       |
| [policy](../policy)           | Kural ve poliçe dokümanları                           |
| [api](../api)                 | API dokümanları                                       |

*Dokümanlara [docs.omu.sh](doc.omu.sh) üzerinden de ulaşabilirsiniz.*

Kurallar 
--------

- Doküman Markdown formatında yazılmalı
- Dosya isimleri tutarlı ve İngilizce olmalı
- Dosya isimlerinde ayraç olarak hypen (-) kullanılmalı
- Her dokümanda aşağıdaki gibi bir YAML front-matter bulunmalı

  ```markdown
  ---
  author: author
  tags: tags
  ---
  ```

- Markdown dosyaları CI'da statik analiz
  [aracı](https://github.com/markdownlint/markdownlint) tarafından kontrol
  edilir. Depoda belirlenen kurallar çerçevesinde buna dikkat edin

- Yeni eklenen ve/veya isim değişikliğine uğrayan dokümanların indeks kaydını
  [burada](https://github.com/omu/xokul/blob/master/doc/README.md)
  yapın/düzeltin
- Sade ve teknik bir dil kullanın
- Teknik terimleri Türkçeleştirmekten kaçının
