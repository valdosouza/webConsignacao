abstract class CustomerState {}

class CustomerLoadingState extends CustomerState {}

class CustomerGetRegionListLoadedState extends CustomerState {}

class CustomerGetRegionListErrorState extends CustomerState {
  String error;
  CustomerGetRegionListErrorState({
    required this.error,
  });
}
