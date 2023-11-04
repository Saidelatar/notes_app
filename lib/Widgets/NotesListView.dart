import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Widgets/CustContainerNotes.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_states.dart';
import 'package:notes_app/models/notes_model.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesStates>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<ReadNotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount:notes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: ContainerNotes(
               //   color: Color(0xffffcc80),
                  note: notes[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
