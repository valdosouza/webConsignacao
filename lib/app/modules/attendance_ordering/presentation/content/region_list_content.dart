import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/event.dart';
import 'package:appweb/app/modules/attendance_ordering/attendance_ordering_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegionListContent extends StatefulWidget {
  final List<RegionModel> list;
  const RegionListContent({
    super.key,
    required this.list,
  });

  @override
  State<RegionListContent> createState() => _RegionListContentState();
}

class _RegionListContentState extends State<RegionListContent> {
  late AttendanceOrderingBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<AttendanceOrderingBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<AttendanceOrderingModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title(),
        const SizedBox(height: 10),
        body(),
      ],
    );
  }

  Container title() {
    return Container(
      color: kPrimaryColor,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: Text("Descrição da Região",
                    style: TextStyle(fontSize: 16, color: Colors.white))),
          ],
        ),
      ),
    );
  }

  Expanded body() {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.list.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: (Colors.black),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Text(
                  (index + 1).toString(),
                  style: kCircleAvatarTextStyle,
                ),
              ),
            ),
            title: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(widget.list[index].description),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {
                bloc.tbRegionId = widget.list[index].id;
                bloc.nameRegion = widget.list[index].description;
                bloc.add(MainFormEvent());
              },
            ),
          ),
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
