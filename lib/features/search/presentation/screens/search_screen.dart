import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:togo/features/search/presentation/widgets/search_header.dart';
import 'package:togo/features/search/presentation/widgets/date_passengers_picker.dart';
import '../../logic/search_bloc.dart';
import '../../logic/search_event.dart';
import '../../logic/search_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchHeader(),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2C2C2E),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          // قسم المواقع
                          _buildLocationsSection(context, state),

                          const SizedBox(height: 20),

                          //  استدعاء ملف التاريخ والمسافرين
                          const DatePassengersPicker(),

                          const SizedBox(height: 12),

                          //  نوع الشركة المفضل
                          _fullWidthBox(
                            Icons.business_center,
                            "نوع الشركة المفضل",
                            "الكل",
                          ),

                          const SizedBox(height: 20),

                          // حقل الـ VIP
                          _buildVipToggle(context, state),

                          const SizedBox(height: 30),

                          //  زر البحث النهائي
                          _buildSearchButton(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLocationsSection(BuildContext context, SearchState state) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Column(
          children: [
            _locationBox(
              Icons.location_on,
              "مكان الانطلاق",
              state.searchModel.fromCity,
            ),
            const SizedBox(height: 10),
            _locationBox(Icons.navigation, "الوجهة", state.searchModel.toCity),
          ],
        ),
        Positioned(
          left: 10,
          child: GestureDetector(
            onTap: () => context.read<SearchBloc>().add(SwapCitiesEvent()),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFFFFD700),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.swap_vert, color: Colors.black, size: 30),
            ),
          ),
        ),
      ],
    );
  }

  Widget _locationBox(IconData icon, String title, String city) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF3A3A3C),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFFFD700)),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text(
                city,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ],
      ),
    );
  }

  Widget _fullWidthBox(IconData icon, String title, String val) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF3A3A3C),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFFFD700), size: 22),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 11),
              ),
              Text(
                val,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 20),
        ],
      ),
    );
  }

  Widget _buildVipToggle(BuildContext context, SearchState state) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFF3A3A3C),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          _toggleBtn(context, "عادي", !state.searchModel.isVip, false),
          _toggleBtn(context, "VIP", state.searchModel.isVip, true),
        ],
      ),
    );
  }

  Widget _toggleBtn(
    BuildContext context,
    String label,
    bool selected,
    bool value,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () => context.read<SearchBloc>().add(UpdateTripTypeEvent(value)),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFFFD700) : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD700),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Text(
        "بحث عن رحلة",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
