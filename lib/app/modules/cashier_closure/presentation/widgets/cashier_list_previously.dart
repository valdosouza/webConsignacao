import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/bloc/cashier_closure_bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

final TextEditingController controller =
    MaskedTextController(mask: '00/00/0000');

class CashierListPreviously extends StatelessWidget {
  const CashierListPreviously({
    Key? key,
    required this.bloc,
    required this.closures,
  }) : super(key: key);

  final CashierClosureBloc bloc;
  final List<CashierClosurePreviously> closures;

  @override
  Widget build(BuildContext context) {
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
            itemCount: closures.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                bloc.add(
                  CashierClosureGetClosureEvent(
                    date: DateTime.parse(closures[index].dtRecord!),
                    userId: 2,
                    institutionId: 1,
                  ),
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Text((index + 1).toString()),
                  ),
                ),
                title: Text(
                  CustomDate.formatDate(
                      closures[index].dtRecord.toString(), 'dd/MM/yyyy'),
                ),
              ),
            ),
            separatorBuilder: (_, __) => const Divider(),
          ),
        )
      ],
    );
  }
}
