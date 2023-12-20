import 'package:flutter/material.dart';

class MySurveyCheckButton extends StatelessWidget {
  const MySurveyCheckButton({
    super.key,
    required this.onPressed,
    this.text,
    required this.isSelected,
    required this.isBlue,
    this.selectedTextColor = Colors.white,
    this.widthPercent = .3,
  }) : assert(widthPercent < 1 && widthPercent > 0);

  final VoidCallback onPressed;
  final String? text;
  final bool isSelected;
  final bool isBlue;
  final Color selectedTextColor;
  final double widthPercent;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * widthPercent;

    var text = this.text;
    text ??= isBlue ? 'ҳа' : 'йўқ';

    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(
          Size(width, 40),
        ),
        maximumSize: MaterialStatePropertyAll(
          Size(width, 40),
        ),
        fixedSize: MaterialStatePropertyAll(
          Size(width, 40),
        ),
        foregroundColor: MaterialStatePropertyAll(
          isSelected
              ? selectedTextColor
              : isBlue
                  ? Colors.blue
                  : Colors.red,
        ),
        backgroundColor: isSelected
            ? MaterialStatePropertyAll(
                isBlue ? Colors.blue : Colors.red,
              )
            : null,
        side: MaterialStatePropertyAll(
          BorderSide(
            color: isBlue ? Colors.blue : Colors.red,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected)
            const Padding(
              padding: EdgeInsets.only(right: 4),
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? selectedTextColor
                      : isBlue
                          ? Colors.blue
                          : Colors.red,
                ),
          ),
        ],
      ),
    );
  }
}
