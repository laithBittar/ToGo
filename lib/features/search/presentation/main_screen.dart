import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/search_screen.dart'; 
import 'screens/my_trips_screen.dart'; 
import '../logic/search_bloc.dart';
import '../../../../core/theme/app_colors.dart';    
class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(2); 
  void changeTab(int index) => emit(index);
}
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavCubit()),
        BlocProvider(create: (context) => SearchBloc()), 
      ],
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            backgroundColor: const Color(0xFF121212),
            body: IndexedStack(
              index: currentIndex,
              children: const [
                Center(child: Text("صفحة القائمة", style: TextStyle(color: Colors.white, fontFamily: 'Cairo'))), // Index 0
                MyTripsScreen(), // Index 1
                SearchScreen(),  // Index 2
              ],
            ),
            bottomNavigationBar: _buildBottomNav(context),
          );
        },
      ),
    );
  }
  // بناء الشريط السفلي
  Widget _buildBottomNav(BuildContext context) {
    final currentIndex = context.watch<BottomNavCubit>().state;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xFF1C1C1E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navItem(context, 0, Icons.menu, "القائمة", currentIndex),
          _navItem(context, 1, Icons.airplane_ticket, "رحلاتي", currentIndex),
          _navItem(context, 2, Icons.search, "بحث", currentIndex),
        ],
      ),
    );
  }

  // تصميم أيقونات الشريط السفلي
  Widget _navItem(BuildContext context, int index, IconData icon, String title, int currentIndex) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => context.read<BottomNavCubit>().changeTab(index),
      child: Container(
        color: Colors.transparent, 
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected ? AppColors.primaryYellow : Colors.grey, size: 24),
            const SizedBox(height: 4),
            Text(
              title, 
              style: TextStyle(
                color: isSelected ? AppColors.primaryYellow : Colors.grey, 
                fontSize: 10, 
                fontFamily: 'Cairo', 
                fontWeight: isSelected ? FontWeight.bold : null
              )
            ),
          ],
        ),
      ),
    );
  }
}