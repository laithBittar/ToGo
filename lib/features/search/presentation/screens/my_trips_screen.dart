import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/search_bloc.dart';
import '../../logic/search_state.dart';
import '../widgets/main_trip_card.dart';   

class MyTripsScreen extends StatelessWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final bookingData = state.searchModel;

        return Scaffold(
          backgroundColor: const Color(0xFF121212),
          appBar: AppBar(
            title: const Text("رحلاتي", style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold)),
            backgroundColor: Colors.transparent,
            elevation: 0, centerTitle: true, automaticallyImplyLeading: false,
          ),
          body: bookingData.tripDate == null 
              ? const Center(child: Text("لا توجد رحلات محجوزة حالياً", style: TextStyle(color: Colors.grey, fontFamily: 'Cairo')))
              : MainTripCard(bookingData: bookingData), // استدعاء الكارد الكبير
        );
      },
    );
  }
}