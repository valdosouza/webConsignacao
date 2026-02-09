// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

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
            width: double.infinity,
            height: 56,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(icon),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          )),
    ),
  );
}

Widget itemMenuPolicy(IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
    child: Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
      child: Link(
          uri: Uri.parse(
              'https://app.industriadechocolatesamor.com.br/politica-de-privacidade.html'),
          target: LinkTarget.blank,
          builder: (context, followLink) {
            return InkWell(
                onTap: () async {
                  followLink!();
                },
                splashColor: Colors.orangeAccent,
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(icon),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          text,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ));
          }),
    ),
  );
}


/*

               
          */