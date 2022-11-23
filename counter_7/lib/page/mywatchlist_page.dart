import 'package:counter_7/main.dart';
import 'package:counter_7/data.dart';
import 'package:counter_7/add_form.dart';
import 'package:counter_7/page/watchdetails_page.dart';
import 'package:flutter/material.dart';

// Tugas 9
import '../model/mywatchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyWatchListPage extends StatefulWidget {
  MyWatchListPage({super.key, required this.counter, required this.savedList});

  int counter;
  List<SavedData> savedList;

  @override
  State<MyWatchListPage> createState() => _MyWatchListPageState(counter: counter, savedList: savedList);
}

class _MyWatchListPageState extends State<MyWatchListPage> {

  // late Future<List<MyWatchList>> _fetched;
  Future<List<MyWatchList>> fetchMyWatchList() async {
    // var url = 'https://fistofadventure.herokuapp.com/mywatchlist/json/';
    var url = Uri.parse('https://fistofadventure.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object MyWatchList
    List<MyWatchList> listMyWatchList = [];
    for (var d in data) {
      if (d != null) {
        listMyWatchList.add(MyWatchList.fromJson(d));
      }
    }

    return listMyWatchList;
  }

  _MyWatchListPageState({required this.counter, required this.savedList});

  int counter;
  List<SavedData> savedList;

  // @override
  // void initState() {
  //   super.initState();
  //   _fetched = fetchMyWatchList();
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('My WatchList'),
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
      body: FutureBuilder<List<MyWatchList>> (
        future: fetchMyWatchList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada my watchlist :(",
                    style: TextStyle(
                      color: Color(0xff59A5D8),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 15),
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index)=> Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            debugPrint('Card tapped.');
                          },
                          child: ListTile(
                            title: Text(
                              "${snapshot.data![index].fields.title}",
                              style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            onTap: () {
                              // Route menu ke halaman data
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => WatchDetailsPage(counter: counter, savedList: savedList, data: snapshot.data[index].fields)),
                              );
                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              );
            }
          }
        }
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