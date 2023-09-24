import 'package:flutter/material.dart';

Widget customTextField(
    {String? title,
    String? hint,
    TextEditingController? controller,
    int? maxLines = 1}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(hintText: hint, border: InputBorder.none),
        ),
      )
    ],
  );
}
