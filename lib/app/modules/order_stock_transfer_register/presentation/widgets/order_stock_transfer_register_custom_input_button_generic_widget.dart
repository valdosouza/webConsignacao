import 'package:appweb/app/core/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomInputButtonGenericWidget extends StatelessWidget {
  const CustomInputButtonGenericWidget({
    super.key,
    this.onChanged,
    this.maxLines = 1,
    this.suffixIcon,
    required this.title,
    required this.textInputType,
    required this.textInputAction,
    required this.controller,
  });

  final String title;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final int maxLines;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(0),
      ),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.6),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        TextFormField(
          maxLines: maxLines,
          controller: controller,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          // initialValue: initialValue,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.withOpacity(0.6),
            border: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusColor: Colors.grey.withOpacity(0.6),
            focusedErrorBorder: outlineInputBorder,
            suffixIcon: suffixIcon,
          ),
          onChanged: onChanged,
        )
        // const SizedBox(height: 10.0),
        // Container(
        //     alignment: Alignment.centerLeft,
        //     decoration: kBoxDecorationStyle,
        //     width: MediaQuery.of(context).size.width,
        //     child: Row(
        //       children: [
        //         Expanded(
        //           child: Padding(
        //             padding: const EdgeInsets.only(left: 10.0),
        //             child: Text(
        //               initialValue,
        //               style: const TextStyle(
        //                 color: Colors.white,
        //                 fontFamily: 'OpenSans',
        //               ),
        //             ),
        //           ),
        //         ),
        //         Align(
        //           alignment: Alignment.centerRight,
        //           child: IconButton(
        //             hoverColor: Colors.transparent,
        //             onPressed: onPressed,
        //             icon: const Icon(
        //               Icons.search,
        //               size: 20.0,
        //               color: Colors.white,
        //             ),
        //           ),
        //         ),
        //       ],
        //     )),
      ],
    );
  }
}
