import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/Widgets/constants.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_state.dart';
import 'package:notes_app/models/notes_model.dart';

class AddNotesCubit extends Cubit<NotesStates> {
  AddNotesCubit() : super(AddNotesIntial());
  Color color = Color(0xff8d0801);

  addNotes(NoteModel note)async {
    note.color = color.value;
    emit(AddNotesLoading());
    try {
      var noteBox = Hive.box<NoteModel>(KNotesBox);

     await noteBox.add(note);
      emit(AddNotesSuccessed());
    } catch (e) {
      emit(AddNotesFauilre(e.toString()));
    }
  }
}
