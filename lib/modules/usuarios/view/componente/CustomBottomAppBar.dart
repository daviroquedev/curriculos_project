import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onChartsPressed;

  const CustomBottomAppBar({
    super.key,
    required this.onHomePressed,
    required this.onChartsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: onHomePressed,
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: onChartsPressed,
          ),
        ],
      ),
    );
  }
}
