import 'package:flutter/material.dart';

class MyErrorContent extends StatelessWidget {
  const MyErrorContent({
    super.key,
    required this.onRetry,
    required this.error,
  });

  final VoidCallback onRetry;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Хатолик содир бўлди!\n$error',
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: onRetry,
            child: const Text('Қайта уриниш'),
          ),
        ],
      ),
    );
  }
}
