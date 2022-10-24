import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/content/content_payment_type_desktop.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/content/content_payment_type_mobile.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/content/content_payment_type_tablet.dart';
import 'package:flutter/cupertino.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContentPaymentMobile(),
      tablet: ContentPaymentTablet(),
      desktop: ContentPaymentDesktop(),
    );
  }
}
