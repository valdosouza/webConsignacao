import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_bloc.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_event.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/custom_button_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/custom_body_supplying_wiget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/custom_header_supplying_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/modules/order_consignment_register/order_consignment_register_module.dart';

class ContentConsignmentSupplying extends StatefulWidget {
  final OrderConsignmentSupplyingModel supplyingmodel;
  const ContentConsignmentSupplying({
    Key? key,
    required this.supplyingmodel,
  }) : super(key: key);

  @override
  State<ContentConsignmentSupplying> createState() =>
      _ContentConsignmenteSupplyingState();
}

class _ContentConsignmenteSupplyingState
    extends State<ContentConsignmentSupplying> {
  late TextEditingController editcontrol;
  late final OrderConsignmentRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderConsignmentRegisterModule>;
    });

    bloc = Modular.get<OrderConsignmentRegisterBloc>();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool keyboardHide = (MediaQuery.of(context).viewInsets.bottom == 0);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 45,
                child: Text(
                  bloc.modelSupplying.order.nameCustomer,
                  style: ktittleAppBarStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              const CustomHeaderSupplying(),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: CustomBodySupplying(
            size: size, modelSupplying: bloc.modelSupplying),
      ),
      bottomSheet: (keyboardHide) ? _footer() : null,
    );
  }

  _footer() {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(), //custombutton("Voltar", (() => {})),
          ),
          Expanded(
            flex: 1,
            child: custombutton("Limpar",
                () => bloc.add(OrderConsignmentRegisterClearSupplyingEvent())),
          ),
          Expanded(
            flex: 1,
            child: custombutton(
                "Informações",
                (() =>
                    {CustomToast.showToast("Em desenvolvimento. Aguarde..")})),
          ),
          Expanded(
            flex: 1,
            child: custombutton(
                "Finalizar",
                (() => {
                      bloc.add(OrderConsignementRegisterSupplyngPostEvent(
                          suplyingmodel: bloc.modelSupplying))
                    })),
          ),
        ],
      ),
    );
  }
}
