import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AdminMenus extends StatelessWidget {
  const AdminMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(Icons.home, 'Estabelecimento',
              () async => Modular.to.navigate('/admin/institution/')),
          itemMenuDraw(Icons.home, 'Usuários',
              () async => Modular.to.navigate('/product/listproduct/')),
          itemMenuDraw(Icons.home, 'Rotas',
              () async => Modular.to.navigate('/stock/liststocks/')),
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
}
