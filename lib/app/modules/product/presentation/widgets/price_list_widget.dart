// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class PriceListWidget extends StatelessWidget {
  final String title;
  final List<Tuple3<int, String, double>> prices;
  const PriceListWidget({
    Key? key,
    required this.title,
    required this.prices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader.builder(
      builder: (context, state) => Container(
        height: 60.0,
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(
            leading: CircleAvatar(
              child: Text(prices[index].value1.toString()),
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(prices[index].value2),
                  Text(prices[index].value3.toStringAsFixed(2))
                ]),
          ),
          childCount: prices.length,
        ),
      ),
    );
  }
}
