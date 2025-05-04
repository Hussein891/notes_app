// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:notes_app/const.dart';
import 'package:notes_app/model/notes_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  addNote(NotesModel note) async {
    try {
      var notesBox = Hive.box<NotesModel>(kNotesBox);

      await notesBox.add(note);
      emit(AddNotesSuccess());
      notesBox.add(note);
    } catch (e) {
      emit(AddNotesFailur(e.toString()));
    }
  }
}
