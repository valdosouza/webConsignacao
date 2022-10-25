import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_bloc.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_events.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_states.dart';
import 'package:appweb/app/modules/line_business_register/presentation/pages/line_business_interaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopLineBusiness extends StatefulWidget {
  const ContentDesktopLineBusiness({super.key});

  @override
  State<ContentDesktopLineBusiness> createState() =>
      _ContentDesktoLineBusinesseState();
}

class _ContentDesktoLineBusinesseState
    extends State<ContentDesktopLineBusiness> {
  late LineBusinessBloc bloc;

  @override
  void initState() {
    bloc = Modular.get<LineBusinessBloc>();
    bloc.add(LoadLineBusinessEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LineBusinessBloc, LineBusinessState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is LineBusinessDeleteSuccessState) {
          CustomToast.showToast("Forma de pagamento removido com sucesso.");
        } else if (state is LineBusinessDeleteErrorState) {
          CustomToast.showToast(
              "Erro ao remover forma de pagamento. Tente novamente mais tarde.");
        } else if (state is LineBusinessAddSuccessState) {
          CustomToast.showToast("Forma de pagamento adicionado com sucesso");
          bloc.add(LoadLineBusinessEvent());
        } else if (state is LineBusinessAddErrorState) {
          CustomToast.showToast(
              "Erro ao adicionar forma de pagamento. Tente novamente mais tarde.");
        } else if (state is LineBusinessEditSuccessState) {
          CustomToast.showToast("Forma de pagamento editado com sucesso");
          bloc.add(LoadLineBusinessEvent());
        } else if (state is LineBusinessPutErrorState) {
          CustomToast.showToast(
              "Erro ao editar forma de pagamento. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is LineBusinessInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LineBusinessInterationPageState) {
          return LineBusinessInteractionPage(
            bloc: bloc,
            lineBusiness: state.lineBusiness,
          );
        }
        final paymentTypeList = state.lineBusinessList;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de Formas de Pagamento'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  bloc.add(LineBusinessInterationEvent());
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
                    child: paymentTypeList.isEmpty
                        ? const Center(
                            child: Text(
                                "Não encontramos nenhum regsitro em nossa base."))
                        : ListView.separated(
                            itemCount: paymentTypeList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => bloc.add(LineBusinessInterationEvent(
                                  lineBusiness: paymentTypeList[index])),
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Text(
                                        paymentTypeList[index].id.toString()),
                                  ),
                                ),
                                title: Text(paymentTypeList[index].description),
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
          bloc.add(SearchLineBusinessEvent(search: value));
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
