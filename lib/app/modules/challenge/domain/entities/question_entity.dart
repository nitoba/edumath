import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final String title;
  final List<Map<String, dynamic>> anwers;
  final String linkvideo;

  QuestionEntity({this.title, this.anwers, this.linkvideo});
  @override
  List<Object> get props => [title, anwers, linkvideo];
}
