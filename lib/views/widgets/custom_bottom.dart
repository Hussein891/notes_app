import 'package:flutter/material.dart';
import 'package:notes_app/const.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, this.onTap, this.isLoading = false});
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            color: kPreimColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : Text(
                  'Add',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
        ),
      ),
    );
  }
}
