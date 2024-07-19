import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ActionButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(48, 16, 48, 16),
        backgroundColor: Colors.pink, // background
        foregroundColor: Colors.white, // foreground
      ),
      onPressed: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward)
        ],
      ),
    );
  }
}
