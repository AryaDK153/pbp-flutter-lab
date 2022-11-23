import 'package:counter_7/main.dart';
import 'package:counter_7/add_form.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/mywatchlist_page.dart';

class MyDataPage extends StatefulWidget {
  MyDataPage({super.key, this.counter=0, this.savedList=const []});

  int counter;
  List<SavedData> savedList;

  @override
  State<MyDataPage> createState() => _MyDataPageState(counter: counter, savedList: savedList);
}

class _MyDataPageState extends State<MyDataPage> {
  _MyDataPageState({this.counter=0, this.savedList = const []});

  int counter;
  List<SavedData> savedList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      // Menambahkan drawer menu
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(counter: counter, savedList: savedList)),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyAddPage(counter: counter, savedList: savedList)),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman data
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyDataPage(counter: counter, savedList: savedList)),
                );
              },
            ),

            // WatchList Tugas 9
            ListTile(
              title: const Text('My WatchList'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyWatchListPage(counter: counter, savedList: savedList)),
                );
              },
            ),

          ],
        ),
      ),
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
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text('Hello World!'),
      //     ],
      //   ),
      // ),
    );
  }
}