abstract class RegionRegisterEvent {}

class RegionRegisterGetListEvent extends RegionRegisterEvent {}

class RegionRegisterSearchEvent extends RegionRegisterEvent {
  String search;

  RegionRegisterSearchEvent({
    required this.search,
  });
}

class RegionRegisterPutEvent extends RegionRegisterEvent {}

class RegionRegisterPostEvent extends RegionRegisterEvent {}

class RegionRegisterAddEvent extends RegionRegisterEvent {}

class RegionRegisterEditEvent extends RegionRegisterEvent {}

class RegionRegisterGetSalesmanEvent extends RegionRegisterEvent {}

class RegionRegisterSearchSalesmanEvent extends RegionRegisterEvent {
  String search;

  RegionRegisterSearchSalesmanEvent({
    required this.search,
  });
}

class RegionRegisterReturnEvent extends RegionRegisterEvent {}
