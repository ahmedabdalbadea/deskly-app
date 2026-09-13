import 'package:deskly_app/core/widget/gradient_button.dart';
import 'package:flutter/material.dart';

import 'widget/workspace_details_body.dart';

class WorkspaceDetailsView extends StatelessWidget {
  const WorkspaceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(top: false, child: WorkspaceDetailsBody()),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
        child: SizedBox(
          height: 60,
          child: GradientButton(
            title: "Book Now",
            radius: 14,
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }
}
