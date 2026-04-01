import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class TripStatusSection extends StatelessWidget {
  const TripStatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: AppColors.cardBg, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          _buildRow("محجوز بانتظار التثبيت", Icons.hourglass_empty_rounded, isBold: true),
          const Divider(height: 20, color: Colors.white10),
          _buildRow("يرجى تأكيد الحجز خلال 3 ساعات لتفادي الإلغاء التلقائي.", Icons.info_outline_rounded),
        ],
      ),
    );
  }

  Widget _buildRow(String text, IconData icon, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(child: Text(text, style: TextStyle(color: isBold ? AppColors.primaryYellow : AppColors.textWhite, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, fontFamily: 'Cairo', fontSize: 12), textAlign: TextAlign.right)),
        const SizedBox(width: 10),
        Icon(icon, color: AppColors.primaryYellow, size: 18),
      ],
    );
  }
}