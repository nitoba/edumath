import 'package:edumath/app/modules/resolutions/domain/entities/video_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'url_to_videoid.g.dart';

abstract class IUrlToVideoId {
  List<VideoEntity> call(List<String> linkvideos);
}

@Injectable(singleton: false)
class UrlToVideoId implements IUrlToVideoId {
  @override
  List<VideoEntity> call(List<String> linkvideos) {
    var videoIds = linkvideos
        .map((link) => VideoEntity(videoId: link.split('=')[1]))
        .toList();
    return videoIds;
  }
}
