import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/constants.dart';

class AddNotesButton extends StatelessWidget {
  const AddNotesButton(
      {super.key, required this.onTap, this.isLoading = false});
  final Function() onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 55,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: KprimaryColor,
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          )),
    );
  }
}
