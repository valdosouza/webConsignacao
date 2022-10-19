abstract class InstitutionEvent {}

class InstitutionSaveEvent extends InstitutionEvent {}

class InstitutionGetEvent extends InstitutionEvent {}

class InstitutionPutEvent extends InstitutionEvent {}

class InstitutionCepEvent extends InstitutionEvent {
  final String cep;

  InstitutionCepEvent(this.cep);
}
