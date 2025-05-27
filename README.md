# 🦸‍♂️ Fluttoon

A Flutter application for browsing and reading webtoons.

## 🚀 Features

- Browse webtoons with a modern UI
- View webtoon details including description, genre, and age rating
- Like/bookmark favorite webtoons
- View latest episodes
- Clean and responsive design
- Multi-platform support (iOS, Android, Web)
- Use GoogleFonts for Korean font support

## 🛠 Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: Built-in setState
- **UI Components**: Material Design
- **Fonts**: Google Fonts (Nanum Gothic)
- **Network**: HTTP client for API calls
- **Storage**: Shared Preferences for local storage
- **Navigation**: Flutter Navigation 2.0

## 📦 Dependencies

- `google_fonts`: ^6.1.0 - For Korean font support
- `shared_preferences`: For storing user preferences
- `url_launcher`: For opening external links
- `http`: For API calls

## 📂 Project Structure

```
lib/
├── models/          # Data models
├── screens/         # UI screens
├── services/        # API services
└── widgets/         # Reusable widgets
```

## 📝 Getting Started

### 📋 Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### 📦 Installation

1. Clone the repository
```bash
git clone https://github.com/feelsuegood/letsue-flutter.git
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## 💻 Development Setup

### 📝 VS Code Settings
Add these settings to your `settings.json`:
```json
{
    "editor.codeActionsOnSave": {
        "source.fixAll": "always"
    },
    "dart.previewFlutterUiGuides": true
}
```

### 📦 Recommended Extensions
- **Error Lens**: Better error visualization
- **Flutter**: Official Flutter extension
- **Dart**: Official Dart extension

## 🎨 Design References

- [Financial Mobile IOS App](https://dribbble.com/shots/19858341-Financial-Mobile-IOS-App)
- [POMO UIKIT](https://www.behance.net/gallery/98918603/POMO-UIKIT)
- [Creating a webtoon app with Flutter - Nomad Coders](https://nomadcoders.co/flutter-for-beginners)

## 🏷️ License
- CC BY-NC-SA 4.0 (non-commercial research only)
- This project is for non-commercial research and educational purposes only.