import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/branch_provider.dart';

class BranchPage extends StatelessWidget {
  static const routeName = '/branches';

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<authprovider>(context, listen: false);
    final token = authProvider.tocken;

    return Scaffold(
      appBar: AppBar(
        title: Text('Branches'),
      ),
      body: FutureBuilder(
        future: Provider.of<branch_provider>(context, listen: false).fetch_branch(token),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return Center(child: Text('An error occurred!'));
          } else {
            return Consumer<branch_provider>(
              builder: (ctx, branchProvider, child) => ListView.builder(
                itemCount: branchProvider.branches.length,
                itemBuilder: (ctx, index) {
                  final branch = branchProvider.branches[index];
                  return ListTile(
                    title: Text(branch.name),
                    subtitle: Text('Location: ${branch.location}'
                        '\nPhone: ${branch.phone}'
                        '\nPatients: ${branch.patientsCount}'),
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