import 'package:equatable/equatable.dart';

class GeneralUserMetricsEntity extends Equatable {
  final int correctAnwers;
  final int incorrectAnwers;

  GeneralUserMetricsEntity({this.correctAnwers, this.incorrectAnwers});

  @override
  List<Object> get props => [correctAnwers, incorrectAnwers];
}
