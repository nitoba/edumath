import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/constants.dart';
import '../../../login/domain/entities/user_entity.dart';
import '../controllers/profile_controller.dart';
import '../widgets/functionalities_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/metrics_tile.dart';

class ProfilePage extends StatefulWidget {
  final UserEntity user;
  const ProfilePage({Key key, this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController>
    with TickerProviderStateMixin {
  //use 'controller' variable to access controller
  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    controller.getUserMetricsMethod(widget.user.userId);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverHeaderWidget(
              user: widget.user,
              tabController: tabController,
              goBack: () => Modular.to.pop(),
              logout: () {},
            ),
            SliverFillRemaining(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                controller: tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 42,
                    ),
                    child: Observer(
                      builder: (_) {
                        if (controller.userMetrics != null) {
                          return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return MetricsTile(
                                userMetricEntity: controller.userMetrics[index],
                              );
                            },
                          );
                        }

                        return Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                  FunctionalitiesWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
