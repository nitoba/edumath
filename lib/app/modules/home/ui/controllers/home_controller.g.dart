// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<IGetUserGeneralMetrics>(), i<IGetCategories>()),
  singleton: true,
  lazy: true,
);

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

  final _$categoriesAtom = Atom(name: '_HomeControllerBase.categories');

  @override
  List<CategoriesEntity> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<CategoriesEntity> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$getUserMetricsAsyncAction =
      AsyncAction('_HomeControllerBase.getUserMetrics');

  @override
  Future getUserMetrics(String userId) {
    return _$getUserMetricsAsyncAction.run(() => super.getUserMetrics(userId));
  }

  final _$getAllCagetoriesAsyncAction =
      AsyncAction('_HomeControllerBase.getAllCagetories');

  @override
  Future getAllCagetories() {
    return _$getAllCagetoriesAsyncAction.run(() => super.getAllCagetories());
  }

  @override
  String toString() {
    return '''
generalUserMetricsEntity: ${generalUserMetricsEntity},
categories: ${categories}
    ''';
  }
}
