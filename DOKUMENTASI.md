# Aplikasi Jamsur - Mobile Application

Aplikasi mobile yang dibuat menggunakan Flutter dengan fitur-fitur lengkap dan tampilan yang estetik.

## 📱 Fitur Aplikasi

### 1. Splash Screen

- Tampilan awal aplikasi selama 5 detik
- Menampilkan judul aplikasi
- Foto profile (placeholder)
- NIM dan Nama mahasiswa
- Animasi fade dan scale yang smooth
- Transisi halus ke Dashboard

### 2. Dashboard dengan Bottom Navigation

- Navigasi menggunakan Material 3 NavigationBar
- 5 menu utama yang dapat diakses dengan mudah
- Transisi antar halaman yang smooth
- Ikon yang jelas dan intuitif

### 3. Halaman Biodata

- Form input data pribadi yang lengkap
- **Input Fields:**
  - Nama Lengkap
  - Email
  - Nomor Telepon
  - Tanggal Lahir (Date Picker)
  - Alamat
- **Radio Button:** Pilihan jenis kelamin
- **Dropdown:** Pilihan pendidikan terakhir
- **Calendar:** Pemilihan tanggal lahir
- Desain modern dengan profile photo placeholder
- Validasi form
- Data disimpan sementara (tidak ke database)

### 4. Halaman Kontak

- Daftar 15 kontak dengan informasi lengkap
- **Informasi setiap kontak:**
  - Circle Avatar dengan initial nama
  - Nama lengkap
  - Nomor telepon
  - Email
- **Fitur interaktif:**
  - Tap untuk melihat detail kontak
  - Tombol quick action (Call & Message)
  - Modal bottom sheet untuk detail lengkap
- Desain card yang estetik dengan gradient
- Warna berbeda untuk setiap kontak

### 5. Halaman Kalkulator

- **Operasi Matematika:**
  - Penjumlahan (+)
  - Pengurangan (-)
  - Perkalian (×)
  - Pembagian (÷)
  - Kuadrat (x²)
  - Akar Kuadrat (√)
- **Fitur tambahan:**
  - Tombol Clear (C)
  - Tombol Backspace (⌫)
  - Support angka desimal
  - Error handling untuk pembagian dengan nol
  - Display yang menampilkan operasi yang sedang berjalan
- Desain modern dengan button yang colorful
- Haptic feedback pada setiap tombol

### 6. Halaman Cuaca

- Tampilan cuaca dengan data statis
- **Informasi yang ditampilkan:**
  - Suhu saat ini
  - Kondisi cuaca (icon animasi)
  - Kelembapan
  - Kecepatan angin
  - Jarak pandang
  - Tekanan udara
  - Waktu matahari terbit & terbenam
- **Prakiraan 7 hari** dengan scroll horizontal
- Gradient background yang menarik
- Icon cuaca yang representatif

### 7. Halaman Berita

- Daftar 10 berita terkini dengan data statis
- **Informasi setiap berita:**
  - Judul berita
  - Kategori (dengan warna berbeda)
  - Deskripsi singkat
  - Penulis
  - Tanggal publish
  - Header image dengan gradient
- **Fitur interaktif:**
  - Tap untuk membaca detail lengkap
  - Modal bottom sheet dengan content lengkap
  - Tombol bookmark dan share
- 10 kategori berbeda dengan warna unik:
  - Teknologi (Biru)
  - Ekonomi (Hijau)
  - Olahraga (Merah)
  - Pendidikan (Ungu)
  - Kesehatan (Teal)
  - Travel (Orange)
  - Lingkungan (Light Green)
  - Kuliner (Amber)
  - Bisnis (Indigo)
  - Hiburan (Pink)

## 🎨 Desain & Tampilan

- **Material Design 3**: Menggunakan komponen terbaru dari Material 3
- **Color Scheme**: Setiap halaman memiliki tema warna yang berbeda
- **Animasi**: Smooth transitions dan animations
- **Responsive**: Layout yang responsive untuk berbagai ukuran layar
- **Clean UI**: Interface yang bersih dan modern
- **Consistent**: Konsisten dalam penggunaan spacing, padding, dan styling

## 📁 Struktur Project

```
lib/
├── main.dart                    # Entry point aplikasi
├── models/                      # Data models
│   ├── contact_model.dart      # Model untuk kontak
│   └── news_model.dart         # Model untuk berita
├── screens/                     # Semua halaman aplikasi
│   ├── splash_screen.dart      # Halaman splash
│   ├── dashboard_screen.dart   # Halaman utama dengan navigation
│   ├── biodata_screen.dart     # Halaman biodata
│   ├── contact_screen.dart     # Halaman kontak
│   ├── calculator_screen.dart  # Halaman kalkulator
│   ├── weather_screen.dart     # Halaman cuaca
│   └── news_screen.dart        # Halaman berita
└── widgets/                     # Custom widgets (jika diperlukan)
```

## 🚀 Cara Menjalankan Aplikasi

1. Pastikan Flutter SDK sudah terinstall
2. Clone repository ini
3. Buka terminal dan navigate ke folder project
4. Jalankan command:
   ```bash
   flutter pub get
   ```
5. Untuk menjalankan aplikasi:
   ```bash
   flutter run
   ```

## 📦 Dependencies

- `flutter`: SDK utama
- `cupertino_icons`: Icon untuk iOS style
- `intl`: Untuk formatting tanggal

## 📝 Catatan Penting

### Data yang Digunakan

- Semua data bersifat **STATIS** (hardcoded)
- Data tidak disimpan ke database
- Data kontak, berita, dan cuaca adalah contoh/dummy data

### Customisasi

Untuk personalisasi aplikasi, silakan ubah:

1. **Splash Screen** (`lib/screens/splash_screen.dart`):

   - Ganti NIM pada line ~144
   - Ganti Nama pada line ~151
   - Upload foto dan update path image jika diperlukan

2. **Theme Colors**: Dapat diubah di `lib/main.dart`

3. **Data Statis**:
   - Kontak: `lib/screens/contact_screen.dart`
   - Berita: `lib/screens/news_screen.dart`
   - Cuaca: `lib/screens/weather_screen.dart`

## 🎯 Fitur yang Menonjol

1. **Clean Architecture**: Pemisahan concerns yang jelas
2. **Reusable Code**: Komponen yang dapat digunakan kembali
3. **Modern UI/UX**: Mengikuti tren design terkini
4. **Smooth Animations**: Transisi yang halus antar halaman
5. **Interactive Elements**: Banyak elemen interaktif
6. **Error Handling**: Handling error pada kalkulator
7. **User Feedback**: SnackBar dan visual feedback

## 📱 Screenshots

(Tambahkan screenshots aplikasi di sini)

## 👨‍💻 Developer

- **NIM**: [Masukkan NIM Anda]
- **Nama**: [Masukkan Nama Anda]
- **Kelas**: [Masukkan Kelas Anda]

## 📄 License

Project ini dibuat untuk keperluan tugas kuliah.

---

**Catatan**: Jangan lupa untuk mengganti informasi NIM dan Nama di Splash Screen sebelum menjalankan aplikasi!
