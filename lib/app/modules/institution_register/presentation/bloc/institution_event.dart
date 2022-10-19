abstract class InstitutionEvent {}

class InstitutionSaveEvent extends InstitutionEvent {}

class InstitutionGetEvent extends InstitutionEvent {}

class InstitutionPutEvent extends InstitutionEvent {}

class InstitutionCepEvent extends InstitutionEvent {
  final String cep;

  InstitutionCepEvent(this.cep);
}

class InstitutionCnpjEvent extends InstitutionEvent {
  final String cnpj;

  InstitutionCnpjEvent(this.cnpj);
}
