import 'package:appweb/app/modules/home/presentation/component/header.dart';
import 'package:flutter/material.dart';

class ContentDesktopHome extends StatelessWidget {
  const ContentDesktopHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: const [
              Header(),
              Divider(thickness: 1),
              Center(
                child: Text('Body Desktop - Home'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
