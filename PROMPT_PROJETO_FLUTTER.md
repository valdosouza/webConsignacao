# Prompt para Projeto Flutter – Padrões e Boas Práticas

Este documento consolida os padrões, decisões técnicas e boas práticas utilizados no projeto **webconsignacao** (Controle de Consignação), para ser usado como referência em outros projetos Flutter.

---

## 1. Stack e Arquitetura

- **Flutter**: 3.41+ (Dart 3.11+)
- **Gerenciamento de estado**: BLoC (`bloc`, `flutter_bloc`)
- **Injeção de dependência e rotas**: `flutter_modular` v5 + `modular_bloc_bind`, `injectable`
- **Retorno de operações assíncronas**: `dartz` (`Either<Failure, T>`)
- **Arquitetura**: Clean Architecture (data, domain, presentation)

Estrutura típica de módulo:
```
lib/app/modules/<nome_modulo>/
├── data/
│   ├── datasource/
│   ├── model/
│   └── repository/
├── domain/
│   ├── entity/
│   ├── repository/
│   └── usecase/
├── presentation/
│   ├── bloc/
│   ├── page/
│   ├── widget/
│   ├── content/
│   └── menu/
└── <nome>_module.dart
```

---

## 2. Padrão de Testes

### 2.1 Estrutura de Pastas

```
test/
├── helpers/
│   ├── pump_app.dart          # pumpApp, pumpAndSettleSafe
│   ├── fake_<modulo>_bloc.dart
│   ├── fake_<modulo>_repository.dart
│   └── test_config.dart
├── fixtures/
│   └── fixture_reader.dart
└── app/
    ├── core/
    └── modules/
        └── <modulo>/
            ├── data/model/<model>_test.dart
            └── presentation/
                ├── widget/<widget>_test.dart
                └── menu/<menu>_test.dart

integration_test/
├── app_test.dart
├── test_app_module.dart       # AppModule com AuthModuleTest
├── auth_module_test.dart
└── integration_fakes.dart
```

### 2.2 Injeção Opcional de Bloc (padrão para testes)

Os widgets devem aceitar um parâmetro opcional `bloc` para permitir testes sem `Modular.get`:

```dart
class MeuWidget extends StatefulWidget {
  const MeuWidget({super.key, this.bloc});

  /// Optional bloc for tests; when null, uses `Modular.get<MeuBloc>()`.
  final MeuBloc? bloc;
  // ...
}
```

No `initState`:
```dart
bloc = widget.bloc ?? Modular.get<MeuBloc>();
if (widget.bloc == null) {
  Future.delayed(const Duration(milliseconds: 100)).then((_) async {
    await Modular.isModuleReady<MeuModule>();
  });
}
```

**Importante:** Em comentários de documentação com genéricos (ex: `Modular.get<MeuBloc>()`), coloque entre **backticks** para evitar `unintended_html_in_doc_comment`:
```dart
/// Optional bloc for tests; when null, uses `Modular.get<MeuBloc>()`.
```

### 2.3 Fake Repository e Fake Bloc

```dart
// fake_meu_bloc.dart
class FakeMeuRepository implements MeuRepository {
  FakeMeuRepository({this.model});

  final MeuModel? model;

  @override
  Future<Either<Failure, MeuModel>> get() async {
    return Right(model ?? MeuModel.empty());
  }
}

class FakeMeuBloc extends MeuBloc {
  FakeMeuBloc({MeuModel? initialData})
      : super(usecase: MeuGet(repository: FakeMeuRepository(model: initialData))) {
    if (initialData != null) {
      state = MeuLoaded(data: initialData);
    }
  }

  void emitState(MeuState state) => emit(state);
}
```

### 2.4 Widget Tests

- Use `pumpApp` do helper para controlar tamanho da superfície (ex: `Size(400, 800)` para mobile).
- Widgets com raiz `Expanded` devem ser envolvidos em `Column` ou `SizedBox(height: X)`:
```dart
Widget wrapWidget(MeuWidget widget) {
  return Scaffold(
    body: Column(children: [widget]),
  );
}
// ou
SizedBox(height: 800, child: MeuWidget(bloc: bloc))
```
- Evite `Modular.get` nos testes; passe sempre o fake bloc.
- Prefira `find.text('...')`, `find.byType(...)`, `find.byIcon(...)` ou `find.textContaining('...')`.

### 2.5 Unit Tests de Model

- `empty()`: retorna modelo com valores padrão.
- `fromJson`: snake_case no JSON → camelCase no model.
- `fromJson` com valores numéricos: testar `int` e `double`.
- `fromJson` com campos null: testar defaults.
- `toJson`: round-trip quando existir.

### 2.6 Integration Tests (E2E)

- `IntegrationTestWidgetsFlutterBinding.ensureInitialized()` em `main()`.
- `SharedPreferences.setMockInitialValues({})` em `setUpAll`.
- Use `TestAppModule` que troca `AuthModule` por `AuthModuleTest` (fake auth).
- Fluxos: login → navegação → verificar elementos da tela.
- Em E2E, validar apenas navegação e elementos estáveis; a API pode falhar no ambiente de teste.

### 2.7 Boas Práticas Anti-flake

1. Evitar `pumpAndSettle` com timeout longo; preferir pumps explícitos.
2. Não depender de rede, relógio ou aleatoriedade; usar fakes determinísticos.
3. Assertivas estáveis; evitar textos que mudam com i18n.
4. Rodar integration tests com `-d windows` ou `-d chrome` para dispositivo definido.

---

## 3. Depreciações e Migrações

### 3.1 Radio → RadioGroup (Flutter 3.32+)

`groupValue` e `onChanged` em `Radio` foram deprecados. Migrar para `RadioGroup`:

```dart
RadioGroup<bool>(
  groupValue: valor,
  onChanged: (v) => setState(() => valor = v!),
  child: Column(
    children: [
      RadioGroupTile(value: true, label: const Text('Sim')),
      RadioGroupTile(value: false, label: const Text('Não')),
    ],
  ),
)
```

Quando desabilitado, envolver em `IgnorePointer(enabled: false, child: RadioGroup(...))`.

### 3.2 Kotlin e Android

- **Kotlin**: 2.1.0 (compatível com Firebase/Play Services).
- **Android Gradle Plugin**: 8.8 (para R8 suportar Kotlin 2.1).
- **Gradle**: 8.10.2.
- **compileSdk**: 36.
- **NDK**: 28.2.13676358 (ou conforme exigido pelos plugins).
- Se projeto em D: e cache em C:, adicionar em `gradle.properties`:
  ```
  kotlin.incremental=false
  ```

---

## 4. Configuração de Build

### 4.1 APK

```bash
flutter clean
flutter pub get
flutter build apk
```

### 4.2 App Bundle (Play Store)

```bash
flutter build appbundle
```

### 4.3 Web

```bash
flutter build web
```

Evitar declarações duplicadas de constantes (ex: `baseApiUrl`); manter uma única URL ativa.

---

## 5. Análise e Qualidade

- `dart analyze` deve concluir sem issues.
- Usar `flutter_lints` em `analysis_options.yaml`.
- Corrigir todos os itens da aba Problems antes de PR.

---

## 6. Comandos Úteis

| Objetivo                | Comando |
|-------------------------|---------|
| Unit + widget tests     | `flutter test` |
| Integration tests       | `flutter test integration_test -d windows` |
| Analisar código         | `flutter analyze` |
| Limpar e obter deps     | `flutter clean && flutter pub get` |
| Cobertura               | `flutter test --coverage` |

---

## 7. Git e PR

- Branch: `feature/<nome-descritivo>`.
- Commit: mensagem clara e objetiva.
- PR: título descritivo (ex: "SDK_36_Atualizado", "2º Rodada de Testes").

---

## 8. Documentação de Testes

Manter um `TESTING.md` com:

- Como rodar unit/widget e integration tests.
- Estrutura de pastas.
- Padrões (fakes, bloc opcional, etc.).
- Comandos de depuração e CI.

---

## 9. Dependências Comuns

```yaml
dependencies:
  get_it: ^8.3.0
  flutter_modular: ^5.0.3
  modular_bloc_bind: ^1.0.1
  bloc: ^8.1.4
  flutter_bloc: ^8.1.6
  injectable: ^2.7.1
  equatable: ^2.0.8
  dartz: ^0.10.0-nullsafety.1

dev_dependencies:
  mocktail: ^1.0.4
  mockito: ^5.6.3
  build_runner: ^2.11.1
  json_serializable: ^6.11.2
  integration_test:
    sdk: flutter
  flutter_lints: ^6.0.0
```

---

## 10. Checklist para Novo Módulo com Testes

1. [ ] Criar fake do repositório e do bloc em `test/helpers/fake_<modulo>_bloc.dart`.
2. [ ] Adicionar parâmetro opcional `bloc` nos widgets que usam bloc.
3. [ ] Criar widget tests em `test/app/modules/<modulo>/presentation/widget/`.
4. [ ] Criar unit tests dos models em `test/app/modules/<modulo>/data/model/`.
5. [ ] Adicionar fluxo E2E em `integration_test/app_test.dart`.
6. [ ] Atualizar `TESTING.md`.
7. [ ] Rodar `flutter test` e `flutter test integration_test -d windows`.
8. [ ] Garantir `flutter analyze` sem issues.

---

*Documento gerado com base nos chats e no projeto webconsignacao (Consignação e Venda).*
