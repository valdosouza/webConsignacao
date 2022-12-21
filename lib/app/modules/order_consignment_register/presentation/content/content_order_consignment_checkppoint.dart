import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_event.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/footer_saldo_devedor_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_items_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/footer_divida_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/header_paymnet_info_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/list_field_item_widget.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/widget/payment_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/order_consignment_register_module.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_bloc.dart';

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
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Mercado do Povo"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              bloc.add(OrderConsignementRegisterCheckpointPostEvent(
                  checkpointmodel: bloc.modelCheckpoint));
            },
          )
        ],
      ),
      body: Column(
        children: [
          _header(size),
          _body(size),
          _footter(size),
        ],
      ),
    );
  }

  Widget _header(Size size) {
    return SizedBox(
      height: 40,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: headeritems(),
          ),
          Expanded(
            flex: 3,
            child: headerPaymentInfo(),
          ),
        ],
      ),
    );
  }

  Widget _body(Size size) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: _buildListView(bloc.modelCheckpoint.items, size),
          ),
          Expanded(
            flex: 3,
            child: paymentinfo(bloc.modelCheckpoint),
          ),
        ],
      ),
    );
  }

  Widget _footter(Size size) {
    return SizedBox(
      height: 40,
      width: size.width,
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: footterDivida(bloc.modelCheckpoint),
          ),
          Expanded(
            flex: 3,
            child: foottersaldodevedor(bloc.modelCheckpoint),
          ),
        ],
      ),
    );
  }

  _buildListView(List<OrderConsignmentCheckpointItemsModel> items, Size size) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      margin: const EdgeInsets.only(left: 3.0, right: 2.0),
      child: Column(
        children: [
          SizedBox(
            height: size.height - 190,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 200,
                      child: listfielditems(items[index], 1, false),
                    ),
                    Expanded(
                      flex: 400,
                      child: listfielditems(items[index], 2, false),
                    ),
                    Expanded(
                      flex: 270,
                      child: listfielditems(items[index], 3, false),
                    ),
                    Expanded(
                      flex: 200,
                      child: listfielditems(items[index], 4, true),
                    ),
                    Expanded(
                      flex: 315,
                      child: listfielditems(items[index], 5, false),
                    ),
                    Expanded(
                      flex: 300,
                      child: listfielditems(items[index], 6, false),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
