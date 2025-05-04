// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/const.dart';
import 'package:notes_app/model/notes_model.dart';

part 'notescubits_state.dart';

class NotescubitsCubit extends Cubit<NotescubitsState> {
  NotescubitsCubit() : super(NotescubitsInitial());

  List<NotesModel>? notes;
  fatchAllNotes() async {
    var notesBox = Hive.box<NotesModel>(kNotesBox);

    notes = notesBox.values.toList();
  }
}
