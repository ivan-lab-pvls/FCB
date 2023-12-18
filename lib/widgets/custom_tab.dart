import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
     this.icon,
    required this.text,
    required this.isSelected,
    required this.width,
  });

  final String? icon;
  final String text;
  final bool isSelected;
  final double width;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (icon != null)
            Image.asset(
              icon!,
              height: 16,
              width: 16,
            ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: isSelected
                  ? const Color(0xFFFCFCFC)
                  : const Color(0xFFAEAEAE),
            ),
          ),
        ],
      ),
    );
  }
}
