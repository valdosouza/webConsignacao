import 'package:flutter/material.dart';

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
