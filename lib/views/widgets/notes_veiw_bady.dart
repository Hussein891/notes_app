// import 'package:flutter/material.dart';
// import 'package:notes_app/views/widgets/custom_app_bar.dart';
// import 'package:notes_app/views/widgets/notes_listview.dart';

// class NotesVeiwBady extends StatelessWidget {
//   const NotesVeiwBady({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 24),
//       child: Column(
//         children: [
//           SizedBox(height: 50),
//           CustomAppBar(title: 'Notes', icon: Icons.search),
//           Expanded(child: NotesListView())
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/cubit/notescubits_cubit.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class NotesVeiwBady extends StatelessWidget {
  const NotesVeiwBady({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 50),
          const CustomAppBar(title: 'Notes', icon: Icons.search),
          const SizedBox(height: 20),
          Expanded(child: BlocBuilder<NotescubitsCubit, NotescubitsState>(
            builder: (context, state) {
              print('الحالة الحالية: ${state.runtimeType}'); // للتتبع

              if (state is NotescubitsLoding) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is NotescubitsSuccess) {
                print('عرض ${state.notes.length} ملاحظة'); // للتأكد
                return ListView.builder(
                  itemCount: state.notes.length,
                  itemBuilder: (context, index) {
                    final note = state.notes[index];
                    print('عرض ملاحظة: ${note.title}');
                    return NoteItem(note: note);
                  },
                );
              } else if (state is NotescubitsEmpty) {
                return const Center(child: Text('لا توجد ملاحظات'));
              } else if (state is NotescubitsFailure) {
                return Center(child: Text(state.errMessage));
              }
              return const Center(child: Text('جاري تحميل البيانات...'));
            },
          )),
        ],
      ),
    );
  }
}
