# 🌦️ Meteorologia App

Aplicativo Flutter desenvolvido para consulta de clima em tempo real utilizando a API Open-Meteo.  
O projeto permite autenticação simples, busca de cidades e visualização de dados climáticos com gráficos.

---

# 🚀 Funcionalidades

✔ Login com usuário e senha temporários (admin / 123)  
✔ Busca de cidades  
✔ Integração com API Open-Meteo  
✔ Consulta de clima em tempo real  
✔ Exibição da temperatura atual  
✔ Previsão do clima  
✔ Gráfico de temperatura (fl_chart)  
✔ Navegação entre telas  

---

# 📱 Fluxo do Aplicativo

Login (admin / 123)  
↓  
Home (buscar cidade)  
↓  
API Open-Meteo (geocoding + forecast)  
↓  
Weather Page (temperatura atual)  
↓  
Chart Page (gráfico da previsão)

---

# 🌍 API Utilizada

## Open-Meteo API

- Geocoding API (conversão de cidade para coordenadas)
- Forecast API (previsão do clima)

Links:
https://open-meteo.com/

---

# 🧠 Estrutura do Projeto
```bash
lib/
├── main.dart
│
├── models/
│ └── user_model.dart
│
├── pages/
│ ├── login_page.dart
│ ├── home_page.dart
│ ├── weather_page.dart
│ ├── chart_page.dart
│
├── services/
│ ├── geo_service.dart
│ └── weather_service.dart
│
├── widgets/
│ ├── search_box.dart
│ ├── forecast_chart.dart
│ └── weather_card.dart
```
---

# 🔧 Tecnologias Utilizadas

- Flutter
- Dart
- HTTP (requisições)
- Shared Preferences (login temporário)
- fl_chart (gráficos)
- API Open-Meteo

---

# ▶️ Como Executar o Projeto

## 1. Clonar ou abrir o projeto
```bash
flutter create meteorologia_app
2. Instalar dependências
flutter pub get
3. Executar o projeto
flutter run -d chrome
🔐 Login de Acesso
Usuário: admin
Senha: 123
📊 Funcionalidade do Gráfico

O gráfico exibe a variação de temperatura ao longo dos dias utilizando dados reais retornados pela API Open-Meteo.

🌦️ Objetivo do Projeto

O objetivo deste aplicativo é demonstrar:

Consumo de API externa
Organização de projeto Flutter
Uso de widgets reutilizáveis
Manipulação de estado
Visualização de dados com gráficos
Navegação entre telas
👨‍💻 Autor

Projeto desenvolvido para atividade acadêmica N2 – Desenvolvimento Mobile.
