import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/contents/content_desktop_payment_type.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/contents/content_mobile_payment_type.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/contents/content_tablet_payment_type.dart';
import 'package:flutter/cupertino.dart';

class PaymentTypeRegister extends StatefulWidget {
  const PaymentTypeRegister({super.key});

  @override
  State<PaymentTypeRegister> createState() => _PaymentTypeRegisterState();
}

class _PaymentTypeRegisterState extends State<PaymentTypeRegister> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentMobilePaymentTypeRegister(),
      tablet: ContentTabletPaymentTypeRegister(),
      desktop: ContentDesktopPaymentTypeRegister(),
    );
  }
}
