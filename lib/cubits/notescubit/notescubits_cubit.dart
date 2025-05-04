// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/const.dart';
import 'package:notes_app/model/notes_model.dart';

part 'notescubits_state.dart';

class NotescubitsCubit extends Cubit<NotescubitsState> {
  NotescubitsCubit() : super(NotescubitsInitial());

  fatchAllNotes() async {
    try {
      var notesBox = Hive.box<NotesModel>(kNotesBox);

      List<NotesModel> notes = notesBox.values.toList();

      emit(NotescubitsSuccess(notes));
    } catch (e) {
      emit(NotescubitsFailure(e.toString()));
    }
  }
}
