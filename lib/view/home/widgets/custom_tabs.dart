import '/utils/imports.dart';

class CustomTabs extends StatelessWidget {
  const CustomTabs({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Container(
      height: ScreenSize().getHeightPercentage(6),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenSize().getWidthPercentage(3),
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(ScreenSize().getBorderRadius(2)),
      ),
      child: Row(
        children: [
          Icon(Icons.auto_awesome),
          SizedBox(width: ScreenSize().getWidthPercentage(3)),
          Text('مدل', style: Theme.of(context).textTheme.bodySmall,),
        ],
      ),
    );
  }
}
