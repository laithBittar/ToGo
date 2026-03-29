import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../logic/search_bloc.dart';
import '../../logic/search_event.dart';
import '../../logic/search_state.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector({super.key});

  @override
  Widget build(BuildContext context) {
    //   مشان نحدث النصوص (من و إلى) لما تتغير بالبلوك
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.centerLeft,    
          children: [
            // حاوية الحقول (من وإلى)
            Column(
              children: [
                _buildLocationField(
                  icon: Icons.location_on_outlined,
                  label: AppStrings.from,
                  city: state.searchModel.fromCity,
                  onTap: () {
                    //    قائمة اختيار المدن
                  },
                ),
                const SizedBox(height: 8),     
                _buildLocationField(
                  icon: Icons.navigation_outlined,
                  label: AppStrings.to,
                  city: state.searchModel.toCity,
                  onTap: () {
                    //  وجهة السفر
                  },
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: GestureDetector(
                onTap: () {
                  //  حدث التبديل للبلوك
                  context.read<SearchBloc>().add(SwapCitiesEvent());
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryYellow,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.swap_vert, color: Colors.black, size: 28),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  //   لبناء شكل الحقل 
  Widget _buildLocationField({
    required IconData icon,
    required String label,
    required String city,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryYellow),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: AppColors.textGrey, fontSize: 12)),
                Text(city, style: const TextStyle(color: AppColors.textWhite, fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down, color: AppColors.textGrey),
          ],
        ),
      ),
    );
  }
}