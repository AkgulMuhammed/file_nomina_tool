import 'package:flutter/material.dart';

class MenuHeaderSection extends StatelessWidget {
  final String iconPath;
  final String title;

  const MenuHeaderSection({
    super.key,
    required this.iconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset(
                iconPath,
                color: Theme.of(context).iconTheme.color,
                height: 15,
                width: 15,
              ),
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.3,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              indent: 10,
            ),
          ),
        ],
      ),
    );
  }
}
