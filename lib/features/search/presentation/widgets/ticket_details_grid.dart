import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class TicketDetailsGrid extends StatelessWidget {
  final String date, time, passengers;
  const TicketDetailsGrid({super.key, required this.date, required this.time, required this.passengers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // السطر الأول: الوقت والتاريخ
        Row(
          children: [
            Expanded(child: _item(Icons.access_time, "الوقت", time)),
            const SizedBox(width: 10), // مسافة صغيرة مرنة
            Expanded(child: _item(Icons.calendar_today, "التاريخ", date)),
          ],
        ),
        const SizedBox(height: 15),
        // السطر الثاني: المبلغ والركاب
        Row(
          children: [
            Expanded(child: _item(Icons.credit_card, "المبلغ", "65,000 ل.س")),
            const SizedBox(width: 10),
            Expanded(child: _item(Icons.person, "المسافرين", "$passengers أشخاص")),
          ],
        ),
      ],
    );
  }

  Widget _item(IconData icon, String label, String val) => Container(
    // إضافة Padding بسيط عشان العناصر ما تلزق ببعض بالشاشات الضيقة
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end, // للحفاظ على الاتجاه العربي
      children: [
        Expanded( // لجعل النصوص مرنة داخل الآيتم نفسه
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.grey, fontSize: 10, fontFamily: 'Cairo'),
                maxLines: 1,
              ),
              FittedBox( 
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerRight,
                child: Text(
                  val,
                  style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Icon(icon, color: AppColors.primaryYellow, size: 20),
      ],
    ),
  );
}