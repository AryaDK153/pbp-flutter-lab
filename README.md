# Repositori Tugas Flutter

> Arya Daniswara Khairan - 2106702781

[Tugas-7](#tugas-7) [Tugas-8](#tugas-8)


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

### Column, Center, EdgeInsets, CrossAxisAlignment, SingleChildScrollView, Icon

Membantu mengatur penampilan.
* Column
> untuk atur baris vertikal
* Center
> untuk center alignment
* EdgeInsets
> mirip dengan margin, membantu padding
* CrossAxisAlignment
> membantu widget alignment dalam sebuah container (tidak harus widget "Container")
* SingleChildScrollView
> membuat scrollable box, berguna jika terlalu banyak isian dalam form tugas ini.
* Icon
> memunculkan ikon yang berguna untuk menginformasikan fungsi tombol tanpa perlu menambahkan teks label.

### Navigator

Mengatur navigasi dalam bentuk "stack". Berguna untuk pindah-pindah halaman. Cara kerja akan dijelaskan di bagian [cara kerja navigator](#cara-kerja-navigator)

### Form dan Jenis-jenis FormField

Sebuah pembungkus untuk mengelompokkan widget-widget FormField.

* TextFormField
> jenis formfield yang menerima string sebagai input
* DropdownButton
> jenis input reader yang akan memunculkan list dropdown ketika diklik dan mengembalikan input yang dipilih

Sebagai tambahan, ketika akan menyimpan isi form, digunakan TextButton dengan event trigger [onPressed](#onpressed) untuk memvalidasi isi form sebelum menyimpannya.

## Flutter Events
* onTap : mendeteksi gestur sentuh. Digunakan pada clickable text container
* onChanged : mendeteksi perubahan, biasanya pada input. Digunakan pada input field
* onPressed : mirip dengan onTap, namun lebih seperti menekan daripada menyentuh. Digunakan pada button
* onSaved : mendeteksi penyimpanan data input. Digunakan pada form

## Cara Kerja Navigator
Widget Navigator bekerja seperti tumpukan/stack layar. Navigator berfungsi mengelola layar-layar yang ditumpuk (route) atau yang disebut sebagai routing dengan prinsip LIFO (last-in-first-out). Fungsi Navigator yang biasa dipanggil yaitu Navigator.push dan/atau Navigator.pop, atau cukup dengan Navigator.pushReplace (perbedaan push dengan pushReplace dapat dilihat di [atas](#perbedaan-navigatorpush-dan-navigatorpushreplacement)).

Cara kerja push dan pop mirip dengan ketika memasukkan data ke suatu list dengan prinsip LIFO. Ketika ingin pindah ke halaman baru (Last-In), digunakan push yang akan membawa halaman tersebut ke puncak stack halaman. Ketika ingin kembali ke halaman sebelumnya, cukup gunakan pop dan halaman yg sedang berada di puncak stack akan dibuang dari stack (First-Out).

## Implementasi Checklist Tugas 8
1. Menambahkan Drawer
Cukup sederhana, tambahkan selector parameter **drawer** sebelum body dan gunakan material **Drawer** yang telah diimport dari material.dart.

2. Menambahkan 3 Tombol Navigasi pada Drawer
Tambahkan parameter children pada Drawer yang telah dibuat. Gunakan material **ListTile** dengan parameter title untuk judul dan parameter onTap untuk mengatur navigasi. Pastikan masing-masing navigasi terus melakukan passing ke halaman/route yang dituju. Routing sebagai berikut:

```
Navigator.pushReplacement(
    context,
    <route masing-masing>,
);
```
route masing-masing adalah sebagai berikut
    * Counter : 'MaterialPageRoute(builder: (context) => MyHomePage(counter: counter, savedList: savedList)),'
    * Form : 'MaterialPageRoute(builder: (context) => MyAddPage(counter: counter, savedList: savedList)),'
    * Data : 'MaterialPageRoute(builder: (context) => MyDataPage(counter: counter, savedList: savedList)),'

3. Menambahkan Halaman Form
Menambahkan class untuk halaman dan state halaman form seperti yang dimiliki halaman counter_7.


Class halaman. Ini juga yang akan digunakan untuk navigasi.
```
class MyAddPage extends StatefulWidget {
  MyAddPage({super.key, this.counter=0, this.savedList=const []});

  int counter;
  List<SavedData> savedList;

  @override
  State<MyAddPage> createState() => _MyAddPageState(counter: counter, savedList: savedList);
}
```

class state halaman.
```
class _MyAddPageState extends State<MyAddPage> {
  _MyAddPageState({this.counter=0, this.savedList=const []});
  int counter;

  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int _nominal = 0;
  String jenis = 'Pengeluaran';
  List<String> listJenis = ['Pengeluaran', 'Pemasukan'];

  List<SavedData> savedList;

  @override
  Widget build(BuildContext context) {
  ...
}
```

Pada class state halaman, terlihat beberapa variabel yang akan dibentuk menjadi input field sebagai berikut:

* String Judul Budget : diinisiasi sebagai string kosong
```
Padding(
    // Menggunakan padding sebesar 8 pixels
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
    decoration: InputDecoration(
        hintText: "Contoh: Beli Sate Pacil",
        labelText: "Judul",
        // Menambahkan icon agar lebih intuitif
        // icon: const Icon(Icons.people),
        // Menambahkan circular border agar lebih rapi
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        ),
    ),
    // Menambahkan behavior saat nama diketik
    onChanged: (String? value) {
        setState(() {
        _judul = value!;
        });
    },
    // Menambahkan behavior saat data disimpan
    onSaved: (String? value) {
        setState(() {
        _judul = value!;
        });
    },
    // Validator sebagai validasi form
    validator: (String? value) {
        if (value == null || value.isEmpty) {
        return 'Judul tidak boleh kosong!';
        }
        return null;
    },
    ),
),
```

* Integer Nominal Budget : diinisiasi sebagai nol
```
Padding(
    // Menggunakan padding sebesar 8 pixels
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
    decoration: InputDecoration(
        hintText: "Contoh: 15000",
        labelText: "Nominal",
        // Menambahkan icon agar lebih intuitif
        // icon: const Icon(Icons.people),
        // Menambahkan circular border agar lebih rapi
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        ),
    ),
    // Menambahkan behavior saat nama diketik
    keyboardType: TextInputType.number,
    inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
    ],
    onChanged: (String? value) {
        setState(() {
        _nominal = int.parse(value!);
        });
    },
    // Menambahkan behavior saat data disimpan
    onSaved: (String? value) {
        setState(() {
        _nominal = int.parse(value!);
        });
    },
    // Validator sebagai validasi form
    validator: (String? value) {
        if (value == null || value.isEmpty) {
        return 'Nominal tidak boleh kosong!';
        }
    },
    ),
),
```

* Dropdown Tipe Budget : menggunakan list berisi elemen bertipe string
```
Center(
    // leading: const Icon(Icons.class_),
    child: DropdownButton(
    value: jenis,
    icon: const Icon(Icons.keyboard_arrow_down),
    items: listJenis.map((String items) {
        return DropdownMenuItem(
        value: items,
        child: Text(items),
        );
    }).toList(),
    onChanged: (String? newValue) {
        setState(() {
        jenis = newValue!;
        });
    },
    ),
),
```

tak lupa untuk menambahkan tombol simpan budget yang akan menggabungkan input kedalam object SavedData sebagai berikut:
```
class SavedData { //object
  String judul;
  int nominal;
  String jenis;

  SavedData(this.judul, this.nominal, this.jenis);
}
```

lalu tombol dibuat dengan event onPressed sebagai berikut:
```
TextButton(
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.blue),
    ),
    onPressed: () {
    if (_formKey.currentState!.validate()) {
        // TODO: Add to savedList
        SavedData toSave = new SavedData(_judul, _nominal, jenis);
        // print('${toSave.judul} ${toSave.nominal} ${toSave.jenis}'); // testing purposes
        savedList.add(toSave);
        // print(savedList); // testing purposes
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyAddPage(counter: counter, savedList: savedList)),
        );
    }
},
```

4. Menambahkan Halaman Data
Pembuatan halaman sama dengan pembuatan halaman form, dibuat sedemikian dapat menerima data ketika pindah halaman.

* Tampilkan Data-Data yang Telah Disimpan
dari data yang diterima saat pindah halaman, digunakan listview dengan parameter children yang berisi **for loop** yang akan mengiterasi list berisi objek SavedData sebagai berikut:

```
body: ListView(
    padding: const EdgeInsets.all(15), // sets all padding to 15
    children: [
        for (SavedData data in savedList) Card(
            elevation: 2.0,
                child: Column(
                    children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            const SizedBox(width: 10),
                            Text(
                                data.judul,
                                style: const TextStyle(fontSize: 40),
                        ),
                        const SizedBox(width: 10),
                        ],
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                            const SizedBox(width: 10),
                            Text(
                                '${data.nominal}',
                                style: const TextStyle(fontSize: 20),
                            ),
                            Expanded(child: Container()),
                            Text(
                                data.jenis,
                                style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(width: 10),
                        ],
                    ),
                    const SizedBox(height: 10),
                ],
            ),
        ),
    ],
),
```