import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class CashierClosureWidget extends StatelessWidget {
  final String title;
  final List<ClosureItemsModel> model;
  const CashierClosureWidget({
    super.key,
    required this.title,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader.builder(
      builder: (context, state) => Container(
        height: 60.0,
        color: kPrimaryColor,
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
              backgroundColor: (Colors.black),
              child: Text(
                (index + 1).toString(),
                style: kCircleAvatarTextStyle,
              ),
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(model[index].description),
                  Text(floatToStrF(model[index].tagValue)),
                ]),
          ),
          childCount: model.length,
        ),
      ),
    );
  }
}
