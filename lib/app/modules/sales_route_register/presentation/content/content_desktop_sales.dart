import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_bloc.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/shared/theme.dart';
import '../bloc/sales_states.dart';
import '../pages/sales_interaction_page.dart';

class ContentDesktopSales extends StatefulWidget {
  const ContentDesktopSales({super.key});

  @override
  State<ContentDesktopSales> createState() =>
      _ContentDesktoLineBusinesseState();
}

class _ContentDesktoLineBusinesseState extends State<ContentDesktopSales> {
  late SalesBloc bloc;

  @override
  void initState() {
    bloc = Modular.get<SalesBloc>();
    bloc.add(LoadSalesEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesBloc, SalesState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is SalesDeleteSuccessState) {
          CustomToast.showToast("rota removido com sucesso.");
        } else if (state is SalesDeleteErrorState) {
          CustomToast.showToast(
              "Erro ao remover rota. Tente novamente mais tarde.");
        } else if (state is SalesAddSuccessState) {
          CustomToast.showToast("Rota adicionada com sucesso");
          bloc.add(LoadSalesEvent());
        } else if (state is SalesAddErrorState) {
          CustomToast.showToast(
              "Erro ao adicionar uma rota. Tente novamente mais tarde.");
        } else if (state is SalesEditSuccessState) {
          CustomToast.showToast("rota editado com sucesso");
          bloc.add(LoadSalesEvent());
        } else if (state is SalesErrorState) {
          CustomToast.showToast(
              "Erro ao editar rota. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is SalesInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SalesInterationPageState) {
          return SalesInteractionPage(
            bloc: bloc,
            model: state.salesModel,
          );
        }

        final salesList = state.listSalesModel;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de Formas de Pagamento'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  bloc.add(SalesInteractionEvent());
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildSearchInput(),
                  const SizedBox(height: 30.0),
                  Expanded(
                    child: salesList.isEmpty
                        ? const Center(
                            child: Text(
                                "Não encontramos nenhum regsitro em nossa base."))
                        : ListView.separated(
                            itemCount: salesList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => bloc.add(SalesInteractionEvent(
                                  salesModel: salesList[index])),
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Text(salesList[index].id.toString()),
                                  ),
                                ),
                                title: Text(salesList[index].description),
                                trailing: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    CustomToast.showToast(
                                        "Funcionalidade em desenvolvimento.");
                                  },
                                ),
                              ),
                            ),
                            separatorBuilder: (_, __) => const Divider(),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container _buildSearchInput() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: true,
        onChanged: (value) {
          bloc.add(SearchSalesEvent(search: value));
        },
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: "Pesquise as formas de pagamento",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
