import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_bloc.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_event.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerPageMain extends StatefulWidget {
  const DrawerPageMain({super.key});

  @override
  State<DrawerPageMain> createState() => _DrawerPageMainState();
}

class _DrawerPageMainState extends State<DrawerPageMain> {
  late final DrawerBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<DrawerBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerBloc, DrawerState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is DrawerLogoutState) {
          Modular.to.pushReplacementNamed('/auth/');
        }
      },
      builder: (context, state) {
        return Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.red,
                      Colors.black,
                      Colors.black,
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "images/logomarca.png",
                            width: 160,
                            height: 70,
                            //fit: BoxFit.fill,
                          )),
                    ),
                    const Text(
                      'Nome do Usuario',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                ),
              ),
              itemMenuDraw(Icons.home, 'Administra????o',
                  () => Modular.to.navigate('/admin/content/')),
              itemMenuDraw(Icons.home, 'Produtos',
                  () => Modular.to.navigate('/product/content/')),
              itemMenuDraw(Icons.home, 'Estoque',
                  () => Modular.to.navigate('/stock/desktop/')),
              itemMenuDraw(Icons.home, 'Clientes',
                  () => Modular.to.navigate('/customer/desktop/')),
              itemMenuDraw(Icons.home, 'Financeiro',
                  () => Modular.to.navigate('/financial/content/')),
              itemMenuDraw(Icons.home, 'Pessoal',
                  () => Modular.to.navigate('/resourcehuman/content/')),
              itemMenuDraw(Icons.home, 'Produ????o',
                  () => Modular.to.navigate('/orderproduction/content/')),
              itemLogout(Icons.close, 'Sair'),
            ],
          ),
        );
      },
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
