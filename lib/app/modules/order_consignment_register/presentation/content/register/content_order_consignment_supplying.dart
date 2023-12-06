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
    Key? key,
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

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderConsignmentRegisterModule>;
    });

    bloc = Modular.get<OrderConsignmentRegisterBloc>();
  }

  Future<bool?> showConfirmationExitProcess() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Deseja realmente sair desta Tela?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancelar"),
            ),
            OutlinedButton(
              onPressed: () {
                Modular.to
                    .navigate('/attendance/', arguments: bloc.modelAttendance);
              },
              child: const Text("Sim"),
            ),
          ],
        );
      },
    );
  }

  Future<bool?> showConfirmationProcess() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Deseja realmente finalizar?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancelar"),
            ),
            OutlinedButton(
              onPressed: () {
                bloc.add(OrderConsignementRegisterSupplyngPostEvent(
                    suplyingmodel: bloc.modelSupplying));
              },
              child: const Text("Sim"),
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
    return WillPopScope(
      onWillPop: (() async {
        if (bloc.stage == 1) {
          final confirmation = await showConfirmationExitProcess();
          return confirmation ?? false;
        }
        return false;
      }),
      child: Scaffold(
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
                if (state == 1) {
                  final confirmation = await showConfirmationExitProcess();
                  return (confirmation ?? false);
                }
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
              final confirmation = await showConfirmationProcess();
              return (confirmation ?? false);
            })),
          ),
        ],
      ),
    );
  }
}
