
import 'package:flutter/material.dart';
import 'package:random_animal/utils/global.dart';



class RandomAnimal extends StatefulWidget {
  const RandomAnimal({Key? key}) : super(key: key);

  @override
  State<RandomAnimal> createState() => _RandomAnimalState();
}

class _RandomAnimalState extends State<RandomAnimal> {




  void initState()  {
    super.initState();
    Set<String> categories = Set<String>.from(list.map((e) => e['Category']));

    uniqueList = categories.map((e) => {'Category' : e}).toList();
    print("hello $categories");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: uniqueList.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'list',arguments: uniqueList[index]['Category']);
                print("kalo ${uniqueList[index]['Category']}");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text("${uniqueList[index]['Category']}"),
                ),
              ),
            );
          },
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}
