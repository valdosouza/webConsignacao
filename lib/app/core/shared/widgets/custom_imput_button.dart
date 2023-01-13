import 'package:appweb/app/core/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomInputButton extends StatelessWidget {
  final String title;
  final bool enabled;
  final double? width;
  final int maxLines;
  final Widget? suffixIcon;

  final Function()? onAction;
  final String initialValue;
  const CustomInputButton({
    super.key,
    this.onAction,
    this.maxLines = 1,
    this.suffixIcon,
    this.enabled = true,
    this.width,
    required this.title,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          width: MediaQuery.of(context).size.width,
          height: 45,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    initialValue,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: (onAction != null)
                    ? IconButton(
                        hoverColor: Colors.transparent,
                        onPressed: () {
                          onAction!();
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
