import 'package:flutter/material.dart';

import '../../../../../../../core/common/widgets/api_provider.dart';
import '../../../../../../../core/common/widgets/default_card.dart';

class ANegative extends StatefulWidget {
  const ANegative({Key? key}) : super(key: key);

  @override
  State<ANegative> createState() => _ANegativeState();
}

class _ANegativeState extends State<ANegative> {
  // final APIProvider _apiProvider = APIProvider();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        // itemCount: donors.data.length,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Text(
            "data",
            // donors: donors.data[index],
            // donors: donors.data[index],
            // donors: Text("data"),
          );
        });
  }
}
