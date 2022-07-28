import 'package:books/app/constants/constants.dart';
import 'package:flutter/material.dart';

Widget searchTextField({
  required TextEditingController controller,
  required String hint,
  required context,
  required Widget suffixIcon,
}) {
  return SizedBox(
    child: TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.headline4,
      cursorColor: AppColors.black,
      autofocus: false,
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 14),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(14.0),
          ),
          borderSide: BorderSide(
            color: AppColors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            color: AppColors.black,
          ),
        ),
        contentPadding: const EdgeInsets.all(13),
      ),
    ),
  );
}
