import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  // الحالة الابتدائية: true يعني Dark Mode
  ThemeCubit() : super(true); 

  // دالة لقلب الثيم
  void toggleTheme() => emit(!state);
}