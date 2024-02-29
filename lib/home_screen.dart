import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getxhive/controller.dart';

import 'add_screen.dart';
import 'add_screen.dart';
import 'add_screen.dart';

class HomeScreen extends StatelessWidget {
  // List notes ;

  HomeScreen({super.key,});
  final NoteController controller = Get.put(NoteController());

  @override


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan.shade900,
          title: Text(
            "Keep notes!",
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
            child:

            Obx(
                ()=> GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:controller.notes.length ,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  var item= controller.notes[index];
                  print("${controller.notes}+notes");

                  return GestureDetector(
                    onTap: () {
                      Get.to(AddScreen(note: item,));

                  },




                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // height: 100,
                        // width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.cyan.shade900)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Column(
                                  children:[
                                Text(item.title,style: TextStyle(color: Colors.black45,fontSize: 15,fontWeight: FontWeight.w600),),
                                Text(item.text,style:TextStyle(color: Colors.black45,fontSize: 15,fontWeight: FontWeight.normal)),
                              ]),

                             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 SizedBox(width: width/6,),
                                 IconButton(onPressed: (){
                                   showDialog(
                                     context: context,
                                     builder: (ctx) => AlertDialog(
                                       backgroundColor: Colors.teal.shade50,

                                       actions: <Widget>[
                                         Column(
                                           crossAxisAlignment:
                                           CrossAxisAlignment.start,
                                           children: [
                                             SizedBox(height: height/50,),
                                             Container(
                                               // height: height/5,
                                               decoration: BoxDecoration(
                                                   borderRadius:
                                                   BorderRadius.circular(5),
                                                   color: Colors.black26),
                                             ),
                                             Text(
                                               "Are you sure want to delete this note?",
                                               style: TextStyle(
                                                 fontSize: 15,

                                                 color:Colors.grey.shade600
                                               ),
                                             ),
                                             Row(
                                               children: [
                                                 SizedBox(width: width/3.5,),
                                                 TextButton(onPressed: (){
                                                   controller.deleteNote(item.id);
                                                   Get.back();

                                                 }, child:Text("Yes",style: TextStyle(color: Colors.teal),) ),
                                                 TextButton(onPressed: (){
                                                   Get.back();

                                                 }, child:Text("No",style: TextStyle(color: Colors.red),) ),

                                               ],
                                             )

                                           ],
                                         ),
                                       ],
                                     ),
                                   );
                                 }, icon: Icon(Icons.delete)),
                               ],
                             )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),


        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: CircleBorder(eccentricity: 1,),
        onPressed: (){
          Get.to(AddScreen());

          },
        child:
        Icon(Icons.add,color: Colors.cyan.shade900,),
      ),
    );
  }
}