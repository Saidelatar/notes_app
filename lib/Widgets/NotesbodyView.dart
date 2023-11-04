import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Widgets/NotesListView.dart';
import 'package:notes_app/Widgets/customaappbar.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

class NotesBodyView extends StatefulWidget {
  const NotesBodyView({super.key});

  @override
  State<NotesBodyView> createState() => _NotesBodyViewState();
}

class _NotesBodyViewState extends State<NotesBodyView> {
  void initState() {
     super.initState();
  BlocProvider.of<ReadNotesCubit>(context).FetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          CustomAppBar(
            text: 'Notes',
            icon: Icons.search,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
