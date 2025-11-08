# Assets Folder

## Cara Menambahkan Foto Profile

1. Siapkan foto Anda dengan format JPG atau PNG
2. Rename foto menjadi `profile.jpg` atau `profile.png`
3. Copy foto ke folder ini (`assets/images/`)
4. Update kode di `lib/screens/splash_screen.dart`:

### Ubah bagian ini (sekitar line 117-128):

```dart
// Dari:
Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(color: Colors.white, width: 3),
    color: Colors.white,
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

// Menjadi:
Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(color: Colors.white, width: 3),
    image: DecorationImage(
      image: AssetImage('assets/images/profile.jpg'), // atau profile.png
      fit: BoxFit.cover,
    ),
  ),
),
```

### Update juga di Biodata Screen jika diperlukan

File: `lib/screens/biodata_screen.dart` (sekitar line 142-157)

```dart
// Dari icon placeholder menjadi:
Container(
  width: 120,
  height: 120,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(color: Colors.blue.shade300, width: 4),
    image: DecorationImage(
      image: AssetImage('assets/images/profile.jpg'),
      fit: BoxFit.cover,
    ),
  ),
),
```

## File yang Bisa Ditambahkan

- `profile.jpg` atau `profile.png` - Foto profile Anda
- Logo aplikasi (jika ada)
- Icon atau gambar lain yang diperlukan

## Format yang Didukung

- JPG / JPEG
- PNG
- WebP
- GIF

## Ukuran yang Disarankan

- Foto Profile: 500x500 px
- Logo: 512x512 px (untuk icon aplikasi)
