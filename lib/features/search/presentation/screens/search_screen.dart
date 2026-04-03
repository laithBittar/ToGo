import 'package:flutter/material.dart';
import '../widgets/date_passengers_picker.dart';
import '../widgets/location_selector.dart';
import '../widgets/search_button.dart';
import '../widgets/search_header.dart';
import '../widgets/trip_type_toggle.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea( 
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SearchHeader(),
              
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04, 
                  vertical: 10
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2E),
                    borderRadius: BorderRadius.circular(25),
                    // إضافة ظل خفيف لإعطاء عمق للتصميم
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Column(
                    children: [
                      LocationSelector(),
                      SizedBox(height: 24),  
                      DatePassengersPicker(),
                      SizedBox(height: 24),
                      TripTypeToggle(),
                      SizedBox(height: 32),
                      SearchButton(),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 40),          
            ],
          ),
        ),
      ),
    );
  }
}