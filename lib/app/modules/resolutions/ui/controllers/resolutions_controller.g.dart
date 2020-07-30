// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolutions_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ResolutionsController = BindInject(
  (i) => ResolutionsController(i<IUrlToVideoId>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResolutionsController on _ResolutionsControllerBase, Store {
  Computed<dynamic> _$currectQuestionVideoComputed;

  @override
  dynamic get currectQuestionVideo => (_$currectQuestionVideoComputed ??=
          Computed<dynamic>(() => super.currectQuestionVideo,
              name: '_ResolutionsControllerBase.currectQuestionVideo'))
      .value;

  final _$_indexVideoAtom =
      Atom(name: '_ResolutionsControllerBase._indexVideo');

  @override
  int get _indexVideo {
    _$_indexVideoAtom.reportRead();
    return super._indexVideo;
  }

  @override
  set _indexVideo(int value) {
    _$_indexVideoAtom.reportWrite(value, super._indexVideo, () {
      super._indexVideo = value;
    });
  }

  final _$labelButtomAtom =
      Atom(name: '_ResolutionsControllerBase.labelButtom');

  @override
  String get labelButtom {
    _$labelButtomAtom.reportRead();
    return super.labelButtom;
  }

  @override
  set labelButtom(String value) {
    _$labelButtomAtom.reportWrite(value, super.labelButtom, () {
      super.labelButtom = value;
    });
  }

  final _$_ResolutionsControllerBaseActionController =
      ActionController(name: '_ResolutionsControllerBase');

  @override
  dynamic getVideosIds(ObservableList<QuestionEntity> questions) {
    final _$actionInfo = _$_ResolutionsControllerBaseActionController
        .startAction(name: '_ResolutionsControllerBase.getVideosIds');
    try {
      return super.getVideosIds(questions);
    } finally {
      _$_ResolutionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextVideo() {
    final _$actionInfo = _$_ResolutionsControllerBaseActionController
        .startAction(name: '_ResolutionsControllerBase.nextVideo');
    try {
      return super.nextVideo();
    } finally {
      _$_ResolutionsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
labelButtom: ${labelButtom},
currectQuestionVideo: ${currectQuestionVideo}
    ''';
  }
}
