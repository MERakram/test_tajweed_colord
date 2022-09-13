import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/pairs.dart';
import 'package:untitled/syll.dart';

import 'edition_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: editions_page(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _items = [];
  List _items2 = [];
  List<Trio>words2 = [];

  @override
  void initState() {
    super.initState();
    readJson();
    readJson2();
    fillingPairs();
    print('words $words2');
    print(_items2);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json_data/ayah.json');
    final data = await json.decode(response);
    setState(() {
      _items = data;
    });
  }
  Future<void> readJson2() async {
    final String response = await rootBundle.loadString('assets/json_data/ahkam.json');
    final data = await json.decode(response);
    setState(() {
      _items2 = data;
    });
  }
  void fillingPairs() {
    for (int i = 0; i < _items2.length; i++) {
      // words.add(
      //   Trio(
      //     _items2[0]["annotations"][i]['start'],
      //     _items2[0]["annotations"][i]['end'],
      //   ),
      // );
    }
  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SyllableText(
          text: _items.isNotEmpty ? _items[0]["arabic_text"] : '',
          parts: words,
        ),
      ),
    );
  }
}
