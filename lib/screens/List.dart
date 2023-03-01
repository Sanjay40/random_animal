import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_animal/utils/global.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    String? index = ModalRoute.of(context)!.settings.arguments as String;
    print("demo ${uniqueList}");
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,
          color: Colors.black,
          ),
        ),
        title: const Text("Animal"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
      ),
      body: Column(
        children: list.map((e){
          return (index == e['Category']) ?
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'details',arguments: e['Name']);
                print("details ${e['Name']}");
              },
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text("${e['Name']}"),
              ),
            ),
          ) :
          Container();
        }).toList(),
      )
      );

  }
}
