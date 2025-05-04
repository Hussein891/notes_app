import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/cubit/add_notes_cubit.dart';
import 'package:notes_app/views/widgets/add_notes_form.dart';

class AddNoteBottomsheet extends StatelessWidget {
  const AddNoteBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocConsumer<AddNotesCubit, AddNotesState>(
          listener: (context, state) {
            if (state is AddNotesFailur) {
              print('Failoed ${state.errMessage}');
            }
            if (state is AddNotesSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddNotesLoading ? true : false,
                child: SingleChildScrollView(child: AddNoteForm()));
          },
        ),
      ),
    );
  }
}
