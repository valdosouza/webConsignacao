import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:appweb/app/modules/order_consignment_register/order_consignment_register_module.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_bloc.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_event.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_state.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/content/content_order_consignment_checkpoint.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/content/content_order_consignment_supplying.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';

class OrderConsginmentRegisterPageMobile extends StatefulWidget {
  final OrderAttendanceModel orderAttendance;
  const OrderConsginmentRegisterPageMobile({
    Key? key,
    required this.orderAttendance,
  }) : super(key: key);

  @override
  State<OrderConsginmentRegisterPageMobile> createState() =>
      OrderConsginmentRegisterPageMobileState();
}

class OrderConsginmentRegisterPageMobileState
    extends State<OrderConsginmentRegisterPageMobile> {
  late final OrderConsignmentRegisterBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = Modular.get<OrderConsignmentRegisterBloc>();

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderConsignmentRegisterModule>;
    });
    bloc.modelAttendance = widget.orderAttendance;
    bloc.add(OrderConsignmentRegisterGetlastEvent(
        tbCustomerId: widget.orderAttendance.tbCustomerId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderConsignmentRegisterBloc,
        OrderConsignmentRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is OrderConsigngmentGetLastErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados. Tente novamente mais tarde");
          Modular.to.navigate('/attendance/');
        } else if (state is OrderConsignmentRegisterCheckpointPostErrorState) {
          CustomToast.showToast(state.error);
        } else if (state is OrderConsignmentRegisterSupplyingPostErrorState) {
          CustomToast.showToast(state.error);
        }
      },
      builder: (context, state) {
        if (state is OrderConsignmentRegisterCheckpointPostSucessState) {
          return const ContentConsignmentSupplying();
        }
        if (state is OrderConsignmentRegisterCheckpointPostErrorState) {
          return ContentConsignmentCheckpoint(
              checkpointmodel: bloc.modelCheckpoint);
        }
        if (state is OrderConsignmentRegisterSupplyingPostSucessState) {
          Modular.to.navigate('/customer/mobile/');
        }
        if (state is OrderConsignmentRegisterSupplyingPostErrorState) {
          return const ContentConsignmentSupplying();
        }

        if (state is OrderConsignmentRegisterLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        }
        if (state is OrderConsignmentRegisterSupplyingClearSucessState) {
          return const ContentConsignmentSupplying();
        }
        if (state is OrderConsignmentGetLastLoadedState) {
          if (state.supplyingmodel.order.id > 0) {
            return ContentConsignmentCheckpoint(
                checkpointmodel: state.checkpointmodel);
          } else {
            return const ContentConsignmentSupplying();
          }
        }
        return Container();
      },
    );
  }
}
