import 'package:equatable/equatable.dart';

class CategoriesEntity extends Equatable {
  final String id;
  final String title;

  CategoriesEntity({this.id, this.title});
  @override
  List<Object> get props => [id, title];
}
