import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/set_default_sequence.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/event.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerListContent extends StatefulWidget {
  const CustomerListContent({
    super.key,
  });

  @override
  State<CustomerListContent> createState() => SalesRoutListeMobileState();
}

class SalesRoutListeMobileState extends State<CustomerListContent> {
  late AttendanceOrderingBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<AttendanceOrderingBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: mediaquery.size.height - 243,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: bloc.customerList.isEmpty
                    ? const Center(
                        child: Text(
                            "Não encontramos nenhum registro em nossa base."))
                    : ListView.separated(
                        itemCount: bloc.customerList.length,
                        itemBuilder: (context, index) => InkWell(
                          child: ListTile(
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: CircleAvatar(
                                      backgroundColor: (bloc.customerList[index]
                                                  .defaultSeq ==
                                              0)
                                          ? (Colors.red)
                                          : (Colors.black),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Text(
                                          bloc.customerList[index].defaultSeq
                                              .toString(),
                                          style: kCircleAvatarTextStyle,
                                        ),
                                      ),
                                    )),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        bloc.customerList[index].nickTrade,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 2,
                                      ),
                                      AutoSizeText(
                                        "End: ${bloc.customerList[index].street}, ${bloc.customerList[index].nmbr}",
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: AutoSizeText(
                                    bloc.customerList[index].sequence
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: btnChangeDefaultSeq(index),
                                ),
                              ],
                            ),
                          ),
                          onLongPress: () {
                            bloc.add(OrderModeEvent(
                                tbCustomerId: bloc.customerList[index].id));
                          },
                        ),
                        separatorBuilder: (_, __) => const Divider(),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  btnChangeDefaultSeq(index) {
    return BlocBuilder<AttendanceOrderingBloc, AttendanceOrderingState>(
      bloc: bloc,
      builder: (context, state) {
        if (((bloc.tbCustomerIdPickedForOrder !=
            bloc.customerList[index].id))) {
          return IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                bloc.add(
                  SetDefaultSequenceEvent(
                    params: ParamsDefaultSequence(
                        tbInstitutionId: 0,
                        tbSalesRouteId: bloc.customerList[index].tbSalesRouteId,
                        tbRegionId: bloc.tbRegionId,
                        tbCustomerId: bloc.tbCustomerIdPickedForOrder,
                        defaultSeq: bloc.customerList[index].defaultSeq + 1),
                  ),
                );
              });
        } else {
          return IconButton(
              icon: const Icon(Icons.block),
              onPressed: () {
                bloc.add(OrderModeEvent(tbCustomerId: -1));
              });
        }
      },
    );
  }
}
