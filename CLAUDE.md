# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
flutter pub get          # Install dependencies
flutter analyze          # Run linter (flutter_lints)
flutter test             # Run all tests
flutter test test/widget_test.dart  # Run a single test file
flutter run              # Run on connected device/emulator
flutter build apk        # Build Android APK
flutter build web        # Build for web
```

## Architecture

This is a Flutter weather app ("Clima") that uses the OpenWeatherMap API.

**App flow:** `LoadingScreen` → fetches GPS location → `WeatherModel` calls OpenWeatherMap API → navigates to `LocationScreen`. From there users can search by city (`CityScreen`) or view 5-day forecast (`ForecastScreen`).

**Layers:**
- `lib/services/` — business logic: `weather.dart` orchestrates location + networking, maps condition codes to icons, generates temperature messages; `location.dart` wraps `geolocator`; `networking.dart` is a thin HTTP client over OpenWeatherMap endpoints
- `lib/screens/` — UI screens (one per app view)
- `lib/utilities/` — shared constants (button/text styles) and helper functions (time conversion, title case)

**API:** OpenWeatherMap endpoints `/data/2.5/weather` and `/data/2.5/forecast`, units in Imperial (Fahrenheit). The API key is stored in `lib/services/weather.dart`.
