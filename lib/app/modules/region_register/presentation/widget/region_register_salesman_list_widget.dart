import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/region_register/presentation/bloc/region_register_bloc.dart';
import 'package:appweb/app/modules/region_register/presentation/bloc/region_register_event.dart';
import 'package:appweb/app/modules/region_register/presentation/bloc/region_register_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegionRegisterSalesmanListWidget extends StatefulWidget {
  const RegionRegisterSalesmanListWidget({
    super.key,
  });

  @override
  State<RegionRegisterSalesmanListWidget> createState() =>
      _CustomerRegisterSalesmanListWidgetState();
}

class _CustomerRegisterSalesmanListWidgetState
    extends State<RegionRegisterSalesmanListWidget> {
  late final RegionRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<RegionRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionRegisterBloc, RegionRegisterState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is RegionRegisterGetSalesmanSuccessState) {
          return _customerSalesmanList(state);
        } else {
          return Container();
        }
      },
    );
  }

  Scaffold _customerSalesmanList(RegionRegisterGetSalesmanSuccessState state) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const AutoSizeText(
          'Lista de vendedores',
          style: kTitleAppBarStyle,
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_outlined, color: kSecondaryColor),
          onPressed: () {
            bloc.add(RegionRegisterReturnEvent());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: kBoxDecorationStyle,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  onChanged: (value) {
                    bloc.add(RegionRegisterSearchSalesmanEvent(search: value));
                  },
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 5.0),
                    hintText: "Pesquise aqui",
                    hintStyle: kHintTextStyle,
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Expanded(
                child: state.salesmans.isEmpty
                    ? const Center(
                        child: Text(
                            "Não encontramos nenhum registro em nossa base."))
                    : ListView.separated(
                        itemCount: state.salesmans.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            bloc.model.tbSalesmanId = state.salesmans[index].id;
                            bloc.model.salesmanName =
                                state.salesmans[index].nickTrade;
                            bloc.add(RegionRegisterReturnEvent());
                          },
                          child: ListTile(
                            leading: Text(state.salesmans[index].nameCompany),
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
  }
}
