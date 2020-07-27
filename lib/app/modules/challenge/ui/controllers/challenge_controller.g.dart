// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ChallengeController = BindInject(
  (i) => ChallengeController(i<IGetQuestions>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChallengeController on _ChallengeControllerBase, Store {
  final _$currectQuestionAtom =
      Atom(name: '_ChallengeControllerBase.currectQuestion');

  @override
  int get currectQuestion {
    _$currectQuestionAtom.reportRead();
    return super.currectQuestion;
  }

  @override
  set currectQuestion(int value) {
    _$currectQuestionAtom.reportWrite(value, super.currectQuestion, () {
      super.currectQuestion = value;
    });
  }

  final _$questionsAtom = Atom(name: '_ChallengeControllerBase.questions');

  @override
  ObservableList<QuestionEntity> get questions {
    _$questionsAtom.reportRead();
    return super.questions;
  }

  @override
  set questions(ObservableList<QuestionEntity> value) {
    _$questionsAtom.reportWrite(value, super.questions, () {
      super.questions = value;
    });
  }

  final _$goToChallengeAsyncAction =
      AsyncAction('_ChallengeControllerBase.goToChallenge');

  @override
  Future goToChallenge(String categorieiD) {
    return _$goToChallengeAsyncAction
        .run(() => super.goToChallenge(categorieiD));
  }

  final _$_ChallengeControllerBaseActionController =
      ActionController(name: '_ChallengeControllerBase');

  @override
  dynamic nextQuestion() {
    final _$actionInfo = _$_ChallengeControllerBaseActionController.startAction(
        name: '_ChallengeControllerBase.nextQuestion');
    try {
      return super.nextQuestion();
    } finally {
      _$_ChallengeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currectQuestion: ${currectQuestion},
questions: ${questions}
    ''';
  }
}
