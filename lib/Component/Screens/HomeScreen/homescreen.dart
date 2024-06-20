import 'package:core_flutter_exam1/Component/Screens/AddNew/add_new.dart';
import 'package:core_flutter_exam1/Utils/ListOfInfo.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade100,
        centerTitle: true,
        title: Text('Student Information',style: TextStyle(fontSize: 25),),
      ),
      body: Column(
        children: [
         ...List.generate(InformationList.length, (index) => Padding(
           padding: const EdgeInsets.all(8.0),
           child: Center(
             child: Container(
               height: 100,
               width: 400,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                   color: Colors.cyan.shade50
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text('${InformationList[index].name!.text}',style: TextStyle(fontSize: 30),),
                   ),
                   IconButton(onPressed: (){}, icon: Icon(Icons.close))
                 ],
               ),
             ),
           ),
         ))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).pushNamed('/addNew');
      },child: Icon(Icons.add),

      ),
    );
  }
}
