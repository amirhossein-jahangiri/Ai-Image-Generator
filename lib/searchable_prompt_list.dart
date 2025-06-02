import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'utils/constants.dart';
import 'custom_textfield.dart';
import 'utils/size_config.dart';

class SearchablePromptList extends StatefulWidget {
  const SearchablePromptList({super.key});

  @override
  State<SearchablePromptList> createState() => _SearchablePromptListState();
}

class _SearchablePromptListState extends State<SearchablePromptList> {
  final TextEditingController _promptSearchController = TextEditingController();

  List<String> filteredPrompts = [];

  void init() {
    filteredPrompts = List.from(aiPrompts);

    _promptSearchController.addListener(() {
      final query = _promptSearchController.text.toLowerCase();
      setState(() {
        if (query.isEmpty) {
          filteredPrompts = List.from(aiPrompts);
        } else {
          filteredPrompts = aiPrompts.where((thisPrompt) {
            return thisPrompt.toLowerCase().contains(query);
          }).toList();
        }
      });
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    _promptSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize().getHeightPercentage(65),
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: ScreenSize().getHeightPercentage(2),
        horizontal: ScreenSize().getWidthPercentage(3),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            fit: StackFit.passthrough,
            children: [
              Text(
                'Search Prompts',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenSize().getFontSize(4.5),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: Colors.grey.shade400),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              vertical: ScreenSize().getHeightPercentage(2),
            ),
            child: CustomTextField(
              controller: _promptSearchController,
              maxLines: 1,
              hintText: 'Search Box',
            ),
          ),

          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: ListView.separated(
                itemCount: filteredPrompts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      filteredPrompts[index],
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: ScreenSize().getFontSize(4.5),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: filteredPrompts[index]),
                        );
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.blue,
                        highlightColor: Colors.white30,
                      ),
                      icon: Icon(Icons.copy, color: Colors.white),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
