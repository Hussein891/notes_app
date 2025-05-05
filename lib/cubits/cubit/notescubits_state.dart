part of 'notescubits_cubit.dart';

@immutable
sealed class NotescubitsState {}

final class NotescubitsInitial extends NotescubitsState {}

final class NotescubitsLoding extends NotescubitsState {}

final class NotescubitsSuccess extends NotescubitsState {
  final List<NotesModel> notes;

  NotescubitsSuccess(this.notes);
}

final class NotescubitsEmpty extends NotescubitsState {}

final class NotescubitsFailure extends NotescubitsState {
  final String errMessage;

  NotescubitsFailure(this.errMessage);
}
