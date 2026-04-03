import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // ضفنا مكتبة البلوك
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:togo/core/theme/app_colors.dart'; // ملف الألوان تبعك
import 'package:togo/features/search/logic/theme_cubit.dart';
import 'package:togo/features/search/presentation/main_screen.dart';

void main() {
  runApp(const ToGoApp());
}

class ToGoApp extends StatelessWidget {
  const ToGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // تعريف الثيم كيوبيت ليكون متاحاً لكل التطبيق
        BlocProvider(create: (context) => ThemeCubit()),
        // فيك تضيف باقي البلوكات هون مستقبلاً:
        // BlocProvider(create: (context) => SearchBloc()),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    // البناء بناءً على حالة الثيم (true = dark, false = light)
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDark) {
        
        // التكتيك السحري: تحديث قيمة المتغير بملف الألوان فوراً
        AppColors.isDarkMode = isDark;

        return MaterialApp(
          // الـ ValueKey ضروري عشان فلاتر "ينفض" الواجهة نفض بالألوان الجديدة
          key: ValueKey(isDark), 
          debugShowCheckedModeBanner: false,
          title: 'ToGo',

          // --- إعدادات اللغة والاتجاه (RTL) ---
          locale: const Locale('ar', 'AE'),
          supportedLocales: const [Locale('ar', 'AE')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          // --- إعدادات الثيم الذكية ---
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          
          theme: ThemeData(
            fontFamily: 'Cairo',
            brightness: Brightness.light,
            scaffoldBackgroundColor: AppColors.scaffoldBg, // بياخد القيمة الفاتحة تلقائياً
          ),

          darkTheme: ThemeData(
            fontFamily: 'Cairo',
            brightness: Brightness.dark,
            scaffoldBackgroundColor: AppColors.scaffoldBg, // بياخد القيمة الغامقة تلقائياً
          ),

          home: const MainScreen(),
        );
      },
    );
  }
}