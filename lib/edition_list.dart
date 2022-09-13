import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/pairs.dart';
import 'package:untitled/syll.dart';

class editions_page extends StatefulWidget {
  @override
  _editions_pageState createState() {
    return _editions_pageState();
  }
}

class _editions_pageState extends State<editions_page> {
  List _items = [];
  List _items2 = [];
  List<Trio> words2 = [];
  List<List<Trio>> ListOfWords = [];

  // String text = 'بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ';

  @override
  void initState() {
    super.initState();
    readJson();
    readJson2();
    // fillingPairs();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json_data2/ayah.json');
    final data = await json.decode(response);
    setState(() {
      _items = data;
    });
  }

  Future<void> readJson2() async {
    final String response =
        await rootBundle.loadString('assets/json_data2/ahkam.json');
    final data = await json.decode(response);
    // setState(() {
    _items2 = data;
    // });
    fillingPairs();
  }

  void fillingPairs() {
    for (int j = 0; j < _items2.length; j++) {
      words2 = [];
      for (int i = 0; i < _items2[j]["annotations"].length; i++) {
        words2.add(
          Trio(
            _items2[j]["annotations"][i]['start'],
            // _items2[j]["annotations"][i]['rule'] == 'ikhfa' ||
            //         _items2[j]["annotations"][i]['rule'] == 'ghunnah'
            //     ? _items2[j]["annotations"][i]['start']
            //     :
            _items2[j]["annotations"][i]['end'] - 1,
            _items2[j]["annotations"][i]['rule'],
          ),
        );
        // print(
        //     'Pair(${_items2[0]["annotations"][i]['start']}, ${_items2[0]["annotations"][i]['end'] - 1}, ${_items2[0]["annotations"][i]['rule']})');
      }
      // print('ADD to list');
      ListOfWords.add(words2);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(parent: null),
              shrinkWrap: true,
              itemCount: _items.length,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.fromLTRB(12, 1, 12, 5),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 200,
                  width: 100,
                  child: ListTile(
                    title: Center(
                      child: SyllableText(
                        text: _items.isNotEmpty
                            ? _items[index]["arabic_text"]
                            : 'bobo',
                        parts:
                            ListOfWords.isNotEmpty ? ListOfWords[index] : words,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
