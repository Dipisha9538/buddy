import 'package:blood_buddy/config/constants/color_constants.dart';
import 'package:blood_buddy/core/common/widgets/med_text.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  // ignore: use_key_in_widget_constructors
  const ExpandableTextWidget({Key? key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddentext = true;

  double textHeight = 100;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(
          textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 1000,
        child: secondHalf.isEmpty
            ? MedText(text: firstHalf)
            : Column(
                children: [
                  MedText(
                      text: hiddentext ? ("$firstHalf...") : (firstHalf + secondHalf)),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddentext = !hiddentext;
                      });
                    },
                    child: Row(
                      children: [
                        MedText(
                          text: hiddentext ? "Show more" : "Show less",
                          color: AppColors.mainColor,
                        ),
                        Icon(
                          hiddentext ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
