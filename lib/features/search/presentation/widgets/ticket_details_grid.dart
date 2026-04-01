import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class TicketDetailsGrid extends StatelessWidget {
  final String date, time, passengers;
  const TicketDetailsGrid({super.key, required this.date, required this.time, required this.passengers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _item(Icons.access_time, "الوقت", time),
          const SizedBox(width: 30),
          _item(Icons.calendar_today, "التاريخ", date),
        ]),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _item(Icons.credit_card, "المبلغ", "65,000 ل.س"),
          const SizedBox(width: 30),
          _item(Icons.person, "المسافرين", "$passengers أشخاص"),
        ]),
      ],
    );
  }

  Widget _item(IconData icon, String label, String val) => Row(
    children: [
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11, fontFamily: 'Cairo')),
        Text(val, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'Cairo')),
      ]),
      const SizedBox(width: 8),
      Icon(icon, color: AppColors.primaryYellow, size: 22),
    ],
  );
}