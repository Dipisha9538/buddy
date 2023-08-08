
import '../../../../../../../core/common/widgets/api_provider.dart';
import '../../../../../../../core/common/widgets/blood_donor_response.dart';
import '../../../../../../../core/common/widgets/default_card.dart';
import 'package:flutter/material.dart';

class BPositive extends StatefulWidget {
  const BPositive({Key? key}) : super(key: key);

  @override
  State<BPositive> createState() => _BPositiveState();
}

class _BPositiveState extends State<BPositive> {
  // final APIProvider _apiProvider = APIProvider();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // future: _apiProvider.getBPositiveDonors(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                final DonorResponse donors = snapshot.data as DonorResponse;
                return donors.data.isEmpty
                    ? const Center(
                        child: Text("Empty"),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: donors.data.length,
                        itemBuilder: (context, index) {
                          return DefaultCard(
                            donors: donors.data[index],
                          );
                        });
              }
          }
        });
  }
}
