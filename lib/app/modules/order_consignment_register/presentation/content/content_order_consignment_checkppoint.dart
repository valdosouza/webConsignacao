import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_bloc.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/custom_body_wiget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/custom_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/order_consignment_register_module.dart';

class ContentConsignmentCheckpoint extends StatefulWidget {
  final OrderConsignmentCheckpointModel checkpointmodel;
  const ContentConsignmentCheckpoint({
    Key? key,
    required this.checkpointmodel,
  }) : super(key: key);

  @override
  State<ContentConsignmentCheckpoint> createState() =>
      _ContentConsignmenteCheckpoineState();
}

class _ContentConsignmenteCheckpoineState
    extends State<ContentConsignmentCheckpoint> {
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
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 45,
                child: const Text(
                  "Mercado do Povo",
                  style: ktittleAppBarStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              const CustomHeader(),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: CustomBody(size: size, modelCheckpoint: bloc.modelCheckpoint),
      ),
      bottomSheet: _footter(size),
    );
  }

  Widget _footter(Size size) {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8, top: 2, right: 4, bottom: 2),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                      ),
                    ),
                    child: const Text("Voltar"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8, top: 2, right: 4, bottom: 2),
                child: ElevatedButton(
                  onPressed: () {},
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
                    child: const Text("Limpar"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8, top: 2, right: 4, bottom: 2),
                child: ElevatedButton(
                  onPressed: () {},
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
                    child: const Text("Informações"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8, top: 2, right: 4, bottom: 2),
                child: ElevatedButton(
                  onPressed: () {},
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
                    child: const Text("Finalizar"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
