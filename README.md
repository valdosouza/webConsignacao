# WebConsignacao

**Frontend - API Sistema de Consignação**

---

## 🛠️ Stack Detail
- **Flutter**
- **Dart**

---

## 🚀 Setup Guide

```bash
flutter doctor                # verifica seu ambiente (Flutter, Dart, Android SDK, Chrome, VS Code/Android Studio, devices)
flutter clean                 # apaga caches de build (build/, .dart_tool/, etc.).
flutter pub get               # resolve e baixa as dependências pubspec.yaml (gera pubspec.lock e .dart_tool/package_config.json).         
flutter pub outdated          # lista o que pode ser atualizado (mostra current → resolvable → latest).
flutter pub upgrade           # atualiza as dependências para as versões mais novas permitidas pelo seu pubspec.yaml
flutter analyze               # análise estática (erros/avisos do Dart/Flutter).
flutter create .              # (re)cria arquivos de plataforma na pasta, adiciona plataformas faltantes e atualiza templates.
flutter run -d chrome         
flutter devices
flutter emulators
flutter emulators --launch Medium_Phone_API_36.0
test/app/modules
flutter test
```

## 📁 Server
   lib/app/core/shared/constants.dart
---

## 📁 Modo Debug
   lib\main.dart
   .vscode\launch.json
   Na barra de status do VS Code, clique em (device) e selecione Chrome. (Ou via Ctrl+Shift+P → “Flutter: Select Device”).
   1-No VS Code: Ctrl+Shift+P → Flutter: Attach to Device. / attach to flutter on device
   2-Selecione no launch a config pra depurar: Flutter (Chrome) - main.dart, Marque breakpoints e continue (F5)

## 📋 Menu

### 👥 Clientes
- Cadastro de Clientes
- Ordem de Bonificação
- Ordenar Atendimento

### 💰 Caixa
- Clientes Atendidos
- Débitos de Clientes
- Resumo Mensal
- Média de Venda

### 📦 Produtos
- Cadastro de Produtos
- Tabela de Preço

### 🏷️ Estoque
- Cadastro de Estoque
- Ajustes de Estoque
- Transferência de Estoques
- Carregamento
- Saldo por Estoque

### 🛠️ Administração
- Estabelecimento
- Cadastro de Usuários
- Cadastro de Rotas
- Cadastro de Regiões

### 💵 Financeiro
- Forma de Pagamento

### 🧑‍💼 Pessoal
- Cargos
- Colaboradores