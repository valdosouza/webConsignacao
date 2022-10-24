import '../../data/models/line_business_model.dart';

abstract class LineBusinessEvent {}

class LineBusinessGetlistEvent extends LineBusinessEvent {
  final int idInstitution;
  LineBusinessGetlistEvent({required this.idInstitution});
}

class LineBusinessSearchEvent extends LineBusinessEvent {
  final String search;
  LineBusinessSearchEvent({required this.search});
}

class LineBusinessDeleteEvent extends LineBusinessEvent {
  final int idLineBusiness;
  LineBusinessDeleteEvent({required this.idLineBusiness});
}

class LineBusinessAddEvent extends LineBusinessEvent {
  final LineBusinessModel lineBusinessModel;
  LineBusinessAddEvent({required this.lineBusinessModel});
}

class LineBusinessPutEvent extends LineBusinessEvent {
  final LineBusinessModel lineBusinessModel;
  LineBusinessPutEvent({required this.lineBusinessModel});
}
