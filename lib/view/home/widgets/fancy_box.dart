import '/utils/imports.dart';


class FancyBox extends StatelessWidget {
  const FancyBox({
    super.key,
    required this.text,
    required this.icon,
    this.height,
    this.width,
    this.margin,
    this.isVertical = false,
  });

  final double? height;
  final double? width;
  final String? text;
  final IconData? icon;
  final EdgeInsets? margin;
  final bool? isVertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenSize().getBorderRadius(2)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.9),
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.6),
            Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
          ],
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
          width: ScreenSize().getWidthPercentage(0.5),
        ),
      ),
      child:
      isVertical == true
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: ScreenSize().getHeightPercentage(3),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          const SizedBox(width: 12),
          Text(
            text!,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: ScreenSize().getHeightPercentage(3),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          const SizedBox(width: 12),
          Text(
            text!,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}