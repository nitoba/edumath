import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String videoId;

  VideoEntity({this.videoId});

  @override
  List<Object> get props => [videoId];
}
