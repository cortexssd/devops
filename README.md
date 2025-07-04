# PHP DevOps Test Project

Базовый проект для тестирования DevOps-практик: Docker, Prometheus/Grafana, Ansible, Bash-скрипт.  
Протестирован на Ubuntu 22.04 VPS:
http://194.58.118.58/

Grafana:
http://194.58.118.58:3000/d/3ba1205a-641b-4f13-b921-6e170693d325/
(admin:admin)

## Требования

- Docker, Docker Compose
- Ansible
- Git
- Ubuntu 22.04

## Установка

1. Клонируйте репозиторий:
    ```bash
    git clone https://github.com/cortexssd/devops.git && cd devops
    ```

2. Постройте и запустите контейнеры:
    ```bash
    docker-compose up -d --build
    ```

3. Откройте браузер и перейдите по адресу:
    ```bash
    http://<server-ip>
    ```

## Мониторинг

- **Prometheus**:  
    Доступ через браузер:
    ```bash
    http://<server-ip>:9090
    ```
  
- **Grafana**:  
    Доступ через браузер:
    ```bash
    http://<server-ip>:3000 (логин: admin, пароль: admin)
    ```

    Импортируйте дашборд из файла `config/grafana/grafana_dashboard.json`.

## Ansible

1. Установите Ansible:
    ```bash
    sudo apt install -y ansible
    ```

2. Запустите playbook:
    ```bash
    ansible-playbook -i ansible/inventory.yml ansible/playbook.yml
    ```

## Bash-скрипт

1. Для проверки порта:

    Сначала сделайте скрипт исполнимым:
    ```bash
    chmod +x ports.sh
    ```

    Затем выполните:
    ```bash
    ./ports.sh <host> <port>
    ```

2. Логи скрипта находятся в файле:
    ```bash
    /var/log/ports.log
    ```

## Структура проекта

- `ansible/`
- `config/grafana/`, `config/nginx/`, `config/prometheus/`
- `public/index.php`
- `port.sh`, `composer.json`
- `Dockerfile`, `docker-compose.yml`
