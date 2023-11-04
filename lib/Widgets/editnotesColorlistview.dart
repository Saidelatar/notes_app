import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/color_list_view.dart';
import 'package:notes_app/Widgets/constants.dart';
import 'package:notes_app/models/notes_model.dart';


class EditNotesColorList extends StatefulWidget {
  NoteModel note;
  EditNotesColorList({super.key, required this.note});

  @override
  State<EditNotesColorList> createState() => _EditNotesColorListState();
}

class _EditNotesColorListState extends State<EditNotesColorList> {
  late int currentindex;
  void initState() {
    currentindex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: kColors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: GestureDetector(
                onTap: () {
                  currentindex = index;
                  widget.note.color = kColors[index].value;
                  setState(() {});
                },
                child: ColorItem(
                  color: kColors[index],
                  isActive: currentindex == index,
                ),
              ),
            );
          }),
    );
  }
}
