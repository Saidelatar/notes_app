import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Widgets/add_notes_form.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_state.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

class AddNotesBottomSheet extends StatelessWidget {
  AddNotesBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, NotesStates>(
        listener: (context, state) {
          if (state is AddNotesFauilre) {
            print('Failed ${state.errormessage}');
          }
          if (state is AddNotesSuccessed) {
            BlocProvider.of<ReadNotesCubit>(context).FetchAllNotes();
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Note has been added',style: TextStyle(
                  color: const Color.fromARGB(255, 12, 54, 88) ,
                ),)));
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNotesLoading ? true : false,
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: AddNotesForm(),
            )),
          );
        },
      ),
    );
  }
}
