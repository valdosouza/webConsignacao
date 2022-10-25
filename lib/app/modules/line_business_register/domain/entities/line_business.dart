// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LineBusinessEntity extends Equatable {
  final int id;
  final int idInstitution;
  final String description;
  final bool active;
  LineBusinessEntity({
    required this.id,
    required this.idInstitution,
    required this.description,
    required this.active,
  });
  
  @override
  List<Object?> get props => [id, idInstitution, description, active];
}
