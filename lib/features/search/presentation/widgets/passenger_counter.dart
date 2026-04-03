import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class PassengerCounter extends StatelessWidget {
  final int count;
  final Function(int) onUpdate;

  const PassengerCounter({super.key, required this.count, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // شلنا const من هون لأنها بتستخدم AppColors.textWhite اللي صار متغير
        Text(
          "مسافر", 
          style: TextStyle(
            color: AppColors.textWhite, 
            fontWeight: FontWeight.bold, 
            fontSize: 16, 
            fontFamily: 'Cairo'
          )
        ),
        const Spacer(), // هي بتضل const عادي لأن ما فيها ألوان
        _counterBtn(Icons.remove, () => count > 1 ? onUpdate(count - 1) : null),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "$count", 
            style: TextStyle( // شلنا const من هون
              color: AppColors.textWhite, 
              fontSize: 18, 
              fontWeight: FontWeight.bold
            )
          ),
        ),
        _counterBtn(Icons.add, () => onUpdate(count + 1)),
      ],
    );
  }

  Widget _counterBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white10), 
          borderRadius: BorderRadius.circular(8)
        ),
        child: Icon(icon, color: AppColors.textWhite, size: 18), // شلنا const من هون
      ),
    );
  }
}