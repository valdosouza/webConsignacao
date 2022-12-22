import 'package:appweb/app/modules/order_consignment_register/order_consignment_register_module.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_bloc.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_event.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_state.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/content/content_order_consignment_checkppoint.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/content/content_order_consignment_supplying.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';

class OrderConsginmentRegisterPageMobile extends StatefulWidget {
  final int tbCustomerId;
  const OrderConsginmentRegisterPageMobile({
    Key? key,
    required this.tbCustomerId,
  }) : super(key: key);

  @override
  State<OrderConsginmentRegisterPageMobile> createState() =>
      OrderAttendancerRegisterPageMobileState();
}

class OrderAttendancerRegisterPageMobileState
    extends State<OrderConsginmentRegisterPageMobile> {
  late final OrderConsignmentRegisterBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = Modular.get<OrderConsignmentRegisterBloc>();

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderConsignmentRegisterModule>;
    });

    bloc.add(OrderConsignmentRegisterGetlastEvent(
        tbInstitutionId: 1, tbCustomerId: widget.tbCustomerId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderConsignmentRegisterBloc,
        OrderConsignmentRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is OrderConsigngmentGetLastErrorState) {
          CustomToast.showToast(
              "Erro ao buscar buscar último operação. Tente novamente mais tarde");
          Modular.to.navigate('/attendance/');
        } else if (state is OrderConsignmentRegisterCheckpointPostErrorState) {
          CustomToast.showToast(
              "Erro ao Gravar a etapa de Checagem.Tente novamente");
        } else if (state is OrderConsignmentRegisterSupplyingPostErrorState) {
          CustomToast.showToast(
              "Erro ao Gravar a etapa de Abastecimento.Tente novamente");
        }
      },
      builder: (context, state) {
        if (state is OrderConsignmentRegisterCheckpointPostSucessState) {
          return ContentConsignmentSupplying(
              supplyingmodel: bloc.modelSupplying);
        }
        if (state is OrderConsignmentRegisterCheckpointPostErrorState) {
          return ContentConsignmentCheckpoint(
              checkpointmodel: bloc.modelCheckpoint);
        }
        if (state is OrderConsignmentRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is OrderConsignmentGetLastLoadedState) {
          if (state.supplyingmodel.order.id > 0) {
            return ContentConsignmentCheckpoint(
                checkpointmodel: state.checkpointmodel);
          } else {
            return ContentConsignmentSupplying(
                supplyingmodel: state.supplyingmodel);
          }
        }
        return Container();
      },
    );
  }
}
