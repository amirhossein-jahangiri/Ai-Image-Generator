import 'generator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'utils/size_config.dart';
import 'custom_textfield.dart';
import 'searchable_prompt_list.dart';

class AiGeneratorScreen extends StatefulWidget {
  const AiGeneratorScreen({super.key});

  @override
  State<AiGeneratorScreen> createState() => _AiGeneratorScreenState();
}

class _AiGeneratorScreenState extends State<AiGeneratorScreen> {
  final TextEditingController _searchBoxController = TextEditingController();

  Future<dynamic> showPromptBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SearchablePromptList();
      },
    );
  }

  void showCustomSnackBar(BuildContext context, String content) {
    final _snackBar = SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(content, style: TextStyle(color: Colors.white)),
    );
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }

  Future<void> generateImagePress(BuildContext context) async {
    String prompt = _searchBoxController.text;
    if (prompt.isEmpty) {
      return showCustomSnackBar(
        context,
        'Please enter a prompt before generating an image.',
      );
    }
    context.read<GeneratorProvider>().generateImageFromPrompt(prompt);
  }

  Future<void> saveImagePress() async {
    final imageProvider = context.read<GeneratorProvider>();
    if(imageProvider.imageSrc!.isEmpty) return;
    bool success = await imageProvider.saveImage();
    if(success) {
      showCustomSnackBar(context, imageProvider.message!);
    } else {
      showCustomSnackBar(context, imageProvider.message!);
    }
  }

  Future<void> navigateToWebSite() async {
    final call = Uri.parse('https://iamjahangiri.ir/');
    if (await canLaunchUrl(call)) {
      await launchUrl(call, mode: LaunchMode.platformDefault);
    } else {
      showCustomSnackBar(context, 'Could not launch $call');
    }
  }


  @override
  void initState() {
    _searchBoxController.addListener(() {

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        final generateImage = context.read<GeneratorProvider>();
        if(generateImage.requestStatus != RequestStatus.idle) {
          generateImage.resetStatus();
        }
      },);


    },);
    super.initState();
  }


  @override
  void dispose() {
    _searchBoxController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showPromptBottomSheet(context),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        label: Row(
          children: [
            Text('Image Prompts'),
            SizedBox(width: ScreenSize().getWidthPercentage(1)),
            Icon(Icons.open_in_browser),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'AI Image Generator',
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenSize().getFontSize(5.5),
          ),
        ),
        actions: [
          IconButton(
            onPressed: navigateToWebSite,
            icon: Icon(
              Icons.language,
              color: Colors.white,
              size: ScreenSize().getWidthPercentage(7.2),
            ),
          ),
        ],
      ),

      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: ScreenSize().getWidthPercentage(4),
          vertical: ScreenSize().getHeightPercentage(2),
        ),
        children: [
          Text(
            'Enter a description of the image you want to generate.'
            'Be as detailed as possible for better results!',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.black,
              fontSize: ScreenSize().getFontSize(4),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              vertical: ScreenSize().getHeightPercentage(1),
            ),
            child: CustomTextField(
              controller: _searchBoxController,
              maxLines: 3,
              hintText:
                  'Example: a futuristic cityscape at sunset with flying cars and neon lights',
            ),
          ),

          Selector<GeneratorProvider, RequestStatus>(
            selector: (context, imageStatus) => imageStatus.requestStatus,
            builder: (context, status, child) {
              String textButton =
                  status == RequestStatus.success
                      ? 'Save Image'
                      : 'Generate Image';

              return ElevatedButton(
                onPressed: () => status == RequestStatus.success
                            ? saveImagePress()
                            : generateImagePress(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      ScreenSize().getBorderRadius(2),
                    ),
                  ),
                ),
                child: Text(
                  textButton,
                  style: TextStyle(
                    fontSize: ScreenSize().getWidthPercentage(4),
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),

          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: ScreenSize().getHeightPercentage(1),
            ),

            child: Consumer<GeneratorProvider>(
              builder: (context, image, child) {
                switch (image.requestStatus) {
                  case RequestStatus.idle:
                    return SizedBox.shrink();
                  case RequestStatus.loading:
                    return Center(
                      child: CircularProgressIndicator(color: Colors.blue),
                    );
                  case RequestStatus.success:
                    return Image.memory(image.imageSrc!);
                  case RequestStatus.error:
                    return Center(child: Text(image.message!));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
