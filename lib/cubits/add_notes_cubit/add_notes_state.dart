class NotesStates {}

class AddNotesIntial extends NotesStates {}

class AddNotesSuccessed extends NotesStates {}

class AddNotesLoading extends NotesStates {}

class AddNotesFauilre extends NotesStates {
  final String errormessage;
  AddNotesFauilre(this.errormessage);
}
