import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'hive_class.dart';

class NoteController extends GetxController{
  final notes = <Note>[].obs;

  void addNote(String title,String text) async {

    final box = Hive.box('notes');
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    await box.put(id, {'id': id,'title':title,'text': text});
    print("notes${box.length}");
    getNotes();
    // print("")
  }

  @override
  void onInit() {
    getNotes();
    super.onInit();
  }

  void getNotes() {
    final box = Hive.box('notes');
 notes.assignAll(box.values.map((note) => Note(
        id: note['id'].toString(),
        title: note['title'].toString(),
        text: note['text'].toString(),


    )).toList());
   // note=notes.reversed.toList();

  }

  void updateNote(String id,String title, String text) async {
    final box = Hive.box('notes');
    await box.put(id, {'id': id,'title':title, 'text': text});
    getNotes();
  }

  void deleteNote(String id) async {
    final box = Hive.box('notes');
    await box.delete(id);
    getNotes();
  }

}