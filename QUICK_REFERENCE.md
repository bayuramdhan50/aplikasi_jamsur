# Quick Reference - Aplikasi Jamsur

## 🚀 Quick Start

```bash
# 1. Install dependencies
flutter pub get

# 2. Run aplikasi
flutter run
```

## ⚡ File Penting yang Perlu Diubah

### 1. NIM & Nama (WAJIB!)

**File:** `lib/screens/splash_screen.dart`  
**Line:** ~143-157

```dart
Text('NIM: 123456789'),      // ← Ganti ini
Text('Nama: [Nama Anda]'),   // ← Ganti ini
```

### 2. Foto Profile (Opsional)

**Lokasi:** `assets/images/profile.jpg`  
**Update di:** `lib/screens/splash_screen.dart` line ~117

## 📱 Struktur Aplikasi

```
Splash Screen (5 detik)
    ↓
Dashboard (Bottom Navigation)
    ├── Biodata      → Form lengkap
    ├── Kontak       → 15 kontak
    ├── Kalkulator   → Operasi matematika
    ├── Cuaca        → Info cuaca + forecast
    └── Berita       → 10 berita
```

## 🎨 Warna Setiap Halaman

- **Splash:** Blue gradient
- **Biodata:** Blue theme
- **Kontak:** Purple theme
- **Kalkulator:** Teal theme
- **Cuaca:** Blue gradient (langit)
- **Berita:** Orange theme

## 📋 Fitur Lengkap

### Biodata

- ✅ Text input (4 field)
- ✅ Calendar picker
- ✅ Radio button
- ✅ Dropdown

### Kontak

- ✅ 15 kontak statis
- ✅ Circle avatar
- ✅ Quick actions

### Kalkulator

- ✅ +, -, ×, ÷
- ✅ x², √
- ✅ Clear, Backspace

### Cuaca

- ✅ Info lengkap (6 data)
- ✅ Forecast 7 hari
- ✅ Sunrise/Sunset

### Berita

- ✅ 10 berita
- ✅ 10 kategori
- ✅ Detail modal

## 🔧 Troubleshooting

### Error: Asset not found

```bash
flutter clean
flutter pub get
```

### Aplikasi tidak jalan

```bash
flutter doctor
flutter pub get
flutter run
```

## 📚 Dokumentasi

- **START_HERE.md** - Mulai di sini!
- **DOKUMENTASI.md** - Detail lengkap
- **PANDUAN_PERSONALISASI.md** - Cara custom
- **CHECKLIST_FITUR.md** - Semua fitur

## ✅ Pre-Submit Checklist

- [ ] NIM diganti
- [ ] Nama diganti
- [ ] Foto upload (opsional)
- [ ] Test run OK
- [ ] No errors

## 🎯 Commands Berguna

```bash
# Install packages
flutter pub get

# Clean project
flutter clean

# Run app
flutter run

# Hot reload (saat app running)
r

# Hot restart
R

# Check errors
flutter analyze

# Build APK (Android)
flutter build apk
```

## 💡 Pro Tips

1. Selalu `flutter pub get` setelah update pubspec.yaml
2. Gunakan hot reload (r) untuk perubahan UI
3. Gunakan hot restart (R) untuk perubahan logic
4. Test di emulator sebelum submit
5. Baca error message dengan teliti

## 🎨 Customization Quick Guide

### Ganti Warna Utama

**File:** `lib/main.dart` line ~24

```dart
seedColor: Colors.blue, // Ganti warna
```

### Ganti Nama App

**Android:** `android/app/src/main/AndroidManifest.xml`

```xml
android:label="Aplikasi Jamsur"
```

### Tambah Kontak

**File:** `lib/screens/contact_screen.dart` line ~10

### Tambah Berita

**File:** `lib/screens/news_screen.dart` line ~10

---

**Semua yang Anda butuhkan ada di sini!** 🎉
