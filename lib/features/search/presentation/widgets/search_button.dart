// features/search/presentation/widgets/search_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_utils.dart';
import '../../logic/search_bloc.dart';
import '../../logic/search_state.dart';
import '../main_screen.dart';       

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) => ElevatedButton(
        onPressed: () {
          final model = state.searchModel;
          
          if (model.fromCity.isEmpty || model.toCity.isEmpty) {
            AppUtils.showError(context, "يرجى تحديد الانطلاق والوجهة");
          } else if (model.tripDate == null) {
            AppUtils.showError(context, "يرجى اختيار التاريخ");
          } else {
            print("🚀 حجز من ${model.fromCity} إلى ${model.toCity}");
            
            context.read<BottomNavCubit>().changeTab(1);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("تم إضافة الرحلة لجدولك", style: TextStyle(fontFamily: 'Cairo')),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 1),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryYellow,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: const Text(
          "قم بالحجز",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          ),
        ),
      ),
    );
  }
}