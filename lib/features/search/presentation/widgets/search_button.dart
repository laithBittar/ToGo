// features/search/presentation/widgets/search_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_utils.dart';
import '../../logic/search_bloc.dart';
import '../../logic/search_state.dart';
import '../main_screen.dart';       

class SearchButton extends StatefulWidget {
  const SearchButton({super.key});

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  bool _isLoading = false; // المتغير المسؤول عن إظهار التحميل

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) => ElevatedButton(
        // إذا عم يحمل، منوقف الضغط عشان ما يتدبل الحجز
        onPressed: _isLoading ? null : () async {
          final model = state.searchModel;
          
          if (model.fromCity.isEmpty || model.toCity.isEmpty) {
            AppUtils.showError(context, "يرجى تحديد الانطلاق والوجهة");
          } else if (model.tripDate == null) {
            AppUtils.showError(context, "يرجى اختيار التاريخ");
          } else {
            // 1. تشغيل دائرة التحميل
            setState(() => _isLoading = true);
            
            // 2. تأخير وهمي لمدة ثانيتين (Fake Loading)
            await Future.delayed(const Duration(seconds: 2));
            
            // 3. إيقاف التحميل والانتقال للصفحة التانية
            if (mounted) {
              setState(() => _isLoading = false);
              context.read<BottomNavCubit>().changeTab(1);
              
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("تم إضافة الرحلة لجدولك", style: TextStyle(fontFamily: 'Cairo')),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 1),
                ),
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryYellow,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        // 4. تبديل محتوى الزر بين النص ودائرة التحميل
        child: _isLoading
            ? const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(color: Colors.black, strokeWidth: 3),
              )
            : const Text(
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