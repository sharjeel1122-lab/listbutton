import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListButton extends StatefulWidget {
  const ListButton({super.key});

  @override
  State<ListButton> createState() => _ListButtonState();
}

class _ListButtonState extends State<ListButton> {

  List myList=
  [

  ];
  void fetchData() async {
    try {
      // Access Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot =
      await firestore.collection('utiliyy').where('name',isEqualTo: 'c').get();
      for (var doc in querySnapshot.docs) {
        var data = doc.data()as Map<String, dynamic>; // Nullable data
        if (data != null) {
          setState(() {
            myList=data['btnList'];
          });
          print(myList);
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
@override
  void initState() {
    super.initState();
    fetchData(
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      myList.isNotEmpty?
      Column(
        children: [

         Row(
           children: [
             if(myList.length==2)
            // if(myList[0]['Button']=='1')/
             Expanded(child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: ElevatedButton(child: Text(myList[0]),onPressed: (){},),
             )),
             if(myList.length>2)
               Expanded(child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(child: Text(myList[0]),onPressed: (){},),
               )),
             if(myList.length>2)
               Expanded(child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(child: Text(myList[1]),onPressed: (){},),
               )),

           ],
         ),
          Row(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(child: Text(myList.length==3?myList[2]:myList.length==2?myList[1]:myList[0]),onPressed: (){},),
              )),
            ],
          ),
        ],
      ): Container(
        child: (Text('No Data')),
      ),
    );
  }
}
