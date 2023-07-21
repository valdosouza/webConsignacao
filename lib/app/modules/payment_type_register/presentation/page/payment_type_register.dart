import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/content/content_desktop_payment_type_register.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/content/content_mobile_payment_type_register.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/content/content_tablet_payment_type_register.dart';
import 'package:flutter/material.dart';

class PaymentTypeRegister extends StatelessWidget {
  const PaymentTypeRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobilePaymentTypeRegister(),
      tablet: ContentTabletPaymentTypeRegister(),
      desktop: ContentDesktopPaymentTypeRegister(),
    );
  }
}
