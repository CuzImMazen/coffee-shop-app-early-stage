import 'package:flutter/material.dart';

class SizeContainer extends StatelessWidget {
  const SizeContainer({
    super.key,
    required this.text,
    required this.isSelected,
  });
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        color: isSelected
            ? Color(0xffc67c4f).withAlpha(10)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: isSelected
            ? Border.all(color: Color(0xffc67c4f), width: 1)
            : Border.all(color: Colors.grey.withAlpha(50), width: 1),
      ),
      child: Center(
        child: Text(
          text,
          style: isSelected
              ? TextStyle(
                  fontSize: 20,
                  fontFamily: 'Sora',
                  color: Color(0xffc67c4f),
                )
              : TextStyle(fontSize: 20, fontFamily: 'Sora'),
        ),
      ),
    );
  }
}
