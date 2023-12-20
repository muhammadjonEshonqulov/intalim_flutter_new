import 'package:flutter/material.dart';

class MySurveyDialogItemText extends StatelessWidget {
  const MySurveyDialogItemText({
    super.key,
    required this.text,
    this.required = false,
  });

  final String text;
  final bool required;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: RichText(
        text: TextSpan(
          text: text,
          style: style,
          children: required
              ? [
                  TextSpan(
                    text: ' *',
                    style: style?.copyWith(color: Colors.red),
                  ),
                ]
              : null,
        ),
      ),
    );
  }
}
