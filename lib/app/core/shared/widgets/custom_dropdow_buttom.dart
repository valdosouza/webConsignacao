import 'package:flutter/material.dart';

import 'package:appweb/app/core/shared/theme.dart';

class CustomDropdownButton extends StatelessWidget {
  final String title;
  final List<String> list;
  final String initialValue;
  final Icon icon;
  final double width;
  final Function(String)? onChanged;

  const CustomDropdownButton({
    super.key,
    required this.title,
    required this.list,
    required this.icon,
    this.width = 0,
    this.onChanged,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final dropValue = ValueNotifier(initialValue);
    double newWidth = 0;
    if (width == 0) {
      newWidth = MediaQuery.of(context).size.width;
    } else {
      newWidth = width;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.only(left: 10.0),
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          width: newWidth,
          height: 45,
          child: ValueListenableBuilder(
            valueListenable: dropValue,
            builder: (BuildContext context, String value, _) {
              return DropdownButton<String>(
                dropdownColor: Colors.grey,
                underline: const SizedBox(),
                isExpanded: true,
                isDense: true,
                icon: icon,
                alignment: Alignment.centerLeft,
                elevation: 16,
                style: kFieldlStyle,
                value: value.isEmpty ? null : value,
                onChanged: (choise) {
                  dropValue.value = choise.toString();
                  onChanged?.call(choise.toString());
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: kFieldlStyle,
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
