# Burn My Fat!

В этом документе описан процесс разворачивания проекта и запуска тестов для него.

## Основная информация

При разработке проекта должен использоваться следующий
[pre-commit hook](https://gist.github.com/gruz0/7484f6cbc0f92112d75abd6eda117546) для Git,
который необходимо сохранить в файл `.git/hooks/pre-commit` и выставить ему `chmod +x .git/hooks/pre-commit`.

В нём происходит обновление локальных гемов до последних доступных версий:

* [rubocop](https://github.com/rubocop-hq/rubocop)
* [slim-lint](https://github.com/sds/slim-lint)
* [bundler-audit](https://github.com/rubysec/bundler-audit)

После этого выполняется проверка всех файлов проекта на соответствие указанным стилям кодирования
в соответствующих конфигурационных файлах:

* Конфиг RuboCop: `.rubocop.yml`
* Конфиг slim-lint: используется конфиг по-умолчанию

## Запуск проекта в Docker

В данный момент проект упакован в Docker-контейнер, который собирается и запускается одной командой:

```bash
docker-compose up --build
```

## Запуск тестов

Все тесты можно запускать внутри Docker-контейнера.

Для этого необходимо зайти внутрь него:

```bash
docker-compose exec web sh
```

Создать базу данных и применить миграции:

```bash
HANAMI_ENV=test bundle exec hanami db prepare
```

Запустить сами тесты:

```bash
rspec
```
