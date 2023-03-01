import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/global.dart';



class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    String? index = ModalRoute.of(context)!.settings.arguments as String;
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
        title: const Text("Details"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Container(
            height: 750,
            width: 415,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
                children: list.map((e){
                  return (index == e['Name']) ?
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                         height: 560,
                         child: Image.network("${e['Image']}",
                         fit: BoxFit.cover,
                         ),
                       ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 8,bottom: 5),
                          child: Text("${e['Name']}",
                       style: GoogleFonts.poppins(
                           fontWeight: FontWeight.w700,
                           color: Colors.black,
                           fontSize: 18
                       ),
                       ),
                        ),
                       Padding(
                       padding: const EdgeInsets.only(left: 8,right: 8),
                         child: Text("${e['About']}",
                         style: GoogleFonts.poppins(
                             fontWeight: FontWeight.w600,
                             color: Colors.grey.shade600,
                             fontSize: 15
                         ),
                         ),
                       )
                     ],
                   ) :
                  Container();
                }).toList(),
            ),
          ),
        ),
    );

  }
}
