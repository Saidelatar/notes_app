import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/NotesbodyView.dart';
import 'package:notes_app/Widgets/add_notes_bottom_sheet.dart';



class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return AddNotesBottomSheet();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const NotesBodyView(),
    );
  }
}
