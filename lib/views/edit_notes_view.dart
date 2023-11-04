import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Widgets/Text_field_bottom_sheet.dart';
import 'package:notes_app/Widgets/customaappbar.dart';
import 'package:notes_app/Widgets/editnotesColorlistview.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';

class EditNotesView extends StatefulWidget {
  final NoteModel note;

  const EditNotesView({super.key, required this.note});

  @override
  State<EditNotesView> createState() => _EditNotesViewState();
}

class _EditNotesViewState extends State<EditNotesView> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = content ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<ReadNotesCubit>(context).FetchAllNotes();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                'Note has been edited',
                style: TextStyle(
                  color: const Color.fromARGB(255, 12, 54, 88),
                ),
              )));
            },
            text: 'Edit Note',
            icon: Icons.done,
          ),
          SizedBox(
            height: 15,
          ),
          TextFieldBottomSheet(
              onChanged: (value) {
                title = value;
              },
              hint: widget.note.title),
          SizedBox(
            height: 20,
          ),
          TextFieldBottomSheet(
            onChanged: (value) {
              content = value;
            },
            hint: widget.note.subtitle,
            maxLines: 5,
          ),
          SizedBox(
            height: 20,
          ),
          EditNotesColorList(
            note: widget.note,
          ),
        ],
      ),
    ));
  }
}
