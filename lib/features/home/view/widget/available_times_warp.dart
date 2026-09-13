import 'package:deskly_app/features/home/view/widget/available_time_item.dart';
import 'package:flutter/material.dart';

class AvailableTimesWarp extends StatelessWidget {
  const AvailableTimesWarp({super.key});
  final List<String> times = const [
    '8:00 AM',
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '2:00 PM',
    '5:00 PM',
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(times.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 6, bottom: 6),
          child: AvailableTimeItem(time: times[index]),
        );
      }),
    );
  }
}
