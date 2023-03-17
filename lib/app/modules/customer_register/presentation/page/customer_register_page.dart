import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/customer_register/presentation/page/customer_register_page_desktop.dart';
import 'package:appweb/app/modules/customer_register/presentation/page/customer_register_page_mobile.dart';
import 'package:appweb/app/modules/customer_register/presentation/page/customer_register_page_tablet.dart';
import 'package:flutter/material.dart';

class CustomerRegisterPage extends StatefulWidget {
  final int tbCustomerId;
  const CustomerRegisterPage({
    super.key,
    required this.tbCustomerId,
  });

  @override
  State<CustomerRegisterPage> createState() => _CustomerRegisterPageState();
}

class _CustomerRegisterPageState extends State<CustomerRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: CustomerRegisterPageMobile(tbCustomerId: widget.tbCustomerId),
      tablet: const CustomerRegisterPageTablet(),
      desktop: CustomerRegisterPageDesktop(tbCustomerId: widget.tbCustomerId),
    );
  }
}
