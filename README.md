# Flutter Expense Tracker

A feature-rich expense tracking app built with **Flutter** and **Firebase**. Supports categories, budgets, charts, and monthly reports.

## Features

- Add income and expense transactions with categories
- Monthly budget limits per category
- Interactive charts (for analytics)
- Recurring transaction support
- Export to CSV
- Firebase Authentication (Google Sign-In)
- Cloud sync with Firestore
- Cross-platform: iOS, Android

## Tech Stack

- **Flutter** 3.x
- **Dart** 3.x
- **Firebase Auth** - Google Sign-In
- **Firestore** - cloud database
- **fl_chart** - charts and graphs
- **Riverpod** - state management
- **go_router** - navigation

## Getting Started

### Prerequisites

- Flutter SDK >= 3.0.0
- Firebase project set up

### Installation

```bash
git clone https://github.com/alperkaya007/flutter-expense-tracker.git
cd flutter-expense-tracker
flutter pub get
```

Configure Firebase:

```bash
flutterfire configure
```

Run the app:

```bash
flutter run
```

## Project Structure

```
lib/
  models/
    transaction.dart
    category.dart
    budget.dart
  services/
    firestore_service.dart
    auth_service.dart
  providers/
    transaction_provider.dart
    budget_provider.dart
  screens/
    dashboard_screen.dart
    add_transaction_screen.dart
    analytics_screen.dart
    settings_screen.dart
  widgets/
    transaction_card.dart
    budget_bar.dart
  main.dart
```

## Screenshots

Coming soon...

## Built With AI

This project was developed using **vibe coding** methodology with:
- Cursor IDE
- Claude (Anthropic)

---

Made by [Alper Kaya](https://github.com/alperkaya007)
