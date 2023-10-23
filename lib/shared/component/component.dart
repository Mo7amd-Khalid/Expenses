import 'package:flutter/material.dart';

void showMyDialog({
  required BuildContext context,
  bool barrierDismissible = true,
  Widget? title,
  required Widget content,
  List<Widget>? actions,
  Icon? titleIcon,
  Color? background,
  double? dialogRadius
}) {
  AlertDialog alertDialog = AlertDialog(
    title: title,
    content: content,
    actions: actions,
    icon: titleIcon,
    backgroundColor: background,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(dialogRadius!)
    )
  );
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => alertDialog,
  );
}


Widget myTextFormField({
  required TextEditingController controller,
  Function(String x)? onChange,
  Function()? onTap,
  String? Function(String?)? validate,
  TextInputType? keyboard,
  TextDirection? direction,
  Widget? prefixIcon,
  Widget? suffixIcon,
  InputBorder? border,
  Widget? label,
  String? prefixText,
  int? maxLength,
}) =>
    TextFormField(
      maxLength: maxLength,
      controller: controller,
      onChanged: onChange,
      onTap: onTap,
      keyboardType: keyboard,
      textDirection: direction,
      validator: validate,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: border,
        label: label,
        prefixText: prefixText

      ),
    );






