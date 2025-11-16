<<<<<<< HEAD
# OLX-style Marketplace UI (Flutter)

UI sederhana mirip OLX/marketplace. Fokus pada tampilan dan navigasi antar halaman. Tanpa backend/API.

## Spesifikasi
- Flutter: >= 3.0.0
- Dart SDK: >= 3.0.0
- State management: `setState` (sederhana)
- Responsif untuk smartphone & tablet (List vs Grid)
- Bonus kecil: animasi transisi + Hero image, modal bottom sheet

## Fitur
- Login Page:
  - Input email & password
  - Validasi sederhana: tidak boleh kosong
  - Tombol Masuk → navigasi ke Home
  - Tombol Daftar (dummy)
- Home Page:
  - Daftar produk dengan gambar, nama, lokasi, harga
  - Badge "Baru/Bekas" memakai Chip
  - Bottom navigation (dummy)
  - Floating action button (dummy)
  - Detail modal (UI-only)

## Cara Menjalankan
1. Pastikan Flutter versi >= 3.0.0
2. Clone repo atau copy project ini
3. Siapkan gambar dummy di `assets/images/`:
   - `phone.jpg`, `bike.jpg`, `laptop.jpg`, `chair.jpg`
4. Jalankan:
   ```bash
   flutter pub get