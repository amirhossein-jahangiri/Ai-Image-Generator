import 'package:ai_image_generator/utils/constants.dart';
import 'package:ai_image_generator/utils/size_config.dart';
import 'package:ai_image_generator/utils/theme_config.dart';
import 'package:ai_image_generator/view/home/widgets/custom_tabbar.dart';
import 'package:ai_image_generator/view/home/widgets/custom_tabbar_view.dart';
import 'package:ai_image_generator/view/home/widgets/custom_tabs.dart';
import 'package:ai_image_generator/view/home/widgets/fancy_box.dart';
import 'package:ai_image_generator/view/home/widgets/fancy_box_row.dart';
import 'package:ai_image_generator/view/home/widgets/header_slider.dart';
import 'package:ai_image_generator/view/home/widgets/previous_requests.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const List<String> imagePath = const [
    'assets/images/AI-1.webp',
    'assets/images/AI-2.jpg',
    'assets/images/AI-3.png',
    'assets/images/AI-4.jpg',
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  final List<Tab> _tabs = [
    Tab(child: CustomTabs()),
    Tab(child: CustomTabs()),
    Tab(child: CustomTabs()),
    Tab(child: CustomTabs()),
    Tab(child: CustomTabs()),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      appBar: AppBar(title: Text(AppConstants.APP_TITLE)),
      drawer: Drawer(),

      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenSize().getWidthPercentage(3),
        ),
        children: [

          /// header slider and swipe horizontally images or banners
          /// called provider to change / trigger current slider index
          HeaderSlider(),

          /// FancyBoxRow displays several custom FancyBox widgets in a structured layout.
          /// It shows two small boxes on the left, one tall box on the right, and a full-width box below.
          /// Used to present main features like Text-to-Speech, Image Generation, and Chat Bot.
          FancyBoxRow(),

          /// A horizontal scrollable list showing styled cards of previous user requests.
          /// Each card includes a title and a description with a bottom gradient overlay.
          PreviousRequests(),

          /// A horizontally scrollable TabBar with custom styling and dynamic tabs.
          /// Used for navigating between different content sections, such as suggestions or categories.
          /// The TabController is managed by the parent widget.
          CustomTabBar(tabController: _tabController, tabs: _tabs),

          /// A custom TabBarView that displays a scroll-disabled list for each tab.
          /// Takes a TabController to manage the tab views.
          CustomTabBarView(tabController: _tabController),
        ],
      ),
    );
  }
}