import 'package:flutter/material.dart';

class MyLoadingContent extends StatelessWidget {
  const MyLoadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
