import 'package:blood_buddy/config/constants/color_constants.dart';
import 'package:blood_buddy/features/home/presentation/view/bottom_view/campaigns_page.dart';
import 'package:blood_buddy/core/common/widgets/campaign_card.dart';
import 'package:flutter/material.dart';

class CampaignList extends StatelessWidget {
  final String title;
  final List<Campaign> campaigns;

  const CampaignList({
    required this.title,
    required this.campaigns,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
           child: Row(
            children: [
              const Icon(
                Icons.campaign,
                color: AppColors.mainBlackColor, // Replace with your desired icon color
              ),
              const SizedBox(width: 8.0),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: "Raleway Regular",
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: campaigns.length,
          itemBuilder: (context, index) {
            final campaign = campaigns[index];
            return CampaignCard(
              campaign: campaign,
            );
          },
        ),
      ],
    );
  }
}