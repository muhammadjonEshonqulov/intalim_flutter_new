import 'package:flutter/material.dart';

class MySurveyTripleButtons extends StatelessWidget {
  const MySurveyTripleButtons({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.onSelected,
    required this.selected,
  });

  final String text1;
  final String text2;
  final String text3;
  final void Function(int) onSelected;
  final int? selected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Item(
            onPressed: () => onSelected(1),
            isSelected: selected == 1,
            color: Colors.blue,
            text: text1,
          ),
          const SizedBox(height: 10),
          _Item(
            onPressed: () => onSelected(2),
            isSelected: selected == 2,
            color: Colors.orange,
            text: text2,
            selectedTextColor: Colors.black,
          ),
          const SizedBox(height: 10),
          _Item(
            onPressed: () => onSelected(3),
            isSelected: selected == 3,
            color: Colors.red,
            text: text3,
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.onPressed,
    required this.text,
    required this.isSelected,
    required this.color,
    this.selectedTextColor = Colors.white,
  });

  final VoidCallback onPressed;
  final String text;
  final bool isSelected;
  final Color color;
  final Color selectedTextColor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * .5;

    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(
          Size(width, 0),
        ),
        maximumSize: MaterialStatePropertyAll(
          Size(width, 500),
        ),
        alignment: Alignment.center,
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        ),

        // fixedSize: MaterialStatePropertyAll(
        //   Size(width, 100),
        // ),

        foregroundColor: MaterialStatePropertyAll(
          isSelected ? selectedTextColor : color,
        ),
        backgroundColor: isSelected ? MaterialStatePropertyAll(color) : null,
        side: MaterialStatePropertyAll(
          BorderSide(color: color),
        ),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            if (isSelected)
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.check,
                    size: 18,
                    color: selectedTextColor,
                  ),
                ),
              ),
            TextSpan(
              text: text,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? selectedTextColor : color,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
