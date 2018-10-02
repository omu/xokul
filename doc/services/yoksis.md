Yoksis
======

Yoksis servisi, SOAP arayüzünü kullanarak [YOKSIS](https://yoksis.yok.gov.tr) tarafından sunulan servislerle haberleşir.

Endpoints
---------

Mevcut endpoint ve third-party servisteki karşılıkları tablodadır.

|Endpoint     |Third-party|
|-------------|-----------|
|`Graduations`|Mezun Bilgileri
|`MEB`        |MEB Mezun Bilgileri
|`Military`   |Askerlik bilgileri
|`References` |Referanslar
|`Resumes`    |Özgeçmiş
|`Staff`      |Akademik Personel
|`Students`   |Öğrenci Sorgulama Servisi
|`Units`      |Birimler

### Graduations

Üniversite mezun bilgileri sunan arayüze sahiptir.

|Action        |Method|Required parameters|Description|
|--------------|------|-------------------|-----------|
|`informations`|GET   |`id_number`        |Üniversite mezun öğrenci bilgileri

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.

### MEB

MEB mezun bilgileri sunan arayüze sahiptir.

|Action    |Method|Required parameters|Description|
|----------|------|-------------------|-----------|
|`students`|GET   |`id_number`        |MEB mezun öğrenci bilgileri

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.

### Military

Askerlik bilgilerini sunan arayüze sahiptir.

|Action        |Method|Required parameters|Description|
|--------------|------|-------------------|-----------|
|`informations`|GET   |`id_number`        |Kişinin askerlik durumunu

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.

### References

Çeşitli referanslar sunan arayüze sahiptir.

|Action                        |Method|Required parameters|Description|
|------------------------------|------|-------------------|-----------|
|`administrative_functions`    |GET   |-                  |Personel görev referansları
|`administrative_units`        |GET   |-                  |İdari birim referansları
|`cities`                      |GET   |-                  |Şehir referansları
|`countries`                   |GET   |-                  |Ülke referansları
|`districts`                   |GET   |`city_code`        |İlçe referansları
|`entrance_types`              |GET   |-                  |Giriş türü referansları
|`gender`                      |GET   |-                  |Cinsiyet referansları
|`kod_bid`                     |GET   |-                  |-
|`martyrs_relatives`           |GET   |-                  |Şehit veya gazi yakını referansları
|`nationalities`               |GET   |-                  |Uyruk referansları
|`staff_titles`                |GET   |-                  |Kadro görev ve ünvan referansları
|`student_disability_types`    |GET   |-                  |Öğrenci engel durumu türleri referansları
|`student_dropout_types`       |GET   |-                  |Öğrenci ayrılma türleri referansları
|`student_education_levels`    |GET   |-                  |Öğrenci eğitim seviyesi referansları
|`student_entrance_point_types`|GET   |-                  |Öğrenci giriş puan türleri referansları
|`student_entrance_types`      |GET   |-                  |Öğrenci girş türleri referansları
|`student_grades`              |GET   |-                  |Öğrenci sınıf referansları
|`student_grading_systems`     |GET   |-                  |Öğrenci diploma not sistemi referansları
|`studentship_rights`          |GET   |-                  |Öğrencilik hakkı referansları
|`studentship_statuses`        |GET   |-                  |Öğrencilik durumu referansları
|`unit_instruction_languages`  |GET   |-                  |Öğrenim dili referansları
|`unit_instruction_types`      |GET   |-                  |Öğrenim türü referansları
|`unit_statuses`               |GET   |-                  |Aktiflik durumu referansları
|`unit_types`                  |GET   |-                  |Birim türü referansları
|`university_types`            |GET   |-                  |Üniversite türü referansları

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.

### Resumes

Akademik özgeçmişe dair bilgiler sunan arayüze sahiptir.

|Action                           |Method|Required parameters     |Description|
|---------------------------------|------|------------------------|-----------|
|`academic_duties`                |GET   |`id_number`             |Akademik görevler
|`academic_links`                 |GET   |`id_number`             |Akademik sayfa bilgileri
|`administrative_duties`          |GET   |`id_number`             |İdari görevler
|`articles`                       |GET   |`id_number`             |Makaleler
|`artistic_activities`            |GET   |`id_number`             |Sanatsal faaliyetler
|`authors`                        |GET   |`id_number`, `author_id`|Yazar listesi
|`awards`                         |GET   |`id_number`             |Ödüller
|`books`                          |GET   |`id_number`             |Kitaplar
|`certifications`                 |GET   |`id_number`             |Sertifikalar
|`citations`                      |GET   |`id_number`, `year`     |Atıflar
|`designs`                        |GET   |`id_number`             |Tasarım bilgileri
|`editorships`                    |GET   |`id_number`             |Editörlük bilgileri
|`education_informations`         |GET   |`id_number`             |Eğitim bilgileri
|`fields`                         |GET   |`id_number`             |Alan bilgisi
|`foreign_languages`              |GET   |`id_number`             |Yabancı diller listesi
|`incentive_applications`         |GET   |`id_number`, `year`     |Akademik teşvik başvuruları
|`incentive_activity_declarations`|GET   |`id_number`, `year`     |Akademik teşvik faaliyet beyanları
|`lectures`                       |GET   |`id_number`             |Verdiği dersler
|`memberships`                    |GET   |`id_number`             |Üyelik listesi
|`other_experiences`              |GET   |`id_number`             |Üniversite dışı diğer deneyimler
|`papers`                         |GET   |`id_number`             |Bildiriler
|`patents`                        |GET   |`id_number`             |Patentler
|`projects`                       |GET   |`id_number`             |Projeler
|`refereeing`                     |GET   |`id_number`             |Hakemlik bilgileri
|`thesis_advisors`                |GET   |`id_number`             |Tez danışmanlıkları

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.

### Staff

Akademik personel vb. bilgilerini sunan arayüze sahiptir.

|Action         |Method|Required parameters|Description|
|---------------|------|-------------------|-----------|
|`academicians` |GET   |`id_number`        |Akademik personel bilgileri
|`nationalities`|GET   |-                  |Uyruk referansları
|`pages`        |GET   |`page`             |Sayfa bilgisine göre akademik personel listesi

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.

### Students

Öğrenci bilgilerini sunan arayüze sahiptir.

|Action        |Method|Required parameters|Description|
|--------------|------|-------------------|-----------|
|`informations`|GET   |`id_number`        |Aktif öğrenci bilgileri

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.

### Units

Birimlere dair bilgiler sunan arayüze sahiptir.

|Action        |Method|Required parameters   |Description|
|--------------|------|----------------------|-----------|
|`changes`     |GET   |`day`, `month`, `year`|Tarihe göre birimdeki değişiklikler
|`units`       |GET   |`unit_id`             |Birimler
|`subunits`    |GET   |`unit_id`             |Alt birimler
|`programs`    |GET   |`unit_id`             |Programlar
|`universities`|GET   |-                     |Üniversiteler

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.
