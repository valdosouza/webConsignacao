import 'package:appweb/app/modules/consigna_register/consigna_register_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentConsignaRegister extends StatefulWidget {
  const ContentConsignaRegister({super.key});

  @override
  State<ContentConsignaRegister> createState() =>
      _ContentConsignaRegisterState();
}

class _ContentConsignaRegisterState extends State<ContentConsignaRegister> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<ConsignaRegisterModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consignação"),
      ),
    );
  }
}
