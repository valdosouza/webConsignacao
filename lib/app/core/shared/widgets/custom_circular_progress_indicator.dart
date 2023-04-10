import 'package:flutter/material.dart';
import 'package:appweb/app/core/shared/theme.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text("Processando"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Center(
                        child: Image.asset(
                      "images/logoprogress.png",
                      width: 90,
                      height: 90,
                    )),
                  ),
                  const SizedBox(
                    height: 120,
                    width: 120,
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(123, 160, 91, 80),
                      strokeWidth: 7,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                "Aguarde..",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
