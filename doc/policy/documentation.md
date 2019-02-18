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
| [basics](../basics)           | Problemi ve mimariyi anlatan genel dokümanlar         |
| [development](../development) | Geliştirici ve katkıcılar için geliştirme dokümanları |
| [operations](../operations)   | Operatör ve sistem yöneticileri için dokümanlar       |
| [policy](../policy)           | Kural ve poliçe dokümanları                           |
| [api](../api)                 | API dokümanları                                       |

*Dokümanlara [docs.omu.sh](doc.omu.sh) üzerinden de ulaşabilirsiniz.*

Kurallar
--------

- Doküman formatı Markdown olmalı
- Dosya isimleri tutarlı ve İngilizce olmalı
- Dosya isimlerinde ayraç olarak hypen (`-`) kullanılmalı
- Her dokümanda aşağıdaki gibi bir YAML front-matter olmalı

  ```markdown
  ---
  author: author
  tags: tags
  ---
  ```

- [FIXME] CI'da doküman stili kontrol edilmektedir. Yerel geliştirme ortamınızda
  kullanmak için aşağıdaki araç ve editör eklentilerine bakın

  - [Atom](https://atom.io/packages/linter-markdownlint)
  - [Sublime Text](https://github.com/jonlabelle/SublimeLinter-contrib-markdownlint)
  - [VSCode](https://github.com/DavidAnson/vscode-markdownlint)
  - [Vim](https://github.com/plasticboy/vim-markdown)
  - [Generic Tool](https://github.com/markdownlint/markdownlint)

- Yeni eklenen veya isim/başlık değişikliğine uğrayan dokümanların indeks kaydını
  [burada](https://github.com/omu/xokul/blob/master/doc/README.md) yapın/düzeltin
- Dokümanlarda sade ve teknik bir dil kullanın
- Teknik terimleri Türkçeleştirmekten kaçının
