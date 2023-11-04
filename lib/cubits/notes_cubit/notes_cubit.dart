import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit_states.dart';
import 'package:notes_app/models/notes_model.dart';

import '../../Widgets/constants.dart';

class ReadNotesCubit extends Cubit<ReadNotesStates> {
  ReadNotesCubit() : super(ReadNotesIntial());
  List<NoteModel>? notes;

  FetchAllNotes() {
    var noteBox = Hive.box<NoteModel>(KNotesBox);
    notes = noteBox.values.toList();
    emit(ReadNotesSuccess());
  }
}
