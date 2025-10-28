import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform;
import 'package:flutter/material.dart' show TargetPlatform;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/page/register/order_sale_register_page_desktop.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/page/register/order_sale_register_page_mobile.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/page/register/order_sale_register_page_tablet.dart';

class OrderSaleRegisterPage extends StatefulWidget {
  final OrderAttendanceModel orderAttendance;
  final bool historic;
  const OrderSaleRegisterPage({
    super.key,
    required this.orderAttendance,
    required this.historic,
  });

  @override
  State<OrderSaleRegisterPage> createState() => _OrderSaleRegisterPageState();
}

class _OrderSaleRegisterPageState extends State<OrderSaleRegisterPage> {
  @override
  void initState() {
    super.initState();
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
}

  @override
  dispose() {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      WidgetsFlutterBinding.ensureInitialized();      
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: OrderSaleRegisterPageMobile(
        orderAttendance: widget.orderAttendance,
        historic: widget.historic,
      ),
      tablet: const OrderSaleRegisterPageTablet(),
      desktop: const OrderSaleRegisterPageDesktop(),
    );
  }
}
