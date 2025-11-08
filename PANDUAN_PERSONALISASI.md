# 📝 Panduan Personalisasi Aplikasi Jamsur

## 🎯 Langkah-Langkah Wajib Sebelum Submit

### 1. Update Informasi Pribadi di Splash Screen

Buka file: `lib/screens/splash_screen.dart`

**Cari dan ubah bagian ini (sekitar line 143-157):**

```dart
const Column(
  children: [
    Text(
      'NIM: 123456789',  // ← UBAH INI dengan NIM Anda
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 1,
      ),
    ),
    SizedBox(height: 8),
    Text(
      'Nama: [Nama Anda]',  // ← UBAH INI dengan Nama Anda
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 1,
      ),
    ),
  ],
),
```

**Contoh setelah diubah:**

```dart
const Column(
  children: [
    Text(
      'NIM: 2110817120001',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 1,
      ),
    ),
    SizedBox(height: 8),
    Text(
      'Nama: Budi Santoso',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 1,
      ),
    ),
  ],
),
```

### 2. Upload Foto Profile (Opsional)

**Langkah 1:** Siapkan foto Anda

- Format: JPG atau PNG
- Ukuran rekomendasi: 500x500 px
- Nama file: `profile.jpg` atau `profile.png`

**Langkah 2:** Copy foto ke folder

```
assets/images/profile.jpg
```

**Langkah 3:** Update kode di `lib/screens/splash_screen.dart` (line ~117)

Dari:

```dart
Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(color: Colors.white, width: 3),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 15,
        offset: const Offset(0, 8),
      ),
    ],
  ),
  child: const CircleAvatar(
    backgroundColor: Colors.blue,
    child: Icon(
      Icons.person,
      size: 50,
      color: Colors.white,
    ),
  ),
),
```

Menjadi:

```dart
Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(color: Colors.white, width: 3),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 15,
        offset: const Offset(0, 8),
      ),
    ],
    image: const DecorationImage(
      image: AssetImage('assets/images/profile.jpg'),
      fit: BoxFit.cover,
    ),
  ),
),
```

**Langkah 4:** Update juga di Biodata Screen (opsional)

File: `lib/screens/biodata_screen.dart` (line ~142)

Ubah dari CircleAvatar dengan Icon menjadi:

```dart
Container(
  width: 120,
  height: 120,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(
      color: Colors.blue.shade300,
      width: 4,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.blue.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 10,
      ),
    ],
    image: const DecorationImage(
      image: AssetImage('assets/images/profile.jpg'),
      fit: BoxFit.cover,
    ),
  ),
),
```

### 3. Customisasi Warna Tema (Opsional)

Buka file: `lib/main.dart`

**Ubah warna utama aplikasi (line ~24):**

```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,  // ← Ubah warna ini
    brightness: Brightness.light,
  ),
  useMaterial3: true,
  fontFamily: 'Roboto',
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
  ),
),
```

**Pilihan warna:**

- `Colors.blue` (default)
- `Colors.purple`
- `Colors.green`
- `Colors.orange`
- `Colors.red`
- `Colors.teal`
- `Colors.indigo`
- dll.

### 4. Update Nama Aplikasi

**Di Android:**
File: `android/app/src/main/AndroidManifest.xml`

Cari dan ubah:

```xml
<application
    android:label="aplikasi_jamsur"  <!-- Ubah ini -->
    ...
```

Menjadi:

```xml
<application
    android:label="Aplikasi Jamsur"
    ...
```

**Di iOS:**
File: `ios/Runner/Info.plist`

Cari dan ubah:

```xml
<key>CFBundleName</key>
<string>aplikasi_jamsur</string>  <!-- Ubah ini -->
```

## 🎨 Customisasi Lanjutan

### Mengubah Data Kontak

File: `lib/screens/contact_screen.dart` (line ~10)

Tambah/ubah kontak sesuai kebutuhan:

```dart
final List<Contact> contacts = [
  Contact(
    name: 'Nama Kontak',
    phone: '+62 812-xxxx-xxxx',
    email: 'email@example.com',
    imageUrl: 'N', // Initial nama
  ),
  // Tambah kontak lainnya...
];
```

### Mengubah Data Berita

File: `lib/screens/news_screen.dart` (line ~10)

Tambah/ubah berita:

```dart
final List<News> newsList = [
  News(
    title: 'Judul Berita',
    category: 'Kategori', // Teknologi, Ekonomi, dll
    date: 'Tanggal',
    imageUrl: 'T',
    description: 'Deskripsi berita...',
    author: 'Nama Penulis',
  ),
  // Tambah berita lainnya...
];
```

### Mengubah Data Cuaca

File: `lib/screens/weather_screen.dart`

Ubah data cuaca sesuai kebutuhan (suhu, lokasi, dll) di bagian UI.

## ✅ Checklist Sebelum Submit

- [ ] NIM sudah diganti di Splash Screen
- [ ] Nama sudah diganti di Splash Screen
- [ ] Foto profile sudah diupload (jika ada)
- [ ] Aplikasi sudah di-test dan berjalan dengan baik
- [ ] Semua halaman berfungsi dengan benar
- [ ] Tidak ada error saat compile
- [ ] README.md sudah diupdate dengan informasi Anda

## 🚀 Menjalankan Aplikasi

1. Buka terminal/command prompt
2. Navigate ke folder project
3. Jalankan:
   ```bash
   flutter pub get
   flutter run
   ```

## 🐛 Troubleshooting

### Error: Asset not found

- Pastikan file foto ada di folder `assets/images/`
- Pastikan `pubspec.yaml` sudah include assets folder
- Jalankan `flutter clean` lalu `flutter pub get`

### Error: Undefined name

- Jalankan `flutter pub get`
- Restart IDE/Editor
- Jalankan `flutter clean`

### UI tidak update

- Tekan `r` untuk hot reload
- Tekan `R` untuk hot restart
- Stop dan run ulang aplikasi

## 📞 Bantuan

Jika ada kendala, pastikan:

1. Flutter SDK sudah terinstall dengan benar
2. Path sudah dikonfigurasi
3. Emulator/Device sudah running
4. Semua dependencies sudah terinstall

---

**Selamat mengerjakan! 🎉**
