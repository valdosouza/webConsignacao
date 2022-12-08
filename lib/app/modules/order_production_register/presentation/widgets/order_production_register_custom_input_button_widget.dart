import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_bloc.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_event.dart';
import 'package:flutter/material.dart';

class CustomInputButtonWidget extends StatelessWidget {
  final OrderProductionRegisterBloc bloc;
  final OrderProductionRegisterEvent event;
  final String initialValue;
  final String title;

  const CustomInputButtonWidget({
    super.key,
    required this.bloc,
    required this.event,
    required this.title,
    required this.initialValue
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
                      bloc.add(event);
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
