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
    emit(NotescubitsLoding());
    try {
      final notesBox = Hive.box<NotesModel>(kNotesBox);
      final notes = notesBox.values.toList();
      print('عدد الملاحظات الفعلي في Hive: ${notes.length}');
      if (notes.isEmpty) {
        emit(NotescubitsEmpty());
      } else {
        emit(NotescubitsSuccess(notes));
      }
    } catch (e) {
      print('حدث خطأ في جلب البيانات: $e');
      emit(NotescubitsFailure(e.toString()));
    }
  }
}
