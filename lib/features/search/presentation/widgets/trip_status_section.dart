import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class TripStatusSection extends StatelessWidget {
  final String statusText;
  final String noteText;

  const TripStatusSection({
    super.key, 
    this.statusText = "محجوز بانتظار التثبيت",
    this.noteText = "يرجى تأكيد الحجز خلال 3 ساعات لتفادي الإلغاء التلقائي."
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBg, 
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          _buildRow(statusText, Icons.hourglass_empty_rounded, isBold: true),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1, color: Colors.white10),
          ),
          _buildRow(noteText, Icons.info_outline_rounded, isSecondary: true),
        ],
      ),
    );
  }

  Widget _buildRow(String text, IconData icon, {bool isBold = false, bool isSecondary = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,  
      children: [
        // 1. الأيقونة أولاً: عشان تطلع "يمين" بالعربي
        Padding(
          padding: const EdgeInsets.only(top: 2), 
          child: Icon(icon, color: AppColors.primaryYellow, size: 18),
        ),
        
        const SizedBox(width: 12),

        // 2. النص ثانياً: بياخد المساحة المتبقية لليسار
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: isBold ? AppColors.primaryYellow : (isSecondary ? AppColors.textGrey : AppColors.textWhite),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontFamily: 'Cairo',
              fontSize: isBold ? 13 : 11,
              height: 1.4,  
            ),
          ),
        ),
      ],
    );
  }
}