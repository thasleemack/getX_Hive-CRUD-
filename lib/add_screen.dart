import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getxhive/controller.dart';

import 'hive_class.dart';

class AddScreen extends StatelessWidget{
  final Note? note;
  AddScreen({super.key,this.note});
  final NoteController controller = Get.put(NoteController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  @override

  @override
  Widget build(BuildContext context) {
    if (note != null) {
      titleController.text = note!.title;
      textController.text = note!.text;
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme:  IconThemeData(color: Colors.white),
        backgroundColor: Colors.cyan.shade900,
        title: Text(
          note!=null?"Edit Note":"Add New...",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            SizedBox(height: 40,
              child: TextFormField(
                controller:titleController,
                decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 30),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none)),
              ),
            ),


            TextFormField(
              controller: textController,
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: "Note",
                  hintStyle: TextStyle(color: Colors.grey,fontSize: 20,),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none)),
            ),

          ],
        ),
      ),
      floatingActionButton: Container(width: 100,
        child: FloatingActionButton.extended(backgroundColor: Colors.white,
          onPressed: () {
            if (note != null) {
              controller.updateNote(note!.id,titleController.text,textController.text );
            } else {
              controller.addNote(titleController.text,textController.text);
            }
            Get.back();

            // Navigator.pop(context);





          }, label: Text(note!=null?"Update":"Add",style: TextStyle(color: Colors.teal.shade900,),),
        ),
      ),

    );
  }
}