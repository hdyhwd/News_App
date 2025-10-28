

---

# Read News – Aplikasi Berita Flutter

**Read News** adalah aplikasi agregator berita mobile modern yang dibangun menggunakan **Flutter**. Aplikasi ini memungkinkan pengguna menjelajahi berita terbaru dari berbagai kategori, membaca artikel dengan nyaman, dan menyimpan artikel favorit di satu tempat. Fokus utama aplikasi ini adalah tampilan yang bersih, performa cepat, dan pengalaman pengguna yang intuitif.

---

## Tampilan Aplikasi

Berikut contoh tampilan tiga layar utama: Home, Discover (Filter Kategori), dan Detail Artikel.

<img width="333" height="686" alt="Screenshot 2025-10-28 092202" src="https://github.com/user-attachments/assets/39bc7e17-779d-4244-bb2d-d1f6059472fa" />
<img width="328" height="694" alt="Screenshot 2025-10-28 092220" src="https://github.com/user-attachments/assets/db169ba2-035a-474a-a681-7865c8eeb790" />
<img width="332" height="695" alt="Screenshot 2025-10-28 092233" src="https://github.com/user-attachments/assets/8a646545-bdde-4e81-9376-2cb21ecfb3e6" />
<img width="369" height="767" alt="Screenshot 2025-10-28 200227" src="https://github.com/user-attachments/assets/f46fcbb2-49eb-4904-9213-f9f6b8e52c06" />



---

## Fitur Utama

**Navigasi 3 Tab Utama:**

* **Home:** Menampilkan berita "Trending Now" (horizontal) dan "Latest News" (vertikal).
* **Discover:** Memungkinkan pengguna memfilter berita berdasarkan kategori (All, Politics, Technology, dll.) melalui TabBar.
* **Save:** Menampilkan semua artikel yang telah disimpan (di-bookmark) oleh pengguna.

**Halaman Detail Artikel:** Tampilan membaca yang imersif dengan gambar hero dan AppBar transparan.

**Manajemen Favorit:** Pengguna dapat menyimpan atau menghapus artikel dari daftar favorit mereka dengan state management yang reaktif.

**UI Modern:** Desain presisi tinggi yang mengikuti referensi UI profesional.

---

## Arsitektur & Teknologi

Aplikasi ini dibangun dengan arsitektur modular yang mudah dikelola dan dikembangkan.

* **State Management:** Menggunakan **Provider** (`ChangeNotifier` dan `ChangeNotifierProvider`) untuk mengelola state global, khususnya daftar artikel favorit.
* **Struktur Folder:**

  * `models`: Model data (contoh: `NewsArticle`).
  * `providers`: Logika state management (contoh: `NewsProvider`).
  * `services`: Mengambil data (saat ini `ApiService` menggunakan data dummy).
  * `screens`: Halaman utama aplikasi (`HomePage`, `DetailPage`).
  * `widgets`: Widget kustom yang dapat digunakan ulang (`ArticleListTile`, `TrendingCard`).
* **Navigasi:** BottomNavigationBar + IndexedStack untuk menjaga state setiap tab, Navigator.push untuk navigasi ke halaman detail.

---

## Cara Menjalankan

1. Pastikan Flutter SDK sudah terpasang.
2. Clone repositori:

```bash
git clone https://github.com/NAMA_ANDA/insight-now.git
```

3. Masuk ke direktori proyek:

```bash
cd insight-now
```

4. Ambil dependencies:

```bash
flutter pub get
```

5. Jalankan aplikasi:

```bash
flutter run
```

---

## Roadmap & Pengembangan Selanjutnya

Beberapa rencana pengembangan ke depan:

* **Integrasi API:** Mengganti `ApiService` (dummy) dengan panggilan HTTP ke API berita nyata (GNews, NewsAPI).
* **Database Cloud:** Migrasi penyimpanan favorit ke Firebase Firestore agar data tersimpan permanen dan tersinkronisasi antar perangkat.
* **Fungsi Search:** Menambahkan search bar di halaman Home untuk pencarian artikel secara real-time.

