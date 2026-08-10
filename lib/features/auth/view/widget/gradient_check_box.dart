import 'package:deskly_app/constants.dart';
import 'package:deskly_app/core/theme/app_gradients.dart';
import 'package:flutter/material.dart';

class GradientCheckBox extends StatefulWidget {
  const GradientCheckBox({super.key});

  @override
  State<GradientCheckBox> createState() => _GradientCheckBoxState();
}

class _GradientCheckBoxState extends State<GradientCheckBox> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _checked = !_checked;
        });
      },

      child: AnimatedContainer(
        duration: kAnimationDuration,
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: _checked ? Colors.transparent : const Color(0xFF000000),
          ),
          gradient: _checked ? AppGradients.primary : null,
        ),

        child: _checked
            ? Icon(Icons.check, size: 14, color: Colors.white)
            : null,
      ),
    );
  }
}
