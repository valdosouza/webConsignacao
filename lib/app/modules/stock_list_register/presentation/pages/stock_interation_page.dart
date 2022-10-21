import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_bloc.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_events.dart';
import 'package:flutter/material.dart';

class StockInterationItem extends StatefulWidget {
  final StockListBloc bloc;
  final StockListModel? stock;
  const StockInterationItem({
    super.key,
    required this.bloc,
    this.stock,
  });

  @override
  State<StockInterationItem> createState() => _StockInterationItemState();
}

class _StockInterationItemState extends State<StockInterationItem> {
  bool selectRadio = false;
  bool selectMain = false;
  StockListModel? stock;

  @override
  void initState() {
    if (widget.stock?.active != null) {
      selectRadio = widget.stock!.active == "S";
      selectMain = widget.stock!.main == "S";
    }
    stock = widget.stock;

    super.initState();
  }

  String descripton = "";
  String active = "N";
  String main = "N";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.bloc.add(LoadStockListEvent());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: stock == null ? const Text('Adicionar') : const Text('Editar'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              widget.bloc.add(LoadStockListEvent());
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                if (stock != null) {
                  if (stock!.description.isEmpty) {
                    CustomToast.showToast("Campo descrição é obrigatório.");
                  } else {
                    widget.bloc.add(EditStockListEvent(stock: stock!));
                  }
                } else {
                  if (descripton.isEmpty) {
                    CustomToast.showToast("Campo descrição é obrigatório.");
                  } else {
                    widget.bloc.add(
                      AddStockListEvent(
                        stock: StockListModel(
                          id: (widget.bloc.state.stocklist.last.id + 1),
                          institution:
                              widget.bloc.state.stocklist.last.institution,
                          description: descripton,
                          active: active,
                          main: "N",
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInput(
                title: 'Descrição',
                initialValue: stock?.description ?? "",
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  stock?.description = value;
                  descripton = value;
                },
              ),
              const SizedBox(height: 30.0),
              const Text("Ativo", style: kLabelStyle),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: selectRadio,
                        activeColor: Colors.red,
                        onChanged: selectRadio
                            ? (value) {}
                            : (value) {
                                setState(() {
                                  selectRadio = true;
                                });
                                stock?.active = "S";
                                active = "S";
                              },
                      ),
                      const SizedBox(width: 5.0),
                      const Text("Sim", style: kLabelStyle),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Row(
                    children: [
                      Radio(
                          value: false,
                          groupValue: selectRadio,
                          activeColor: Colors.red,
                          onChanged: selectRadio
                              ? (value) {
                                  setState(() {
                                    selectRadio = false;
                                  });
                                  stock?.active = "N";
                                  active = "N";
                                }
                              : (value) {}),
                      const SizedBox(width: 5.0),
                      const Text("Não", style: kLabelStyle),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              const Text("Principal", style: kLabelStyle),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: selectMain,
                        activeColor: Colors.red,
                        onChanged: selectMain
                            ? (value) {}
                            : (value) {
                                setState(() {
                                  selectMain = true;
                                });
                                stock?.main = "S";
                                main = "S";
                              },
                      ),
                      const SizedBox(width: 5.0),
                      const Text("Sim", style: kLabelStyle),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Row(
                    children: [
                      Radio(
                          value: false,
                          groupValue: selectMain,
                          activeColor: Colors.red,
                          onChanged: selectMain
                              ? (value) {
                                  setState(() {
                                    selectMain = false;
                                  });
                                  stock?.main = "N";
                                  main = "N";
                                }
                              : (value) {}),
                      const SizedBox(width: 5.0),
                      const Text("Não", style: kLabelStyle),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
