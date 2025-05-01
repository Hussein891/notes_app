import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomsheet extends StatelessWidget {
  const AddNoteBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [
        SizedBox(
          height: 24,
        ),
        CustomTextField(),
      ]),
    );
  }
}
