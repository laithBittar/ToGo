import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../logic/search_bloc.dart';
import '../../logic/search_event.dart';
import '../../logic/search_state.dart';
import 'info_selection_box.dart';   
import 'passenger_counter.dart';

class DatePassengersPicker extends StatelessWidget {
  const DatePassengersPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final model = state.searchModel;

        return Column(
          children: [
            // استخدام القطعة المنفصلة للتاريخ
            InfoSelectionBox(
              icon: Icons.calendar_today,
              title: "تاريخ الرحلة",
              content: Text(
                model.tripDate == null ? "اختر التاريخ" : DateFormat('yyyy-MM-dd').format(model.tripDate!),
                style:  TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              onTap: () => _selectDate(context, model.tripDate),
            ),
            
            const SizedBox(height: 12),

            // استخدام القطعة المنفصلة للركاب
            InfoSelectionBox(
              icon: Icons.group,
              title: "عدد المسافرين",
              content: PassengerCounter(
                count: model.passengersCount,
                onUpdate: (val) {
                  if (val >= 1) context.read<SearchBloc>().add(UpdatePassengersEvent(val));
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context, DateTime? current) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: current ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year, DateTime.now().month + 1, DateTime.now().day),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme:  ColorScheme.dark(primary: AppColors.primaryYellow, onPrimary: Colors.black, surface: AppColors.cardBg),
        ),
        child: child!,
      ),
    );
    if (picked != null) context.read<SearchBloc>().add(UpdateDateEvent(picked));
  }
}