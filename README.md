# Repositori Tugas Flutter

> Arya Daniswara Khairan - 2106702781


# Tugas 7

## Stateless dan Stateful Widget
### Stateless Widgets
> Widget yang datanya tidak berubah secara internal, melainkan mengikuti perubahan eksternal pada parent.

### Stateful Widgets
> Widget yang datanya bisa terus berubah (dinamis), misalnya berubah sesuai event (event trigger).

## Widget yang Digunakan pada Tugas 7

Selain widget yang sudah disediakan oleh flutter ketika membuat program baru, pada tugas 7, digunakan widget-widget berikut:

### Text & TextStyle
Widget text akan menerima masukan berupa string yang akan dimunculkan. Kemudian, dengan menambahkan TextStyle, kita dapat memasukkan atribut-atribut style untuk string yang telah dimasukkan, seperti color, fontSize, dsb. 

### FloatingActionButton
Widget ini digunakan ketika ingin membuat tombol berbentuk lingkaran yang terlihat melayang (hovering/floating). Tombol dapat memiliki icon dan fungsi yang akan dijalankan ketika ditekan.

### Padding dan Row
Widget yang berguna untuk mengatur tata letak (jarak antar widget).

## Fungsi setState() dan Variabel yang Terdampak
setState berfungsi untuk memberitahukan kepada framework yang sedang dijalankan untuk menjalankan build dan melakukan update terhadap tampilan pada user interface.

Variabel yang terdampak ketika pemanggilan setState adalah variabel yang diubah di dalam fungsinya. Misal:

```
setState(() {
    _counter++;
    ...
});
```

maka, variabel yang terpengaruh adalah variabel "_counter". Sehingga, tampilan widget apapun yang mengikuti perubahan pada _counter akan ikut terdampak (update).

## Perbedaan const dan final
const: Data bisa mengalami perubahan NAMUN hanya saat compile, tidak menerima input runtime.

final: Data yang diinput tidak berubah, baik ketika runtime maupun compile.

## Implementasi Checklist Tugas 7
1. Membuat program baru: counter_7
Untuk memulai program baru bernama counter_7 menggunakan flutter, cukup buka command prompt dengan direktori root folder dan masukkan command berikut:
> flutter create counter_7

untuk menjalankan program, pertama-tama, masuk ke directory program yang telah dibuat, lalu jalankan programnya sebagai berikut:
> cd counter_7

> flutter run

2. Mengubah tampilan
Mengubah tampilan program agar terlihat seperti yang tertera di web tugas 7 menggunakan padding dan textstyle, serta menambahkan button dengan icon 'remove'.

3. Implementasi Logika
**Tombol +**
Fungsi sudah disediakan oleh flutter, akan menaikkan counter.

**Tombol -**
Fungsi dibuat mirip dengan logika tombol +, namun menurunkan counter dengan syarat counter > 0.

**Counter Title**
Buat variabel String "_title", kemudian, pada fungsi increment dan decrement, ditambahkan if conditional dengan kondisi sebagai berikut:

```
if (counter%2==0) { // ini akan mendeteksi counter genap
    _title = "Genap"
} else { // ini akan mendeteksi counter ganjil
    _title = "Ganjil"
}
```

Selain itu, pada widget Text yang digunakan untuk memunculkan "_title", diberikan TextStyle yang pada parameter color akan meminta warna dari fungsi yang akan mengembalikan warna merah jika counter genap dan biru jika counter ganjil.


# Tugas 8

## Perbedaan Navigator.push dan Navigator.pushReplacement
Method push hanya menambahkan rute yang dituju ke atas tumpukan screen (stack), di mana halaman baru tampil di atas halaman sebelumnya. Biasanya setelah method ini digunakan, ditambahkan method pop untuk menutup halaman sebelumnya agar program tidak menjadi terlalu berat karena semakin banyak stack.
Kinerja 2 method ini digabung ke dalam satu method, yaitu pushReplacement.

## Widget yang Digunakan pada Tugas 8

Selain yang digunakan pada tugas 7, berikut adalah widget-widget yang digunakan:

### Column, Center, EdgeInsets, CrossAxisAlignment, SingleChildScrollView

Membantu mengatur penampilan (tata letak).
> Column untuk atur baris vertikal
> Center untuk center alignment
> EdgeInsets mirip dengan margin, membantu padding
> CrossAxisAlignment membantu widget alignment dalam sebuah container (tidak harus widget "Container")
> SingleChildScrollView membuat scrollable box, berguna jika terlalu banyak isian dalam form tugas ini.

### Navigator

Mengatur navigasi dalam bentuk "stack". Berguna untuk pindah-pindah halaman. Cara kerja akan dijelaskan di bagian [cara kerja navigator](#cara-kerja-navigator)

### Form

Sebuah pembungkus untuk mengelompokkan form

### Icon

## Flutter Events
### onPressed
### onTap
### onSaved

## Cara Kerja Navigator

## Implementasi Checklist Tugas 8
1. Menambahkan Drawer
2. Menambahkan 3 Tombol Navigasi pada Drawer
    * Counter
    * Form
    * Data
3. Menambahkan Halaman Form
    * String Judul Budget
    * Integer Nominal Budget
    * Dropdown Tipe Budget
    * Tombol Simpan Budget
4. Menambahkan Halaman Data
    * Tampilkan Data-Data yang Telah Disimpan