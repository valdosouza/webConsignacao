import 'package:flutter/material.dart';

class OrderStockTransferRegisterGenericSuffixField extends StatelessWidget {
  const OrderStockTransferRegisterGenericSuffixField({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      hoverColor: Colors.transparent,
      onPressed: () {
        onPressed?.call();
      },
      icon: Icon(
        icon,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }
}
