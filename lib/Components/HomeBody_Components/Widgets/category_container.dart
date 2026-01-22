import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    required this.text,
    super.key,
    required this.toggleTab,
    required this.isActive,
  });
  final String text;
  final Function toggleTab;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          toggleTab();
        },
        child: isActive
            ? Container(
                decoration: BoxDecoration(
                  color: Color(0xffc97a54),
                  borderRadius: BorderRadius.circular(8),
                ),

                width: 100,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: "Sora",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(15),
                  borderRadius: BorderRadius.circular(8),
                ),

                width: 100,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(fontFamily: "Sora", fontSize: 16),
                  ),
                ),
              ),
      ),
    );
  }
}
