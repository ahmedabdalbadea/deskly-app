import 'package:flutter/material.dart';

class WorkspaceDetailsBody extends StatelessWidget {
  const WorkspaceDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Workspace Information',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('Workspace Name'),
            subtitle: const Text('Design Team Alpha'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Members'),
            subtitle: const Text('12 Active Members'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Created On'),
            subtitle: const Text('January 15, 2024'),
          ),
        ],
      ),
    );
  }
}
