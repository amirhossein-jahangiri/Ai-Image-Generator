import '/utils/imports.dart';


/// A reusable and customizable horizontal TabBar widget built with a TabController and dynamic tabs.
///
/// This widget displays a titled section ("SUGGESTS") followed by a horizontally scrollable TabBar.
/// It supports:
/// - Dynamic tabs passed from the parent widget
/// - Customized styling including colors, paddings, and a rounded background indicator
/// - Smooth scrolling and responsive spacing based on screen size utilities
///
/// The parent widget is responsible for managing the TabController.
/// Ideal for scenarios where the list of tabs and control over them is centralized in the parent.

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  final TabController tabController;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// title
        Text(
          AppConstants.SUGGESTS,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        /// custom tab bar
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: ScreenSize().getHeightPercentage(1),
          ),
          child: TabBar(
            controller: tabController,
            tabs: tabs,
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.only(
              left: ScreenSize().getWidthPercentage(2),
            ),
            tabAlignment: TabAlignment.start,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.2),
            ),
            dividerColor: Colors.transparent,
            indicatorPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            isScrollable: true,
            physics: BouncingScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
