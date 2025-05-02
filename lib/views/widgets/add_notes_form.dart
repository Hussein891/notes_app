import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_bottom.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> fromKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Column(children: [
        SizedBox(
          height: 24,
        ),
        CustomTextField(
          hint: 'Title',
          onSeve: (value) {
            title = value;
          },
        ),
        SizedBox(
          height: 24,
        ),
        CustomTextField(
          hint: 'Content',
          maxLines: 5,
          onSeve: (value) {
            subTitle = value;
          },
        ),
        SizedBox(
          height: 80,
        ),
        CustomBottom(
          onTap: () {
            if (fromKey.currentState!.validate()) {
              fromKey.currentState!.save();
            } else {
              autovalidateMode = AutovalidateMode.always;
              setState(() {});
            }
          },
        ),
        SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
