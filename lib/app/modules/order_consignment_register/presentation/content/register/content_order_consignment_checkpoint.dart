import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_bloc.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_event.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/register/custom_body_checkpoint_wiget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/checkpoint/register/custom_header_checkpoint_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/order_consignment_register_module.dart';

class ContentConsignmentCheckpoint extends StatefulWidget {
  final OrderConsignmentCheckpointModel checkpointmodel;
  const ContentConsignmentCheckpoint({
    super.key,
    required this.checkpointmodel,
  });

  @override
  State<ContentConsignmentCheckpoint> createState() =>
      _ContentConsignmenteCheckpointState();
}

class _ContentConsignmenteCheckpointState
    extends State<ContentConsignmentCheckpoint> {
  late TextEditingController editcontrol;
  late final OrderConsignmentRegisterBloc bloc;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderConsignmentRegisterModule>;
    });

    bloc = Modular.get<OrderConsignmentRegisterBloc>();
  }

  void _showBackDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmação.'),
          content: const Text(
            "Deseja realmente sair desta Tela?",
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Não'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Sim'),
              onPressed: () {
                Navigator.pop(context);
                Modular.to
                    .navigate('/attendance/', arguments: bloc.modelAttendance);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool keyboardHide = (MediaQuery.of(context).viewInsets.bottom == 0);
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        _showBackDialog();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(51.0),
          child: AppBar(
            flexibleSpace: Container(
              decoration: kBoxDecorationflexibleSpace,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 35,
                    child: Text(
                      bloc.modelCheckpoint.order.nameCustomer,
                      style: kTitleAppBarStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const CustomHeaderCheckpoint(),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: CustomBodyCheckpoint(
              size: size, modelCheckpoint: bloc.modelCheckpoint),
        ),
        bottomSheet: (keyboardHide) ? _footer() : null,
      ),
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
            child: _custombutton("Voltar", (() async {
              _showBackDialog();
            })),
          ),
          Expanded(
            flex: 1,
            child: _custombutton("Limpar",
                () => bloc.add(OrderConsignmentRegisterClearCheckoutEvent())),
          ),
          Expanded(
            flex: 1,
            child: _custombutton("Informações", (() {
              bloc.add(OrderConsignmentRegisterGetlistEvent(
                  tbCustomerId: widget.checkpointmodel.order.tbCustomerId));
            })),
          ),
          Expanded(
            flex: 1,
            child: _custombutton(
                "Finalizar",
                (() => {
                      bloc.add(OrderConsignementRegisterCheckpointPostEvent(
                          checkpointmodel: bloc.modelCheckpoint))
                    })),
          ),
        ],
      ),
    );
  }

  _custombutton(String buttonName, Function() function) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 2, right: 4, bottom: 2),
      child: ElevatedButton(
        style: kElevatedButtonStyleRed,
        onPressed: () {
          function();
          setState(() {});
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
              left: 2.0, top: 0.0, right: 2.0, bottom: 0.0),
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
            ),
          ),
          child: Text(
            buttonName,
            style: kElevatedButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
