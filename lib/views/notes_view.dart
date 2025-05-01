import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_veiw_bady.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesVeiwBady(),
    );
  }
}
