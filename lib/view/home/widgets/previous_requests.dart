import '/utils/imports.dart';



/// This widget displays a horizontal list of previous user requests
/// in a styled scrollable card layout.
/// Each card includes a title and a description. A gradient overlay at the
/// bottom of each card
/// gives a visual indication that more content is present but hidden.
/// Useful for showcasing recent user interactions or prompt history in a compact UI.

class PreviousRequests extends StatelessWidget {
  const PreviousRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppConstants.PREVIOUS_REQUESTS,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        SizedBox(
          height: ScreenSize().getHeightPercentage(15),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            padding: EdgeInsets.symmetric(
              vertical: ScreenSize().getHeightPercentage(1),
            ),
            itemBuilder: (context, index) {
              return Container(
                height: ScreenSize().getHeightPercentage(15),
                width: ScreenSize().getWidthPercentage(50),
                margin: EdgeInsets.only(
                  left: ScreenSize().getWidthPercentage(2),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize().getWidthPercentage(1),
                  vertical: ScreenSize().getHeightPercentage(0.5),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    ScreenSize().getBorderRadius(2),
                  ),
                  color: AppColors.card,
                ),
                child: Stack(
                  children: [

                    Positioned.fill(
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'عنوان',
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),

                            SizedBox(
                              height: ScreenSize().getHeightPercentage(0.5),
                            ),

                            Text(
                              'متن تست برای این قسمت از برنامه که من توسعه دادمش میخوام ببینم چطوری کار میکنه',
                              textAlign: TextAlign.justify,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: ScreenSize().getHeightPercentage(6),
                      child: IgnorePointer(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff121212).withValues(alpha: 0.2),
                                Color(0xff121212).withValues(alpha: 0.6),
                                Color(0xff121212).withValues(alpha: 0.8),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
