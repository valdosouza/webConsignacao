import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/cashier_closure/cashier_closure_module.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/bloc/cashier_closure_bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widget/search_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../bloc/cashier_closure_event.dart';
import '../bloc/cashier_closure_state.dart';

final TextEditingController controller =
    MaskedTextController(mask: '00/00/0000');

class ContentCashierListPreviously extends StatefulWidget {
  const ContentCashierListPreviously({
    super.key,
  });

  @override
  State<ContentCashierListPreviously> createState() =>
      _ContentCashierListPreviouslyState();
}

class _ContentCashierListPreviouslyState
    extends State<ContentCashierListPreviously> {
  late CashierClosureBloc bloc;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierClosureModule>();
    });
    bloc = Modular.get<CashierClosureBloc>();
    bloc.add(CashierClosureGetClosurePreviouslyEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CashierClosureBloc, CashierClosureState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is CashierClosureGetClosureErrorState) {
            CustomToast.showToast(
                "Não foi possível listas os registros. Tente novamente mais tarde.");
          }
        },
        builder: (context, state) {
          if (state is CashierClosureLoadingState) {
            return const CustomCircularProgressIndicator();
          }
          return _listOfCashierClosure();
        });
  }

  Column _listOfCashierClosure() {
    return Column(
      children: [
        SearchWidget(
          controller: controller,
          keyboardType: TextInputType.datetime,
          onChange: ((value) {
            bloc.add(CashierClosureGetClosureOnSearchEvent(value: value));
          }),
        ),
        const SizedBox(height: 30.0),
        Expanded(
          child: ListView.separated(
            itemCount: bloc.closuresPreviously.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Modular.to.navigate(
                  '/cashierclosure/mobile/byday/',
                  arguments: bloc.closuresPreviously[index].dtRecord,
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: (Colors.black),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Text(
                      (index + 1).toString(),
                      style: kCircleAvatarTextStyle,
                    ),
                  ),
                ),
                title: AutoSizeText(bloc.closuresPreviously[index].dtRecord),
              ),
            ),
            separatorBuilder: (_, __) => const Divider(),
          ),
        )
      ],
    );
  }
}
