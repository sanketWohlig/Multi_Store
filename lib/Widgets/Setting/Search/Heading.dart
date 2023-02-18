import 'package:flutter/material.dart';

class SearchPageHeading extends StatelessWidget {
  final String? title;
  final VoidCallback onPressed;
  const SearchPageHeading({super.key, this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.toString(),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
            GestureDetector(
              onTap: onPressed,
              child: const Text(
                'VIEW ALL',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4B9CD6)),
              ),
            )
          ],
        ),
      ],
    );
  }
}
