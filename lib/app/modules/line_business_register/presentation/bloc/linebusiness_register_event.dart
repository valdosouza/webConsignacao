abstract class LinebusinessregisterEvent {}

class LinebusinessGetListEvent extends LinebusinessregisterEvent {}

class LinebusinessSearchEvent extends LinebusinessregisterEvent {
  String search;

  LinebusinessSearchEvent({
    required this.search,
  });
}

class LinebusinessPutEvent extends LinebusinessregisterEvent {
  LinebusinessPutEvent();
}

class LinebusinessPostEvent extends LinebusinessregisterEvent {
  LinebusinessPostEvent();
}

class LinebusinessAddEvent extends LinebusinessregisterEvent {
  LinebusinessAddEvent();
}

class LinebusinessEditEvent extends LinebusinessregisterEvent {
  LinebusinessEditEvent();
}
