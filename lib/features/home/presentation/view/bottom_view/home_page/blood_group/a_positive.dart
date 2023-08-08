import '../../../../../../../core/common/widgets/api_provider.dart';
import '../../../../../../../core/common/widgets/blood_donor_response.dart';
import '../../../../../../../core/common/widgets/default_card.dart';
import 'package:flutter/material.dart';

class APositive extends StatefulWidget {
  const APositive({Key? key}) : super(key: key);

  @override
  State<APositive> createState() => _APositiveState();
}

class _APositiveState extends State<APositive> {
  // final APIProvider _apiProvider = APIProvider();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DonorResponse?>(
        // future: _apiProvider.getAPositiveDonors(),
        builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return const Center(
            child: CircularProgressIndicator(),
          );
        default:
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.data == null) {
            // If the future completes, but there's no data, handle this case as needed.
            return Text('No data available');
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
