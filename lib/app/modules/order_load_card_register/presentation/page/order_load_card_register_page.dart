import 'dart:io';
import 'package:appweb/app/modules/order_load_card_register/presentation/page/order_load_card_register_page_desktop.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/page/order_load_card_register_page_mobile.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/page/order_load_card_register_page_tablet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:appweb/app/core/shared/helpers/responsive.dart';
import 'package:flutter/services.dart';

class OrderLoadCardRegisterPage extends StatefulWidget {
  const OrderLoadCardRegisterPage({
    super.key,
  });

  @override
  State<OrderLoadCardRegisterPage> createState() =>
      _OrderLoadCardRegisterPageState();
}

class _OrderLoadCardRegisterPageState extends State<OrderLoadCardRegisterPage> {
  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        WidgetsFlutterBinding.ensureInitialized();
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      }
    }
  }

  @override
  dispose() {
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: OrderLoadCardRegisterPageMobile(),
      tablet: OrderLoadCardRegisterPageTablet(),
      desktop: OrderLoadCardRegisterPageDesktop(),
    );
  }
}
