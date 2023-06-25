
import 'package:crime_prevent_report_system/utils/theme.dart';
import 'package:flutter/material.dart';

AppBar customAppBar({
  String? title,
  IconButton? iconButton,
  Color? textColor,
  PreferredSizeWidget? bottomBar
}) {

  return AppBar(
      leading: iconButton,
      title: Center(child: Text(title!,
          style: const TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 24))),
      backgroundColor: Colors.red[900],
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      bottom: bottomBar
  );
}

AppBar customAppBarAction({
  String? title,
  IconButton? iconButton,
  Color? textColor,
  PreferredSizeWidget? bottomBar,
  Widget? actions}) {

  return AppBar(
      leading: iconButton,
      title: Center(child: Text(title!,
          style: const TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 24))),
      backgroundColor: Colors.red[900],
      iconTheme: const IconThemeData(
        color: Colors.white, //change your color here
      ),
      bottom: bottomBar,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: actions ?? IconButton(
              icon: Icon(Icons.arrow_left_rounded),
              iconSize: 0,
              onPressed: null
          ),
        )
      ]
  );
}


getTextField({String? text, String? valError, bool? readonly,
  Function(String)? onChanged, bool? obscureText, String? Function(String?)? validator,
  bool isEdit=false, TextInputType? keyboardType, int? minLines, int? maxLines, InputDecoration? decoration}) {
  TextEditingController controller = TextEditingController();
  if(isEdit){
    controller.text = text!;
  }
  return Container(
    padding: EdgeInsets.only(bottom: 20),
    child: TextFormField(
      controller: isEdit ? controller : null,
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
      readOnly: readonly ?? false,
      obscureText: obscureText ?? false,
      decoration: decoration,
      onChanged: onChanged,
      validator: validator ?? (val) {
        if (val!.isEmpty) {
          return valError;
        }
        return null;
      },
    ),
    decoration: ThemeHelper().inputBoxDecorationShaddow(),
  );
}

