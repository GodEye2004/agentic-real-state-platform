import 'package:flutter/material.dart';
import '../../config/theme.dart';

class CheckItem extends StatelessWidget {
  final String text;

  const CheckItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.check_circle_outline,
            size: 20,
            color: AppTheme.secondaryColor,
          ),
        ],
      ),
    );
  }
}
