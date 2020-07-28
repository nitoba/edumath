import 'package:equatable/equatable.dart';

class ScoreEntity extends Equatable {
  final int correctScore;
  final int incorrectScore;
  final String userId;
  final String categorieName;

  ScoreEntity(
      {this.correctScore,
      this.incorrectScore,
      this.userId,
      this.categorieName});
  @override
  List<Object> get props =>
      [correctScore, incorrectScore, userId, categorieName];
}
