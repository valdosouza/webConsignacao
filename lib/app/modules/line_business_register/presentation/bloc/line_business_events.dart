import 'package:appweb/app/modules/line_business_register/data/models/line_business_model.dart';

abstract class LineBusinessEvent {}

class LoadLineBusinessEvent extends LineBusinessEvent {}

class AddLineBusinessEvent extends LineBusinessEvent {
  LineBusinessModel lineBusiness;

  AddLineBusinessEvent({
    required this.lineBusiness,
  });
}

class EditLineBusinessEvent extends LineBusinessEvent {
  LineBusinessModel lineBusiness;

  EditLineBusinessEvent({
    required this.lineBusiness,
  });
}

class SearchLineBusinessEvent extends LineBusinessEvent {
  String search;

  SearchLineBusinessEvent({
    required this.search,
  });
}

class DeleteLineBusinessEvent extends LineBusinessEvent {
  int lineBusinessId;

  DeleteLineBusinessEvent({
    required this.lineBusinessId,
  });
}

class LineBusinessInterationEvent extends LineBusinessEvent {
  LineBusinessModel? lineBusiness;

  LineBusinessInterationEvent({
    this.lineBusiness,
  });
}
