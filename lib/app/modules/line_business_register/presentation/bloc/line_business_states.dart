import 'package:appweb/app/modules/line_business_register/data/models/line_business_model.dart';

abstract class LineBusinessState {
  List<LineBusinessModel> lineBusiness;

  LineBusinessState({
    required this.lineBusiness,
  });
}

class LineBusinessInitialState extends LineBusinessState {
  LineBusinessInitialState() : super(lineBusiness: []);
}

class LineBusinessSuccessState extends LineBusinessState {
  LineBusinessSuccessState({
    required List<LineBusinessModel> lineBusiness,
  }) : super(lineBusiness: lineBusiness);
}

class LineBusinessEditSuccessState extends LineBusinessState {
  LineBusinessEditSuccessState({required List<LineBusinessModel> lineBusiness})
      : super(lineBusiness: lineBusiness);
}

class LineBusinessAddSuccessState extends LineBusinessState {
  LineBusinessAddSuccessState()
      : super(lineBusiness: []);
}

class LineBusinessPutErrorState extends LineBusinessState {
  LineBusinessPutErrorState({required List<LineBusinessModel> lineBusiness})
      : super(lineBusiness: lineBusiness);
}
class LineBusinessPutSuccessState extends LineBusinessState {
  LineBusinessPutSuccessState()
      : super(lineBusiness: []);
}

class LineBusinessAddErrorState extends LineBusinessState {
  LineBusinessAddErrorState({required List<LineBusinessModel> lineBusiness})
      : super(lineBusiness: lineBusiness);
}
class LineBusinessGetlistErrorState extends LineBusinessState {
  LineBusinessGetlistErrorState() : super(lineBusiness: []);
}
class LineBusinessGetlistSuccessEvent extends LineBusinessState {
  LineBusinessGetlistSuccessEvent({required List<LineBusinessModel> lineBusiness}) : super(lineBusiness: lineBusiness);
}

class LineBusinessDeleteSuccessState extends LineBusinessState {
  LineBusinessDeleteSuccessState({required List<LineBusinessModel> lineBusiness})
      : super(lineBusiness: lineBusiness);
}

class LineBusinessDeleteErrorState extends LineBusinessState {
  LineBusinessDeleteErrorState({required List<LineBusinessModel> lineBusiness})
      : super(lineBusiness: lineBusiness);
}
class LineBusinessSearchState extends LineBusinessState {
  LineBusinessSearchState({required List<LineBusinessModel> lineBusiness})
      : super(lineBusiness: lineBusiness);
}