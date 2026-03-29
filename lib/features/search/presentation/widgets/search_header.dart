import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 50, 15, 10),
      padding: const EdgeInsets.fromLTRB(25, 30, 20, 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryYellow,
        borderRadius: BorderRadius.circular(25), 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.rotate(
            angle: -0.07,
            alignment: Alignment.centerLeft,
            child: const Text(
              "TOGO",
              style: TextStyle(
                color: Colors.black,
                fontSize: 55,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                height: 1.0,
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "أفضل الأسعار وأسرع الرحلات بكل المحافظات",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
