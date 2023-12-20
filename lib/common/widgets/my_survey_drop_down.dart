import 'package:flutter/material.dart';

class MySurveyDropDown<T> extends StatelessWidget {
  const MySurveyDropDown({
    super.key,
    this.validator,
    this.value,
    required this.items,
    required this.onChanged,
    this.unselect,
  });

  final String? Function(T?)? validator;
  final T? value;
  final Map<T?, String> items;
  final void Function(T?)? onChanged;
  final VoidCallback? unselect;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    final style = Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w400,
          color: Colors.black.withOpacity(.8),
        );

    T? value = this.value;
    if (!items.containsKey(value)) {
      value = null;
    }

    return DropdownButtonFormField<T>(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(10, 12, 1, 12),
      ),
      menuMaxHeight: height * .5,
      validator: validator,
      value: value,
      selectedItemBuilder: (context) => [
        for (final entry in items.entries)
          if (unselect != null)
            SizedBox(
              width: width * .7 + 3,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      entry.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: style,
                    ),
                  ),
                  GestureDetector(
                    onTap: unselect,
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(3),
                      child: const Icon(Icons.close, size: 16),
                    ),
                  ),
                ],
              ),
            )
          else
            SizedBox(
              width: width * .7,
              child: Text(
                entry.value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: style,
              ),
            ),
      ],
      items: [
        for (var entry in items.entries)
          DropdownMenuItem(
            value: entry.key,
            child: Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Text(entry.value,style: style,),
            ),
          ),
      ],
      onChanged: onChanged,
    );
  }
}
