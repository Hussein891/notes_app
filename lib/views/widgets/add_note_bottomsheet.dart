// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/addcubit/add_notes_cubit.dart';
import 'package:notes_app/cubits/cubit/notescubits_cubit.dart';
import 'package:notes_app/views/widgets/add_notes_form.dart';

class AddNoteBottomsheet extends StatelessWidget {
  const AddNoteBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if (state is AddNotesFailur) {
            // ignore: duplicate_ignore
            // ignore: avoid_print
            print('Failoed ${state.errMessage}');
          }
          if (state is AddNotesSuccess) {
            print('ssss=========================');
            BlocProvider.of<NotescubitsCubit>(context).fatchAllNotes();
            print('تمت إضافة ملاحظة جديدة وتحديث القائمة');
            return Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
              absorbing: state is AddNotesLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(child: AddNoteForm()),
              ));
        },
      ),
    );
  }
}
