import 'package:flutter/material.dart';

class MyDialogSaveButton extends StatelessWidget {
  const MyDialogSaveButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 12),
        ),
        backgroundColor: MaterialStatePropertyAll(Colors.blue.shade700),
      ),
      onPressed: onPressed,
      child: RichText(
        text: TextSpan(
          children: [
            const WidgetSpan(
              child: Icon(
                Icons.save_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
            TextSpan(
              text: ' Сақлаш',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDialogCancelButton extends StatelessWidget {
  const MyDialogCancelButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 12),
        ),
        backgroundColor: MaterialStatePropertyAll(Colors.orange.shade700),
      ),
      onPressed: onPressed,
      child: RichText(
        text: TextSpan(
          children: [
            const WidgetSpan(
              child: Icon(
                Icons.close_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
            TextSpan(
              text: ' Чиқиш',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDialogDeleteButton extends StatelessWidget {
  const MyDialogDeleteButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 12),
        ),
        backgroundColor: MaterialStatePropertyAll(Colors.red),
      ),
      onPressed: onPressed,
      child: RichText(
        text: TextSpan(
          children: [
            const WidgetSpan(
              child: Icon(
                Icons.delete_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
            TextSpan(
              text: ' Ўчириш',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
