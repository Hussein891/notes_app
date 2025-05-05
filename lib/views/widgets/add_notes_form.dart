// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/addcubit/add_notes_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';
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
        ColorsListView(),
        BlocBuilder<AddNotesCubit, AddNotesState>(
          builder: (context, state) {
            return CustomBottom(
              isLoading: state is AddNotesLoading ? true : false,
              onTap: () {
                if (fromKey.currentState!.validate()) {
                  fromKey.currentState!.save();
                  var currentDate = DateTime.now();
                  var formattedCurrentDate =
                      DateFormat.yMEd().format(currentDate);
                  var notModle = NotesModel(
                      title: title!,
                      subtitle: subTitle!,
                      date: formattedCurrentDate,
                      color: Colors.blue.value);
                  BlocProvider.of<AddNotesCubit>(context).addNote(notModle);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            );
          },
        ),
        SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
