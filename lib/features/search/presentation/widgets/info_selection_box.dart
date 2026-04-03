import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class InfoSelectionBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget content;
  final VoidCallback? onTap;

  const InfoSelectionBox({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.fieldBg, // شلنا const من الـ BoxDecoration
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryYellow, size: 22),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title, 
                    style: TextStyle( // شلنا const
                      color: AppColors.textGrey, 
                      fontSize: 11, 
                      fontFamily: 'Cairo'
                    )
                  ),
                  const SizedBox(height: 4),
                  content,
                ],
              ),
            ),
            if (onTap != null) 
              Icon( // شلنا const
                Icons.keyboard_arrow_down, 
                color: AppColors.textWhite, 
                size: 20
              ),
          ],
        ),
      ),
    );
  }
}