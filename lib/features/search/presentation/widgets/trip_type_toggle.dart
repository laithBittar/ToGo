import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../logic/search_bloc.dart';
import '../../logic/search_event.dart';
import '../../logic/search_state.dart';

class TripTypeToggle extends StatelessWidget {
  const TripTypeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final isVip = state.searchModel.isVip;
        
        return Container(
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              _buildToggleButton(
                context: context,
                label: AppStrings.normal,
                isSelected: !isVip,
                onTap: () => context.read<SearchBloc>().add(const UpdateTripTypeEvent(false)),
              ),
              _buildToggleButton(
                context: context,
                label: AppStrings.vip,
                isSelected: isVip,
                onTap: () => context.read<SearchBloc>().add(const UpdateTripTypeEvent(true)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildToggleButton({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryYellow : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: FittedBox( 
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : AppColors.textGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}