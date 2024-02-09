import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_bloc.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_event.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/custom_button_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/register/custom_body_supplying_wiget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/supplying/register/custom_header_supplying_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/modules/order_consignment_register/order_consignment_register_module.dart';

class ContentConsignmentSupplying extends StatefulWidget {
  const ContentConsignmentSupplying({
    super.key,
  });

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
                bloc.add(CheckpointDeleteEvent(
                  tbOrderId: bloc.modelCheckpoint.order.id,
                ));
              },
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationProcess() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmação.'),
          content: const Text(
            "Deseja realmente finalizar?",
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
                bloc.add(OrderConsignementRegisterSupplyngPostEvent(
                    suplyingmodel: bloc.modelSupplying));
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
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        _showBackDialog();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(61.0),
          child: AppBar(
            flexibleSpace: Container(
              decoration: kBoxDecorationflexibleSpace,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 45,
                    child: Text(
                      bloc.modelSupplying.order.nameCustomer,
                      style: kTitleAppBarStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const CustomHeaderSupplying(),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: CustomBodySupplying(
              size: size, modelSupplying: bloc.modelSupplying),
        ),
        bottomSheet: (keyboardHide) ? _footer(bloc.stage) : null,
      ),
    );
  }

  _footer(int state) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: custombutton(
              "Voltar",
              (() async {
                _showBackDialog();
              }),
            ),
          ),
          Expanded(
            flex: 1,
            child: custombutton("Limpar",
                () => bloc.add(OrderConsignmentRegisterClearSupplyingEvent())),
          ),
          Expanded(
            flex: 1,
            child: custombutton("Informações", (() {
              bloc.add(OrderConsignmentRegisterGetlistEvent(
                  tbCustomerId: bloc.modelSupplying.order.tbCustomerId));
            })),
          ),
          Expanded(
            flex: 1,
            child: custombutton("Finalizar", (() async {
              _showConfirmationProcess();
            })),
          ),
        ],
      ),
    );
  }
}
