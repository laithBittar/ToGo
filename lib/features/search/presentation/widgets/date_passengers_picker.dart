import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../logic/search_bloc.dart';
import '../../logic/search_state.dart';

class DatePassengersPicker extends StatelessWidget {
  const DatePassengersPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Column(
          children: [
            // حقل التاريخ
            _buildPickerField(
              context: context,
              icon: Icons.calendar_today_outlined,
              label: AppStrings.tripDate,
              value: state.searchModel.tripDate,
              onTap: () {
                //   اختيار التاريخ 
              },
            ),

            const SizedBox(height: 12),    

            //  حقل عدد المسافرين
            _buildPickerField(
              context: context,
              icon: Icons.person_outline,
              label: AppStrings.passengers,
              value: "${state.searchModel.passengersCount}",
              onTap: () {
                //   اختيار عدد المسافرين 
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildPickerField({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity, 
        padding: const EdgeInsets.all(15),   
        decoration: BoxDecoration(
          color: AppColors.cardBg, 
          borderRadius: BorderRadius.circular(15), 
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryYellow, size: 22),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label, 
                  style: const TextStyle(color: AppColors.textGrey, fontSize: 11)
                ),
                Text(
                  value, 
                  style: const TextStyle(
                    color: AppColors.textWhite, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 16
                  )
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down, color: AppColors.textWhite, size: 20),
          ],
        ),
      ),
    );
  }
}