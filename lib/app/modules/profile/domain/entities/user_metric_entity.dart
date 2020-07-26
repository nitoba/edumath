import 'package:equatable/equatable.dart';

class UserMetricEntity extends Equatable {
  final String categorieName;
  final int correctanwers;
  final int incorrectanwers;

  UserMetricEntity(
      {this.categorieName, this.correctanwers, this.incorrectanwers});

  @override
  List<Object> get props => [categorieName, correctanwers, incorrectanwers];
}
