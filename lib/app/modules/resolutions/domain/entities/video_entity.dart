import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String videoId;

  VideoEntity({this.videoId});

  @override
  // TODO: implement props
  List<Object> get props => [videoId];
}
