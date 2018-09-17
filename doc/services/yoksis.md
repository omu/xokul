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
|`Unit`       |Birimler                 |

### Graduations

Üniversite mezun bilgileri sunan arayüze sahiptir.

|Action        |Method  |Required parameters|
|--------------|--------|-------------------|
|`informations`|GET     |`id_number`        |

### MEB

MEB mezun bilgileri sunan arayüze sahiptir.

|Action    |Method  |Required parameters|
|----------|--------|-------------------|
|`students`|GET     |`id_number`        |

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

### Resumes

Akademik özgeçmişe dair bilgiler sunan arayüze sahiptir.

|Action          |Method  |Required parameters|
|----------------|--------|-------------------|
|`articles`      |GET     |`id_number`        |
|`certifications`|GET     |`id_number`        |
|`projects`      |GET     |`id_number`        |

### Staff

Akademik personel vb. bilgilerini sunan arayüze sahiptir.

|Action         |Method  |Required parameters|
|---------------|--------|-------------------|
|`academicians` |GET     |`id_number`        |
|`nationalities`|GET     |-                  |
|`pages`        |GET     |`page`             |

### Students

Öğrenci bilgilerini sunan arayüze sahiptir.

|Action        |Method  |Required parameters|
|--------------|--------|-------------------|
|`informations`|GET     |`id_number`        |

### Units

Birimlere dair bilgiler sunan arayüze sahiptir.

|Action        |Method  |Required parameters   |
|--------------|--------|----------------------|
|`changes`     |GET     |`day`, `month`, `year`|
|`subunits`    |GET     |`unit_id`             |
|`programs`    |GET     |`unit_id`             |
|`universities`|GET     |-                     |