import 'package:appweb/app/modules/drawer/presentation/cubit/drawer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            )),
            child: Column(
              children: <Widget>[
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
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
          itemMenuDraw(Icons.home, 'Administração',
              () async => Modular.to.navigate('/admin/content/')),
          itemMenuDraw(Icons.home, 'Produtos',
              () async => Modular.to.navigate('/product/content/')),
          itemMenuDraw(Icons.home, 'Estoque',
              () async => Modular.to.navigate('/stock/content/')),
          itemMenuDraw(Icons.home, 'Financeiro',
              () => Modular.to.navigate('/financial/content/')),
          itemMenuDraw(Icons.home, 'Pessoal',
              () => Modular.to.popAndPushNamed('/ResourceHuman/content/')),
          itemMenuDraw(Icons.home, 'Produção',
              () => Modular.to.popAndPushNamed('/home/')),
          itemLogout(Icons.close, 'Sair'),
        ],
      ),
    );
  }

  // ignore: must_be_immutable
  Widget itemMenuDraw(IconData icon, String text, Function ontap) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
            onTap: () async {
              //Modular.to.pop();
              ontap.call();
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

  Widget itemLogout(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
            onTap: () async {
              final drawerCubit = Modular.get<DrawerCubit>();
              await drawerCubit.logOut();
              await Modular.to.popAndPushNamed('/auth/');
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
