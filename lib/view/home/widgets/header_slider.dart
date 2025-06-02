import '/utils/imports.dart';
import '../home_screen.dart';
import '/viewmodel/home_viewmodel.dart';

import 'package:provider/provider.dart';



/// This widget displays a header slider with multiple images or banners,
/// allowing users to swipe horizontally. It is typically used at the top
/// of the screen.

class HeaderSlider extends StatefulWidget {
  const HeaderSlider({super.key});

  @override
  State<HeaderSlider> createState() => _HeaderSliderState();
}

class _HeaderSliderState extends State<HeaderSlider> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: ScreenSize().getHeightPercentage(4),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [

          /// images or banners
          SizedBox(
            height: ScreenSize().getHeightPercentage(15),
            child: PageView.builder(
              itemCount: HomeScreen.imagePath.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: (int index) {
                context.read<HomeViewModel>().triggerHeaderSlider(index);
              },
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(
                    ScreenSize().getBorderRadius(2),
                  ),
                  child: Image.asset(
                    HomeScreen.imagePath[index],
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
          ),


          /// indicators for swipe images or banners
          /// with Selector method and use provider to change / trigger
          /// current slider index
          Positioned(
            bottom: ScreenSize().getHeightPercentage(-2),
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(HomeScreen.imagePath.length, (index) {
                return Selector<HomeViewModel, int>(
                  selector: (context, currentIndex) => currentIndex.currentSliderIndex,
                  builder: (context, currentIndex, child) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: ScreenSize().getWidthPercentage(2),
                      width: currentIndex == index
                          ? ScreenSize().getWidthPercentage(4)
                          : ScreenSize().getWidthPercentage(2),
                      margin: EdgeInsets.only(
                        left: ScreenSize().getWidthPercentage(0.5),
                      ),
                      decoration: BoxDecoration(
                        color:
                        currentIndex == index
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.secondary
                            .withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(
                          ScreenSize().getBorderRadius(30),
                        ),
                      ),
                    );
                  }
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}