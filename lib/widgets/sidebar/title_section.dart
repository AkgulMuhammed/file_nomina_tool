import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        'File Nomina Tool',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
