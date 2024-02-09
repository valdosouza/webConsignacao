import 'package:flutter/material.dart';
import 'package:appweb/app/core/shared/theme.dart';

class CustomDropdownButton extends StatefulWidget {
  final String title;
  final List<String> items;
  final String initialValue;
  final Icon icon;
  final double? width;
  final void Function(String)? onChanged;

  const CustomDropdownButton({
    super.key,
    required this.title,
    required this.items,
    required this.icon,
    this.width,
    this.onChanged,
    required this.initialValue,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.only(left: 10.0),
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          width: widget.width ?? MediaQuery.of(context).size.width,
          height: 45,
          child: DropdownButton<String>(
            dropdownColor: Colors.grey,
            underline: const SizedBox(),
            isExpanded: true,
            isDense: true,
            icon: widget.icon,
            alignment: Alignment.centerLeft,
            elevation: 16,
            style: kFieldlStyle,
            value: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value ?? ''; // Handle potential null value
              });
              widget.onChanged?.call(value ?? ''); // Call optional callback
            },
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: kFieldlStyle,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
