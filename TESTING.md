# Guia de Testes – Consignação e Venda

Este documento descreve como rodar e escrever testes no projeto Flutter, com foco em regressão pós-upgrade e boas práticas anti-flake.

## Como rodar os testes

### Unit e Widget tests

```bash
flutter test
```

Roda todos os testes em `test/` (unit + widget). Não depende de rede nem de dispositivo físico.

### Integration tests (E2E)

```bash
# Com dispositivo/emulador conectado (escolha um)
flutter test integration_test/app_test.dart -d <androidDeviceId>
```

Os integration tests usam **fake backend** (sem API real): o módulo `TestAppModule` injeta `AuthModuleTest` com `IntegrationFakeAuthRepository`. Não é necessária rede para o fluxo de login.

## Estrutura de testes

```
test/
├── helpers/
│   ├── test_config.dart       # Setup padrão (opcional)
│   ├── pump_app.dart          # Helpers para widget tests (pumpApp, etc.)
│   ├── fake_auth_bloc.dart    # Bloc fake para AuthPage
│   ├── fake_splash_bloc.dart  # Bloc fake para SplashPage
│   ├── fake_auth_repository.dart  # Repositório fake (unit/testes que precisam de repo)
│   ├── fake_attendance_by_customer_bloc.dart  # Bloc fake para attendance_by_customer
│   ├── fake_attendance_by_route_bloc.dart     # Bloc fake para attendance_by_route
│   └── fake_attendance_ordering_bloc.dart     # Bloc fake para attendance_ordering
├── fixtures/                  # JSON e dados estáticos para testes
├── app/
│   ├── core/                  # Testes de validadores, etc.
│   └── modules/               # Testes por feature (model, usecase, page widget)
│       ├── auth/              # Auth: widget test da AuthPage
│       ├── cashier/           # Caixa: widget test do menu (CashierMenuMobile)
│       ├── cashier_balance/   # Saldo caixa: widget test + unit test do model
│       ├── cashier_closure/   # Fechamento caixa: widget + menu + unit tests models
│       ├── cashier_statement/        # Extrato caixa: widget + menu + unit test model
│       ├── cashier_statement_summary/ # Resumo extrato: widget + unit tests models
│       ├── attendance_by_customer/    # Atendimento por cliente: widget test CustomerListMobile
│       ├── attendance_by_route/       # Atendimento por rota: widget tests SalesRouteListMobile, CustomerListMobile
│       ├── attendance_ordering/       # Ordenação de atendimento: widget tests RegionListContent, RouteListContent, CustomerListContent
│       ├── Core/                      # Core: unit tests CustomerListModel, SalesRouteListModel, CustomerListByRouteModel, RegionModel
│       ├── splash/                   # Splash: widget test da SplashPage
│       └── ...
integration_test/
├── integration_test.dart      # Placeholder para descoberta
├── app_test.dart              # Fluxos E2E (splash → auth, login → home, cashier, cashier balance, cashier closure, cashier statement, cashier statement summary, attendance by customer, attendance by route, attendance ordering)
├── integration_fakes.dart      # IntegrationFakeAuthRepository
├── auth_module_test.dart      # Módulo de auth com fake para E2E
└── test_app_module.dart       # AppModule com AuthModuleTest
```

## Padrões do projeto

- **Mocks**: preferir **mocktail** para novos testes; mocks gerados com mockito permanecem onde já existem.
- **Repositórios/HTTP**: não testar plugins diretamente. Usar **interfaces/adapters** e **fakes** (ex.: `FakeAuthRepository`, `IntegrationFakeAuthRepository`).
- **Storage**: em testes que tocam em `SharedPreferences`, usar `SharedPreferences.setMockInitialValues({})` em `setUpAll` (e, se necessário, `TestWidgetsFlutterBinding.ensureInitialized()`).
- **Injeção em telas**: para widget tests, as telas aceitam um bloc opcional (ex.: `AuthPage(bloc: fakeBloc)`, `SplashPage(bloc: fakeBloc)`). Em produção o bloc vem do Modular.

## Boas práticas anti-flake

1. **Evitar `pumpAndSettle` com timeout longo**  
   Preferir timeouts curtos ou pumps explícitos (`pump`, `pump(Duration(...))`) para não depender de animações longas.

2. **Não depender de rede, relógio ou aleatoriedade**  
   Usar sempre fakes/mocks e dados determinísticos; para tempo, `fake_async` ou `pump` com duração fixa.

3. **Assertivas estáveis**  
   Preferir `find.text('...')`, `find.byType(...)` ou `find.byWidgetPredicate` em elementos que não mudam com i18n ou tema, ou usar chaves de teste quando necessário.

4. **Binding em testes que usam plugins**  
   Se o teste indiretamente usa `SharedPreferences` ou outros serviços que dependem de binding, chamar `TestWidgetsFlutterBinding.ensureInitialized()` (e, quando aplicável, `SharedPreferences.setMockInitialValues({})`) no início do teste ou em `setUpAll`.

5. **Integration tests**  
   Rodar com dispositivo definido (`-d <androidDeviceId>`) para evitar “mais de um dispositivo conectado”. Não usar backend real; o projeto já usa `TestAppModule` + fake auth.

## Como escrever novos testes

- **Unit (mapper)**: criar `test/.../data/model/<nome>_mapper_test.dart` e testar `fromJson` / `toJson` (round-trip quando houver `toJson`).
- **Unit (validação)**: lógica em `lib/app/core/shared/validators/` e testes em `test/app/core/shared/validators/`.
- **Unit (use case/service)**: mockar repositório com mocktail e testar sucesso e falha.
- **Widget**: usar `pumpApp` do `test/helpers/pump_app.dart`, fornecer bloc fake quando a tela aceitar, e evitar `Modular.get` nos testes.
- **Integration**: reutilizar `TestAppModule` e, se precisar de novo fluxo, adicionar em `integration_test/app_test.dart` usando os fakes existentes.

## Depuração

- Rodar um arquivo específico:
  ```bash
  flutter test test/app/modules/auth/presentation/page/auth_page_widget_test.dart
  ```
- Rodar com prints:
  ```bash
  flutter test --plain-name "renders initial"
  ```
- Ver cobertura (apenas unit/widget):
  ```bash
  flutter test --coverage
  ```
  O relatório é gerado em `coverage/lcov.info` (pode ser aberto com ferramentas como VS Code “Coverage Gutters” ou `lcov`).

## Checklist antes do PR

Rode os mesmos checks do CI localmente para evitar erros no GitHub:

```powershell
.\scripts\ci_local.ps1
```

Ou manualmente:

```bash
flutter analyze
flutter test
flutter test integration_test/app_test.dart -d <androidDeviceId>
```

## CI

O workflow em `.github/workflows/flutter_test.yml` roda em push/PR para `main` ou `master`:

- `flutter analyze`
- `flutter test` (unit + widget)
- `flutter test integration_test/app_test.dart -d emulator-5554` (Android)

Há também um exemplo comentado em `docs/ci_flutter.yml` para referência.

---

**Resumo de comandos**

| Objetivo              | Comando |
|-----------------------|--------|
| Unit + widget         | `flutter test` |
| Integration (Android) | `flutter test integration_test/app_test.dart -d <androidDeviceId>` |
| Analisar código       | `flutter analyze` |
