import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notescubits_cubit.dart';
import 'package:notes_app/views/widgets/add_note_bottomsheet.dart';
import 'package:notes_app/views/widgets/notes_veiw_bady.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotescubitsCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return AddNoteBottomsheet();
                });
          },
          child: Icon(Icons.add),
        ),
        body: const NotesVeiwBady(),
      ),
    );
  }
}
