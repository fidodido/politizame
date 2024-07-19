import 'package:flutter/material.dart';

class PrimaryIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onTap;

  const PrimaryIconButton({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: icon,
    );
  }
}
