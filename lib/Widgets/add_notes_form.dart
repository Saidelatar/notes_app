import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/Widgets/Text_field_bottom_sheet.dart';
import 'package:notes_app/Widgets/add_notes_button.dart';
import 'package:notes_app/Widgets/color_list_view.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_state.dart';
import 'package:notes_app/models/notes_model.dart';

class AddNotesForm extends StatefulWidget {
  AddNotesForm({super.key});
  @override
  State<AddNotesForm> createState() => _AddNotesBottomSheetState();
}

class _AddNotesBottomSheetState extends State<AddNotesForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          TextFieldBottomSheet(
            onSaved: (data) {
              title = data;
            },
            hint: 'Title',
          ),
          SizedBox(
            height: 15,
          ),
          TextFieldBottomSheet(
            onSaved: (data) {
              subtitle = data;
            },
            hint: 'Content',
            maxLines: 5,
          ),
          SizedBox(
            height: 25,
          ),
          ColorListView(),
          SizedBox(
            height: 25,
          ),
          BlocBuilder<AddNotesCubit, NotesStates>(
            builder: (context, state) {
              return AddNotesButton(
                isLoading: state is AddNotesLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    var currentDate = DateTime.now();
                    var formattedDate =
                        DateFormat('dd-mm-yyyy').format(currentDate);
                    var notemodel = NoteModel(
                      title: title!,
                      subtitle: subtitle!,
                      date: formattedDate,
                      color: Colors.blue.value,
                    );
                    BlocProvider.of<AddNotesCubit>(context).addNotes(notemodel);
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
