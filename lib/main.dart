import 'package:flutter/material.dart';
import 'features/search/presentation/screens/search_screen.dart';

void main() {
  runApp(const TogoApp());
}

class TogoApp extends StatelessWidget {
  const TogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // شيل علامة الـ Debug الحمراء
      title: 'TOGO App',
      theme: ThemeData(
        fontFamily: 'Cairo', // اختياري: لو حابب تستخدم خط عربي مرتب مثل Cairo
      ),
      home: const SearchScreen(), // هون بننادي الشاشة اللي برمجناها
    );
  }
}