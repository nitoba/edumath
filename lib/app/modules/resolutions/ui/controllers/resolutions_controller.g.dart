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
  final _$videoQuestionsAtom =
      Atom(name: '_ResolutionsControllerBase.videoQuestions');

  @override
  List<VideoEntity> get videoQuestions {
    _$videoQuestionsAtom.reportRead();
    return super.videoQuestions;
  }

  @override
  set videoQuestions(List<VideoEntity> value) {
    _$videoQuestionsAtom.reportWrite(value, super.videoQuestions, () {
      super.videoQuestions = value;
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
  String toString() {
    return '''
videoQuestions: ${videoQuestions}
    ''';
  }
}
