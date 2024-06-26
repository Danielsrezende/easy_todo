# Easy Todo

Um simples app de Tarefas.

## Instalação

Faça um clone do repositório.

```
No terminal digite o comando 'flutter pub get' para baixar as dependências.
```

```
No terminal digite o comando 'flutter run*' para iniciar o app.
```


## Arquitetura

- EasyTodo/
  - lib/
    - app/
      - todo_app.dart
    - models/
      - todo.dart
    - repositories/
      - todo_repository.dart
    - screens/
      - todo_list_page.dart.dart
    - widgets/
      - todo_list_item.dart
    - main.dart

app: Contém a classe principal do aplicativo.

models: Define as classes de dados do aplicativo.

repositories: Gerencia a lógica de persistência dos dados, com armazenamento local.

screens: Contém as telas do aplicativo.

widgets: Contém widgets reutilizáveis.

main.dart: O ponto de entrada principal do aplicativo.

## Dependências 

flutter_slidable ^3.1.0: https://pub.dev/packages/flutter_slidable

Adiciona o widget "Slidable". 

shared_preferences ^2.2.3: https://pub.dev/packages/shared_preferences

Usado para persistir dados simples no dispositivo.

### Dependências de desenvolvimento

flutter_launcher_icons "^0.13.1": https://pub.dev/packages/flutter_launcher_icons

Usado para controlar o icone do app de forma flexível.

## Autor

Daniel Rezende

Linkedin: https://www.linkedin.com/in/daniel-rezende-472936259/

