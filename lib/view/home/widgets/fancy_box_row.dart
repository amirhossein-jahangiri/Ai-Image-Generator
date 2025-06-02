import '/utils/imports.dart';
import 'fancy_box.dart';


/// FancyBoxRow is a custom layout widget that arranges multiple instances of the custom FancyBox widget.
/// It displays a two-column Row where the left column has two stacked FancyBoxes
/// (e.g. "Text to Speech", "Speech to Text"), and the right column has a taller vertical FancyBox
/// (e.g. "Image Generation"). A full-width FancyBox (e.g. "Chat Bot") is placed below the row.
/// This layout is used to showcase key features in an accessible and visually organized manner.


class FancyBoxRow extends StatelessWidget {
  const FancyBoxRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: ScreenSize().getHeightPercentage(2)),
      child: Column(
        children: [

          /// text to speech & speech to text boxes in left
          /// and right has a taller box for image generator
          Row(
            spacing: ScreenSize().getWidthPercentage(2),
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    FancyBox(
                      height: ScreenSize().getHeightPercentage(8),
                      text: AppConstants.TEXT_TO_SPEECH,
                      icon: Icons.favorite,
                      margin: EdgeInsets.only(
                        bottom: ScreenSize().getHeightPercentage(1),
                      ),
                    ),
                    FancyBox(
                      height: ScreenSize().getHeightPercentage(8),
                      text: AppConstants.SPEECH_TO_TEXT,
                      icon: Icons.favorite,
                      margin: EdgeInsets.only(
                        bottom: ScreenSize().getHeightPercentage(1),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FancyBox(
                  height: ScreenSize().getHeightPercentage(17),
                  text: AppConstants.IMAGE_GENERATOR,
                  icon: Icons.star,
                  isVertical: true,
                  margin: EdgeInsets.only(
                    bottom: ScreenSize().getHeightPercentage(1),
                  ),
                ),
              ),
            ],
          ),

          /// a full width box for chat bot
          FancyBox(
            width: double.infinity,
            height: ScreenSize().getHeightPercentage(8),
            text: AppConstants.CHAT_BOT,
            icon: Icons.ac_unit,
          ),
        ],
      ),
    );
  }
}