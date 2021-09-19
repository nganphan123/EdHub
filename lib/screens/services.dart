import 'package:flutter/material.dart';
import 'package:htn2021/home/home_page.dart';
import 'package:htn2021/themes/colors.dart';
import '../profile/profile.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'unsupported.dart';

const List<IconData> icons = [
  Icons.home,
  Icons.school,
  Icons.summarize,
  Icons.person,
];

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen>
    with SingleTickerProviderStateMixin {
  final List<Widget> serviceScreens = [
    HomePageView(),
    ProfileView(),
    UnSupportedView(),
    UnSupportedView(),
  ];

  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: serviceScreens.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: serviceScreens,
        controller: _tabController,
      ),
      bottomNavigationBar: ConvexAppBar(
        items: icons.map((icon) => TabItem(icon: icon)).toList(),
        backgroundColor: mediumBlue,
        height: 65.0,
        elevation: 0,
        style: TabStyle.reactCircle,
        controller: _tabController,
        disableDefaultTabController: true,
      ),
    );
  }
}
