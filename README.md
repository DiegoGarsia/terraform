# Terraform Proxmox Infrastructure (bpg/proxmox)

Terraform-проект для автоматизированного развертывания инфраструктуры в **Proxmox VE** с использованием современного провайдера **bpg/proxmox**.

Проект позволяет управлять виртуальной инфраструктурой как кодом (**Infrastructure as Code**):

* LXC контейнеры
* QEMU виртуальные машины
* сетевые настройки
* диски
* CPU/RAM параметры
* SSH-доступ
* cloud-init инициализация

Основная цель проекта — быстро и воспроизводимо создавать тестовые, лабораторные и серверные окружения в Proxmox.

---

## Архитектура

```
Terraform
    |
    |
bpg/proxmox provider
    |
    |
+----------------+
|   Proxmox VE   |
+----------------+
      |
      |
  +---+---+
  |       |
 LXC     VM
```

Terraform описывает желаемое состояние инфраструктуры, а провайдер `bpg/proxmox` применяет изменения через API Proxmox.

---

# Особенности проекта

* Используется современный провайдер `bpg/proxmox`
* Разделение логики через Terraform modules
* Поддержка нескольких LXC и VM через `for_each`
* Конфигурация инфраструктуры хранится в `locals.tf`
* Секреты вынесены отдельно
* Поддержка статических IP-адресов
* Поддержка SSH ключей
* Поддержка root password для LXC
* Быстрое создание ресурсов

По сравнению с провайдером Telmate создание ресурсов происходит значительно быстрее за счет более современной реализации API взаимодействия.

---

# Структура проекта

```
terraform-bpg/
│
├── containers.tf
│   └── Создание LXC контейнеров
│
├── virtual-machines.tf
│   └── Создание виртуальных машин
│
├── locals.tf
│   └── Описание инфраструктуры
│
├── variables.tf
│   └── Глобальные переменные
│
├── providers.tf
│   └── Настройка Proxmox provider
│
├── versions.tf
│   └── Версии Terraform и провайдеров
│
├── outputs.tf
│   └── Вывод результатов
│
├── terraform.tfvars
│   └── Основные параметры окружения
│
├── secret.auto.tfvars
│   └── Секреты (не хранить в Git)
│
└── modules/
    │
    ├── lxc/
    │   └── Модуль LXC контейнеров
    │
    └── vm/
        └── Модуль виртуальных машин
```

---

# Модули

## LXC module

Путь:

```
modules/lxc
```

Отвечает за создание контейнеров:

* hostname
* VMID
* CPU
* RAM
* disk
* network interface
* IP адрес
* gateway
* DNS
* SSH ключ
* root password

Пример создаваемого контейнера:

```
nginx
 ├── IP: 192.168.0.101
 ├── CPU: 1 core
 ├── RAM: 512 MB
 └── Ubuntu 24.04 LXC
```

---

## VM module

Путь:

```
modules/vm
```

Отвечает за создание виртуальных машин:

* clone из шаблона
* CPU
* RAM
* диски
* сеть
* cloud-init
* SSH доступ

Пример:

```
k3s-worker-01
 ├── CPU
 ├── Memory
 ├── Disk
 └── Network
```

---

# Конфигурация инфраструктуры

Основной список ресурсов находится в:

```
locals.tf
```

Например:

```hcl
containers = {

  nginx = {
    vmid      = 101
    hostname  = "nginx"
    ip        = "192.168.0.101/24"
    memory    = 512
    cores     = 1
  }

}
```

Добавление нового сервера выполняется простым добавлением нового блока.

Terraform автоматически создаст новый ресурс благодаря:

```hcl
for_each = local.containers
```

---

# Требования

## Terraform

Проверенная версия:

```
Terraform >= 1.9
```

---

## Provider

Используется:

```
registry.terraform.io/bpg/proxmox
```

Версия:

```
~> 0.111
```

---

## Proxmox

Необходимо:

* Proxmox VE 8.x
* API доступ
* настроенный storage
* bridge network
* подготовленные LXC templates
* VM templates

---

# Подготовка

Клонировать репозиторий:

```bash
git clone <repository>
cd terraform-bpg
```

Создать файл с секретами:

```bash
cp secret.auto.tfvars.example secret.auto.tfvars
```

Заполнить:

```hcl
proxmox_api_token = "TOKEN"
ssh_public_key    = "SSH_PUBLIC_KEY"
lxc_password      = "PASSWORD"
```

---

# Запуск Terraform

## Инициализация

```bash
terraform init
```

---

## Проверка конфигурации

```bash
terraform validate
```

---

## Просмотр изменений

```bash
terraform plan
```

---

## Создание инфраструктуры

```bash
terraform apply
```

---

## Удаление инфраструктуры

```bash
terraform destroy
```

---

# Проверка состояния

Список управляемых ресурсов:

```bash
terraform state list
```

Просмотр конкретного ресурса:

```bash
terraform state show <resource>
```

---

# Секреты

Следующие файлы не должны попадать в Git:

```
secret.auto.tfvars
terraform.tfstate
terraform.tfstate.backup
```

Они добавлены в `.gitignore`.

---

# Работа с LXC

Проверка контейнера:

```bash
pct config <vmid>
```

Проверка сети:

```bash
pct exec <vmid> -- ip a
```

Проверка пользователя:

```bash
pct exec <vmid> -- passwd -S root
```

---

# Почему bpg/proxmox

Переход с Telmate был выполнен из-за:

* более быстрого создания ресурсов;
* более современной работы через API Proxmox;
* лучшей поддержки новых возможностей Proxmox;
* более активного развития проекта.

---

# Возможные улучшения

Планы развития:

* [ ] Terraform remote backend
* [ ] хранение секретов в Vault
* [ ] автоматические snapshots
* [ ] CI/CD pipeline
* [ ] отдельный network module
* [ ] управление firewall через Terraform
* [ ] автоматическая подготовка Kubernetes-кластера

---

# Лицензия

Проект предназначен для личного использования, лабораторий и тестовых окружений.

