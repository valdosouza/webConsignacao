import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:appweb/app/modules/drawer/drawer_module.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_bloc.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_event.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerPageMobile extends StatefulWidget {
  const DrawerPageMobile({super.key});

  @override
  State<DrawerPageMobile> createState() => _DrawerPageMobileState();
}

class _DrawerPageMobileState extends State<DrawerPageMobile> {
  late final DrawerBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<DrawerModule>();
    });
    bloc = Modular.get<DrawerBloc>();
    bloc.add(UserLoggedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerBloc, DrawerState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is DrawerLogoutState) {
          Modular.to.popAndPushNamed('/auth/');
        }
        if (state is DrawerCashierStatusState) {
          if (state.msg != "Aberto") {
            CustomToast.showToast(state.msg);
            Modular.to.navigate('/cashier/mobile/');
          } else {
            Modular.to.navigate('/customer/mobile/');
          }
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return const CustomCircularProgressIndicator();
        }
        return drawer();
      },
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.red,
                  Colors.black,
                  //Colors.black,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: <Widget>[
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                  elevation: 10,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "images/logomarca.png",
                        width: 180,
                        height: 90,
                        //fit: BoxFit.fill,
                      )),
                ),
                const SizedBox(height: 5),
                AutoSizeText(
                  bloc.userName,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                )
              ],
            ),
          ),
          itemMenuDraw(Icons.home, 'Clientes', () {
            bloc.add(CashierIsOpenEvent());
          }),
          itemMenuDraw(Icons.home, 'Caixa',
              () => Modular.to.navigate('/cashier/mobile/')),
          itemMenuDraw(Icons.home, 'Produtos',
              () => Modular.to.navigate('/product/content/')),
          itemMenuDraw(Icons.home, 'Estoque',
              () => Modular.to.navigate('/stock/mobile/')),
          itemMenuPolicy(Icons.home, 'Política de Privacidade'),
          itemLogout(Icons.close, 'Sair'),
        ],
      ),
    );
  }

  Widget itemLogout(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
            onTap: () {
              bloc.add(DrawerLogoutEvent());
            },
            splashColor: Colors.orangeAccent,
            child: SizedBox(
              height: 50,
              child: Row(
                children: <Widget>[
                  Icon(icon),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: const TextStyle(fontSize: 16.0),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
