import 'package:flutter/material.dart';

class NearbyWorkspaceViewBody extends StatelessWidget {
  const NearbyWorkspaceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          'Nearby Workspaces',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Center(child: Text('Nearby workspaces will appear here')),
      ],
    );
  }
}
