import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String text;
  final bool readOnly;
  final void Function(String)? onChanged;
  const CustomTextFormField({
    Key? key,
    this.textEditingController,
    required this.text,
    this.readOnly = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: textEditingController,
      onChanged: onChanged,
      decoration: InputDecoration(
        label: Text(text),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    );
  }
}
