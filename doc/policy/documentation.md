---
author: Hüseyin Tekinaslan (@huseyin)
tags: policy, documentation
---

Dokümantasyon
=============

Dokümanlar, [`doc`](https://github.com/omu/xokul/tree/master/doc) dizini
altında, kategorize edilmiş şekilde tutulmaktadır. 

Kategorizasyon
--------------

Kategorizasyon oldukça detaylı ve esnektir. Mevcut kategorilerin dışındaki
katkılar için öncelikle iş kaydı açarak kategori önerisinde bulunun.

### `api`

Xokul tarafından ekspoze edilen API uçlarının
dokümanları yer alır.

### `basics`

Xokul'a ait problem tanımı, çözüm ve mimari gibi temel dokümanlar yer alır.

### `development`

Xokul'un geliştirme dokümanları yer alır.

### `operations`

Xokul'un operasyon dokümanları yer alır. Dokümanlar her bir bileşenin kurulum,
konuşlandırma, yükseltme ve yedekleme süreçlerini barındırır.

### `policy`

Proje ve depo organizasyonuna ait çeşitli kural ve poliçe dokümanları yer alır.

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

- CI'da doküman stili kontrol edilmektedir. Yerel geliştirme ortamınızda
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
