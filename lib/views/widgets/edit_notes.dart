import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notescubits_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNotesBody extends StatefulWidget {
  const EditNotesBody({super.key, required this.note});
  final NotesModel note;

  @override
  State<EditNotesBody> createState() => _EditNotesBodyState();
}

class _EditNotesBodyState extends State<EditNotesBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [
        SizedBox(
          height: 50,
        ),
        CustomAppBar(
          onPressed: () {
            widget.note.title = title ?? widget.note.title;
            widget.note.subtitle = content ?? widget.note.subtitle;
            widget.note.save();
            BlocProvider.of<NotescubitsCubit>(context).fatchAllNotes();
            Navigator.pop(context);
          },
          title: 'Edit Note',
          icon: Icons.check,
        ),
        SizedBox(
          height: 50,
        ),
        CustomTextField(
            onChanged: (value) {
              title = value;
            },
            hint: widget.note.title),
        SizedBox(
          height: 15,
        ),
        CustomTextField(
          onChanged: (value) {
            content = value;
          },
          hint: widget.note.subtitle,
          maxLines: 5,
        ),
      ]),
    );
  }
}
