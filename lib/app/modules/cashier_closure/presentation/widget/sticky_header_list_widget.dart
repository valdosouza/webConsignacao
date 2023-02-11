import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../../data/model/closure_model.dart';

final StickyHeaderController controller = StickyHeaderController();

class StickyHeaderList extends StatelessWidget {
  const StickyHeaderList({
    Key? key,
    required this.closureModel,
    required this.index,
    required this.listIndex,
  }) : super(key: key);

  final ClosureModel closureModel;
  final List<int> listIndex;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      controller: controller,
      header: Header(
        title:
            '${closureModel.items[listIndex[index]].kind[0].toUpperCase()}${closureModel.items[listIndex[index]].kind.substring(1)}',
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) {
            if (closureModel.items[listIndex[index]].kind ==
                closureModel.items[i].kind) {
              return ListTile(
                trailing: Text('${closureModel.items[i].tagValue}'),
                leading: CircleAvatar(
                  backgroundColor: (Colors.black),
                  child: Text('${i + 1}'),
                ),
                title: Text(closureModel.items[i].description),
              );
            } else {
              return const SizedBox();
            }
          },
          childCount: closureModel.items.length,
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.title,
    this.color = Colors.lightBlue,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60.0,
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
