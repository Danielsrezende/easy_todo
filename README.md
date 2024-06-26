# Easy Todo

Um simples app de Tarefas.

## Instalação

Faça um clone do repositório.

No terminal digite o comando para baixar as dependências.

```
 flutter pub get 
```

No terminal digite o comando para iniciar o app.

```
 flutter run 
```

### Links úteis

Link de instalação do Flutter: https://docs.flutter.dev/get-started/install <br>
Link de instalação do Android Studio: https://developer.android.com/studio/install

## Arquitetura

```
EazyTodo/
├── lib/
│   ├── app // Contém a classe principal do aplicativo.
│   │   └── todo_app.dart 
│   ├── models // Define as classes de dados do aplicativo.
│   │   └── todo.dart 
│   ├── repositories // Gerencia a lógica de persistência dos dados, com armazenamento local.
│   │   └── todo_repository.dart 
│   ├── screens // Contém as telas do aplicativo
│   │   ├── todo_list_screen.dart 
│   ├── widgets // Contém widgets reutilizáveis.
│   │   └── todo_list_item.dart
│   └── main.dart // O ponto de entrada principal do aplicativo.
└──
```

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

