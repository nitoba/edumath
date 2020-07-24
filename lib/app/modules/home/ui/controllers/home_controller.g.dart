// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$generalUserMetricsEntityAtom =
      Atom(name: '_HomeControllerBase.generalUserMetricsEntity');

  @override
  GeneralUserMetricsEntity get generalUserMetricsEntity {
    _$generalUserMetricsEntityAtom.reportRead();
    return super.generalUserMetricsEntity;
  }

  @override
  set generalUserMetricsEntity(GeneralUserMetricsEntity value) {
    _$generalUserMetricsEntityAtom
        .reportWrite(value, super.generalUserMetricsEntity, () {
      super.generalUserMetricsEntity = value;
    });
  }

  final _$getUserMetricsAsyncAction =
      AsyncAction('_HomeControllerBase.getUserMetrics');

  @override
  Future getUserMetrics(String userId) {
    return _$getUserMetricsAsyncAction.run(() => super.getUserMetrics(userId));
  }

  @override
  String toString() {
    return '''
generalUserMetricsEntity: ${generalUserMetricsEntity}
    ''';
  }
}
