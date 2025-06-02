import '/utils/imports.dart';

/// A stateless widget that renders a TabBarView with multiple scroll-locked tab contents.
///
/// This widget receives a [TabController] from its parent to synchronize
/// the tabs and tab views. It generates a list of content views dynamically
/// based on the number of tabs.
///
/// - [tabController]: The controller that manages tab switching and indexing.
///
/// The content for each tab is a scroll-disabled vertical list containing 10 placeholder items.
///
/// Example usage:
/// ```dart
/// CustomTabBarView(tabController: _tabController);
/// ```


class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({super.key, required this.tabController});

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize().getHeightPercentage(100),
      child: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          tabController!.length,
          (index) => _buildTabContent(),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    return ListView.builder(
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Container(
          height: ScreenSize().getHeightPercentage(8),
          margin: EdgeInsets.symmetric(vertical: 6),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              ScreenSize().getBorderRadius(1),
            ),
            color: AppColors.card,
          ),
          child: Text(
            index.toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
