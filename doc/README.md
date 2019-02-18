Xokul Dokümantasyonu
====================

Burada Xokul'a ait teknik, operasyonel ve API dokümanları yer almaktadır.
Başlıca doküman türleri aşağıdaki gibidir.

| Tür                        | Açıklama                                              |
|:---------------------------|:------------------------------------------------------|
| [basics](basics)           | Problemi ve mimariyi anlatan genel dokümanlar         |
| [development](development) | Geliştirici ve katkıcılar için geliştirme dokümanları |
| [operations](operations)   | Operatör ve sistem yöneticileri için dokümanlar       |
| [policy](policy)           | Kural ve poliçe dokümanları                           |
| [api](api)                 | API dokümanları                                       |

*Dokümanlara [docs.omu.sh](doc.omu.sh) üzerinden de ulaşabilirsiniz.*

Genel bakış
-----------

Tüm dokümanlar için aşağıdaki navigatörü kullanabilirsiniz.

1. [**Installation**](operations/installation)
   - [Manual Installation](operations/installation/manual.md)
   - [Using Docker](operations/installation/docker.md)
   - [Using Vagrant](operations/installation/vagrant.md)
1. [**Basics**](basics)
   - [Problem](basics/problem.md)
   - [External services](basics/external-services.md)
   - [Architecture](basics/architecture.md)
1. [**Development**](development)
   - [Environment](development/environment.md)
   - [**Services**](development/services)
     - [Basics](development/services/basics.md)
     - [Create new action](development/services/create-new-action.md)
     - [Create new endpoint](development/services/create-new-endpoint.md)
     - [Create new service](development/services/create-new-service.md)
     - [Serialization](development/services/serialization.md)
     - [Routes](development/services/routes.md)
   - [**Support**](development/support)
     - [REST client](development/support/rest-client.md)
     - [SOAP client](development/support/soap-client.md)
   - [Tests](development/tests.md)
   - [Jobs](development/jobs.md)
1. [**Operations**](operations)
   - [**Deployment**](operations/deployment)
     - [Traditional machine](operations/deployment/traditional-machine.md)
     - [Dokku](operations/deployment/dokku.md)
   - [**Backup**](operations/backup)
     - [Database](operations/backup/database.md)
     - [Kong](operations/backup/kong.md)
     - [Host](operations/backup/host.md)
   - [**Upgrading**](operations/upgrading)
     - [Ruby](operations/upgrading/kong.md)
     - [Rails](operations/upgrading/rails.md)
     - [Dependencies](operations/upgrading/dependencies.md)
     - [Database](operations/upgrading/database.md)
     - [Kong](operations/upgrading/kong.md)
1. [**Policy**](policy)
   - [Documentation](policy/documentation.md)
   - [Release](policy/release.md)
   - [Security](policy/security.md)
1. [API](api)
1. [Contributing](https://github.com/omu/xokul/blob/master/CONTRIBUTING.md)
