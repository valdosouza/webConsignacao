import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_bloc.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_event.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
    bloc.add(UserLoggedEvent());
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
            decoration: kBoxDecorationflexibleSpace,
            child: Column(
              children: <Widget>[
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                  elevation: 10,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "images/logomarca.png",
                        width: 225,
                        height: 70,
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
          itemMenuDraw(Icons.home, 'Estoque',
              () => Modular.to.navigate('/stock/desktop/')),
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
