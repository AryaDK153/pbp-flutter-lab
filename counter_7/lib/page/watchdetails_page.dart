import 'package:counter_7/main.dart';
import 'package:counter_7/data.dart';
import 'package:counter_7/add_form.dart';
import 'mywatchlist_page.dart';
import 'package:flutter/material.dart';

// Tugas 9
import '../model/mywatchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WatchDetailsPage extends StatefulWidget {
  WatchDetailsPage({super.key, required this.counter, required this.savedList, required this.data});

  int counter;
  List<SavedData> savedList;
  Fields data;

  @override
  State<WatchDetailsPage> createState() => _WatchDetailsPageState(counter: counter, savedList: savedList, data: data);
}

class _WatchDetailsPageState extends State<WatchDetailsPage> {

  _WatchDetailsPageState({required this.counter, required this.savedList, required this.data});

  int counter;
  List<SavedData> savedList;
  Fields data;

  String getWatchStatus () {
    List<String> watchStatus = data.watched.toString().split('.');
    return watchStatus[1].substring(0, 1) + watchStatus[1].substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20),
          Text(
            data.title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text(
                'Release Date: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(data.releaseDate),
            ],
          ),
          Row(
            children: [
              const Text(
                'Rating: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('${data.rating}'),
            ],
          ),
          Row(
            children: [
              const Text(
                'Status: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Text('${data.watched}'),
              // Text('${watchedValues.reverse![data.watched]}'),
              Text(getWatchStatus()),
            ],
          ),
          Row(
            children: const [
              Text(
                'Review:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]
          ),
          Row(
            children: [
              Text(data.review),],
          )
        ],
      ),
      persistentFooterButtons: [
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyWatchListPage(counter: counter, savedList: savedList)),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 9.5, top: 1.6),
                child: Icon(Icons.arrow_back, color: Colors.blue),
              ),
              Text(
                "Back",
                style: TextStyle(color: Colors.white),
              ),
            ]
          ),
        ),
      ],
      persistentFooterAlignment: AlignmentDirectional.center,
    );
  }
}