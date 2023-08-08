import 'package:blood_buddy/config/constants/color_constants.dart';
import 'package:blood_buddy/core/common/widgets/campaigns_list.dart';
import 'package:flutter/material.dart';

class Campaign {
  final String title;
  final String description;
  final String imageUrl;
  final String date;
  final String time;
  final String location;

  const Campaign({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.time,
    required this.location,
  });
}

class CampaignsPage extends StatelessWidget {
  const CampaignsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event,
              color: AppColors.mainColor,
            ),
          ],
        ),
        title: const Row(
          children: [
            SizedBox(width: 10),
            Text(
              'Campaigns',
              style: TextStyle(
                color: AppColors.mainColor,
                fontFamily: "Raleway Bold",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                CampaignList(
                  title: 'Upcoming Campaigns',
                  campaigns: [
                    Campaign(
                      title: 'Blood Donation Drive',
                      description:
                          'Join us for our annual blood donation drive and help save lives!',
                      imageUrl: 'assets/images/campaigns.png',
                      date: 'August 20, 2023',
                      time: '10:00 AM - 4:00 PM',
                      location: 'City Center',
                    ),
                    Campaign(
                      title: 'Emergency Blood Supply',
                      description:
                          'We urgently need blood donors to meet the high demand for blood in local hospitals.',
                      imageUrl: 'assets/images/donateblood.png',
                      date: 'August 25, 2023',
                      time: '9:00 AM - 5:00 PM',
                      location: 'Tudikhel',
                    ),
                  ],
                ),
                CampaignList(
                  title: 'Ongoing Campaigns',
                  campaigns: [
                    Campaign(
                      title: 'Mobile Blood Bank',
                      description:
                          'Visit our mobile blood bank at various locations and donate blood.',
                      imageUrl: 'assets/images/finddonors.png',
                      date: 'June 30, 2023',
                      time: '11:00 AM - 3:00 PM',
                      location: 'Grande Hospital',
                    ),
                    Campaign(
                      title: 'Community Blood Drive',
                      description:
                          'Join our community blood drive and help us reach our donation goal.',
                      imageUrl: 'assets/images/campaigns.png',
                      date: 'June 29, 2023',
                      time: '8:00 AM - 6:00 PM',
                      location: 'Community Center',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
