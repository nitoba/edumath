// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ProfileController = BindInject(
  (i) => ProfileController(i<IGetUserMetrics>(), i<ILogout>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on _ProfileControllerBase, Store {
  final _$userMetricsAtom = Atom(name: '_ProfileControllerBase.userMetrics');

  @override
  List<UserMetricEntity> get userMetrics {
    _$userMetricsAtom.reportRead();
    return super.userMetrics;
  }

  @override
  set userMetrics(List<UserMetricEntity> value) {
    _$userMetricsAtom.reportWrite(value, super.userMetrics, () {
      super.userMetrics = value;
    });
  }

  final _$getUserMetricsMethodAsyncAction =
      AsyncAction('_ProfileControllerBase.getUserMetricsMethod');

  @override
  Future<void> getUserMetricsMethod(String userId) {
    return _$getUserMetricsMethodAsyncAction
        .run(() => super.getUserMetricsMethod(userId));
  }

  @override
  String toString() {
    return '''
userMetrics: ${userMetrics}
    ''';
  }
}
