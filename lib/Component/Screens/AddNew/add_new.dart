

import 'package:core_flutter_exam1/Utils/ModelClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../Utils/ListOfInfo.dart';
class AddNew extends StatefulWidget {
  const AddNew({super.key});

  @override
  State<AddNew> createState() => _AddNewState();
}
ImagePicker imagePicker = ImagePicker();
File? fileImage;
class _AddNewState extends State<AddNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade100,
        centerTitle: true,
        title: Text('Add New data'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),

                image: (fileImage != null)
                    ? DecorationImage(image:FileImage(fileImage!),fit: BoxFit.cover)
                    : DecorationImage(image: AssetImage('Assets/Image/practicleImage.png'),fit: BoxFit.cover),
              ),
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () async {
                  XFile? xFileimage = await imagePicker.pickImage(source: ImageSource.camera);
                  setState(() {
                    fileImage = File(xFileimage!.path);
                  });
                }, icon: Icon(Icons.camera_alt_outlined,size: 50,)),
                SizedBox(width: 20,),
                IconButton(onPressed: () async {
                  XFile? xFileimage = await imagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    fileImage = File(xFileimage!.path);
                  });
                }, icon: Icon(Icons.photo,size: 50,))
              ],
            ),
            TextFromFieldStudentNew(Controller: txtName, text: Text('Name'), KeyBoardType: TextInputType.name,),
            SizedBox(height: 10,),
            TextFromFieldStudentNew(Controller: txtGRID, text: Text('GRID'), KeyBoardType: TextInputType.number,),
            SizedBox(height: 10,),
            TextFromFieldStudentNew(Controller: txtStandard, text: Text('Standard'), KeyBoardType: TextInputType.number,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          InformationList.add(StudentModal(name: txtName,GRID: txtGRID,standard: txtStandard));

          Navigator.of(context).pop();
          },child: Icon(Icons.save),
      ),
    );
  }

  TextFormField TextFromFieldStudentNew({required Controller, required text, required KeyBoardType }) {
    return TextFormField(
      keyboardType: KeyBoardType,
          controller: Controller,
          decoration: InputDecoration(
            label: text,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
          ),
        );
  }
}


TextEditingController txtName = TextEditingController();
TextEditingController txtGRID = TextEditingController();
TextEditingController txtStandard = TextEditingController();

