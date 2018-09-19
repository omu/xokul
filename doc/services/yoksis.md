Yoksis
======

Yoksis servisi, SOAP arayüzünü kullanarak [YOKSIS](https://yoksis.yok.gov.tr) tarafından sunulan servislerle haberleşir. 

Endpoints
---------

Mevcut endpoint ve YOKSIS'teki karşılıkları tablodadır.

|Endpoint     |YOKSIS'teki karşılığı    |
|-------------|-------------------------|
|`Graduations`|Mezun Bilgileri          |
|`MEB`        |MEB Mezun Bilgileri      |
|`References` |Referanslar              |
|`Resumes`    |Özgeçmiş                 |
|`Staff`      |Akademik Personel        |
|`Students`   |Öğrenci Sorgulama Servisi|
|`Units`      |Birimler                 |

### Graduations

Üniversite mezun bilgileri sunan arayüze sahiptir.

|Action        |Method  |Required parameters|
|--------------|--------|-------------------|
|`informations`|GET     |`id_number`        |

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.

### MEB

MEB mezun bilgileri sunan arayüze sahiptir.

|Action    |Method  |Required parameters|
|----------|--------|-------------------|
|`students`|GET     |`id_number`        |

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.

### References

Çeşitli referanslar sunan arayüze sahiptir.

|Action                        |Method  |Required parameters|
|------------------------------|--------|-------------------|
|`administrative_functions`    |GET     |-                  |
|`administrative_units`        |GET     |-                  |
|`cities`                      |GET     |-                  |
|`countries`                   |GET     |-                  |
|`districts`                   |GET     |`city_code`        |
|`entrance_types`              |GET     |-                  |
|`gender`                      |GET     |-                  |
|`kod_bid`                     |GET     |-                  |
|`martyrs_relatives`           |GET     |-                  |
|`nationalities`               |GET     |-                  |
|`staff_titles`                |GET     |-                  |
|`student_disability_types`    |GET     |-                  |
|`student_dropout_types`       |GET     |-                  |
|`student_education_levels`    |GET     |-                  |
|`student_entrance_point_types`|GET     |-                  |
|`student_entrance_types`      |GET     |-                  |
|`student_grades`              |GET     |-                  |
|`student_grading_systems`     |GET     |-                  |
|`studentship_rights`          |GET     |-                  |
|`studentship_statuses`        |GET     |-                  |
|`unit_instruction_languages`  |GET     |-                  |
|`unit_instruction_types`      |GET     |-                  |
|`unit_statuses`               |GET     |-                  |
|`unit_types`                  |GET     |-                  |
|`university_types`            |GET     |-                  |

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.

### Resumes

Akademik özgeçmişe dair bilgiler sunan arayüze sahiptir.

|Action          |Method  |Required parameters|
|----------------|--------|-------------------|
|`articles`      |GET     |`id_number`        |
|`certifications`|GET     |`id_number`        |
|`projects`      |GET     |`id_number`        |

**Not**: Bu endpoint'in şu action'ları eksiktir:

- `getir_ders_listesi`
- `getir_ogrenim_bilgisi_listesi`
- `get_bildiri_bilgisi_v1`
- `getir_akademik_gorev_listesi`
- `get_odul_listesi_v1`
- `get_tesvik_faaliyet_beyan_v1`
- `getir_idari_gorev_listesi`
- `get_editorluk_bilgisi_v1`
- `getir_tez_danisman_listesi`
- `getir_uyelik_listesi`
- `get_hakemlik_bilgisi_v1`
- `get_temel_alan_bilgisi_v1`
- `get_personel_link_v1`
- `get_yazar_listesi_v1`
- `get_tesvik_basvuru_varmi_v1`
- `get_tasarim_bilgisi_v1`
- `get_kitap_bilgisi_v1`
- `getir_yabanci_dil_listesi`
- `get_sanatsal_faal_v1`
- `getir_unv_disi_deneyim_listesi`
- `get_atif_sayilari_v1`
- `get_patent_bilgisi_v1`

### Staff

Akademik personel vb. bilgilerini sunan arayüze sahiptir.

|Action         |Method  |Required parameters|
|---------------|--------|-------------------|
|`academicians` |GET     |`id_number`        |
|`nationalities`|GET     |-                  |
|`pages`        |GET     |`page`             |

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.

### Students

Öğrenci bilgilerini sunan arayüze sahiptir.

|Action        |Method  |Required parameters|
|--------------|--------|-------------------|
|`informations`|GET     |`id_number`        |

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.

### Units

Birimlere dair bilgiler sunan arayüze sahiptir.

|Action        |Method  |Required parameters   |
|--------------|--------|----------------------|
|`units`       |GET     |`unit_id`             |
|`changes`     |GET     |`day`, `month`, `year`|
|`subunits`    |GET     |`unit_id`             |
|`programs`    |GET     |`unit_id`             |
|`universities`|GET     |-                     |

**Not**: Bu endpoint'in altındaki tüm action'lar gerçeklenmiştir.
