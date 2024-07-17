import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/treatment_provider.dart';


class TreatmentScreen extends StatelessWidget {
  static const routeName = '/treatments';

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<authprovider>(context, listen: false);
    final token = authProvider.tocken;

    return Scaffold(
      appBar: AppBar(
        title: Text('Treatments'),
      ),
      body: FutureBuilder(
        future: Provider.of<treatment_provider>(context, listen: false).fetch_treatment(token),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return Center(child: Text('An error occurred!'));
          } else {
            return Consumer<treatment_provider>(
              builder: (ctx, treatmentProvider, child) => ListView.builder(
                itemCount: treatmentProvider.treatment.length,
                itemBuilder: (ctx, index) {
                  final treatment = treatmentProvider.treatment[index];
                  return ListTile(
                    title: Text(treatment.name),
                    subtitle: Text('Duration: ${treatment.duration}\nPrice: ${treatment.price}'),
                    isThreeLine: true,
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}