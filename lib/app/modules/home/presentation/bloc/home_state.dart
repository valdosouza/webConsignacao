import 'package:appweb/app/modules/home/data/model/home_sales_payment_type_model.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  const HomeLoadedState(this.homeSalesPaymentTypeModel);

  final List<HomeSalesPaymentTypeModel> homeSalesPaymentTypeModel;
}

class HomeSuccessState extends HomeState {}

class HomeLogoutState extends HomeState {}

class HomeErrorState extends HomeState {
  final String error;

  const HomeErrorState(this.error);
}
