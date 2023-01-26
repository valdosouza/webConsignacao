import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_bloc.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_event.dart';
import 'package:flutter/material.dart';

class CustomInputButtonWidget extends StatelessWidget {
  final OrderBonusRegisterBloc bloc;
  final OrderBonusRegisterEvent event;
  final String initialValue;
  final String title;
  final bool readOnly;
  const CustomInputButtonWidget({
    super.key,
    required this.bloc,
    required this.event,
    required this.title,
    required this.initialValue,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    initialValue,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  hoverColor: Colors.transparent,
                  onPressed: () {
                    (!readOnly) ? bloc.add(event) : null;
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
