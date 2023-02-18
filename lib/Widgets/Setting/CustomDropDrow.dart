import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedLanguage = 'English';
  List<String?> languageOptions = ['English', 'Hindi'];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: null,
      elevation: 0,
      isDense: true,
      value: selectedLanguage,
      items: languageOptions
          .map((items) => DropdownMenuItem(
                value: items,
                child: Text(items!),
              ))
          .toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedLanguage = newValue!;
        });
      },
    );
  }
}