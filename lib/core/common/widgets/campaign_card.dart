import 'package:blood_buddy/core/common/snackbar/snackbar.dart';
import 'package:blood_buddy/features/home/presentation/view/bottom_view/campaigns_page.dart';
import 'package:flutter/material.dart';

class CampaignCard extends StatelessWidget {
  final Campaign campaign;

  const CampaignCard({
    required this.campaign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => _buildCampaignDetailsDialog(context, campaign),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              campaign.imageUrl,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    campaign.title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Raleway Regular"
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    campaign.description,
                    style: const TextStyle(fontSize: 16.0, fontFamily: "Raleway Regular"),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => _buildCampaignDetailsDialog(context, campaign),
                          );
                        },
                        child: const Text('View More'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showSnackBar(message: 'Reminder set!!!', context: context, color: Colors.grey);
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.notifications),
                            SizedBox(width: 4.0),
                            Text('Remind Me'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCampaignDetailsDialog(BuildContext context, Campaign campaign) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              campaign.title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Raleway Regular"
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              campaign.description,
              style: const TextStyle(fontSize: 16.0, fontFamily: "Raleway Regular"),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Date: ${campaign.date}',
              style: const TextStyle(fontSize: 14.0, fontFamily: "Raleway Regular"),
            ),
            Text(
              'Time: ${campaign.time}',
              style: const TextStyle(fontSize: 14.0, fontFamily: "Raleway Regular"),
            ),
            Text(
              'Location: ${campaign.location}',
              style: const TextStyle(fontSize: 14.0, fontFamily: "Raleway Regular"),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
