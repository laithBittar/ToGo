// features/search/presentation/screens/search_screen.dart
import 'package:flutter/material.dart';
import 'package:togo/features/search/presentation/widgets/date_passengers_picker.dart';
import 'package:togo/features/search/presentation/widgets/location_selector.dart';
import 'package:togo/features/search/presentation/widgets/search_button.dart';
import 'package:togo/features/search/presentation/widgets/search_header.dart';
import 'package:togo/features/search/presentation/widgets/trip_type_toggle.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SearchHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C2E),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Column(
                  children: [
                    LocationSelector(),
                    SizedBox(height: 20),
                    DatePassengersPicker(),
                    SizedBox(height: 20),
                    TripTypeToggle(),
                    SizedBox(height: 30),
                    SearchButton(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}