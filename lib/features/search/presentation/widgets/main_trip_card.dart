import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import 'ticket_details_grid.dart';
import 'trip_status_section.dart';

class MainTripCard extends StatelessWidget {
  final dynamic bookingData;
  const MainTripCard({super.key, required this.bookingData});

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('yyyy-MM-dd').format(bookingData.tripDate ?? DateTime.now());
    String time = DateFormat('HH:mm').format(bookingData.tripDate ?? DateTime.now());
    bool isVip = false;
    try { isVip = bookingData.isVip ?? false; } catch (_) {}

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          _buildTabs(),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppColors.cardBg, borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text("TG-8X1J-VUR3", style: TextStyle(color: AppColors.primaryYellow, fontWeight: FontWeight.bold)),
                  const Text("TICKET SERIAL", style: TextStyle(color: AppColors.textGrey, fontSize: 10)),
                ]),
                const Divider(color: Colors.white10, height: 25),
                
                Row(
                  children: [
                    if (isVip) _badge("VIP"),
                    if (isVip) const SizedBox(width: 8),
                    const Text("شركة الحسن", style: TextStyle(color: AppColors.textWhite, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Cairo')),
                    const Spacer(),
                    Flexible(
                      child: Text("${bookingData.fromCity} ➔ ${bookingData.toCity}", 
                        style: const TextStyle(color: AppColors.textWhite, fontSize: 14, fontFamily: 'Cairo'),
                        overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                TicketDetailsGrid(date: date, time: time, passengers: bookingData.passengersCount.toString()),
                const Divider(color: Colors.white10, height: 30),
                _btn("عرض مسار الرحلة", Icons.map_outlined, AppColors.primaryYellow, Colors.black),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const TripStatusSection(),
          const SizedBox(height: 15),
          _btn("تأكيد الحجز (Sham Cash)", Icons.wallet, AppColors.primaryYellow, Colors.black),
          const SizedBox(height: 10),
          _btn("إلغاء الحجز", Icons.close, Colors.transparent, Colors.redAccent),
        ],
      ),
    );
  }

  Widget _badge(String t) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    decoration: BoxDecoration(color: AppColors.primaryYellow.withOpacity(0.1), borderRadius: BorderRadius.circular(6), border: Border.all(color: AppColors.primaryYellow, width: 0.5)),
    child: Text(t, style: const TextStyle(color: AppColors.primaryYellow, fontSize: 10, fontWeight: FontWeight.bold)),
  );

  Widget _btn(String l, IconData i, Color bg, Color tc) => Padding(
    padding: const EdgeInsets.only(bottom: 0),
    child: ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(i, color: tc, size: 18),
      label: Text(l, style: TextStyle(color: tc, fontWeight: FontWeight.bold, fontFamily: 'Cairo')),
      style: ElevatedButton.styleFrom(
        backgroundColor: bg, foregroundColor: tc, elevation: 0,
        side: bg == Colors.transparent ? BorderSide(color: tc) : null,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
  );

  Widget _buildTabs() => Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    _tab("الملغاة"), const SizedBox(width: 8), _tab("السابقة"), const SizedBox(width: 8), _tab("القادمة", active: true),
  ]);

  Widget _tab(String t, {bool active = false}) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
    decoration: active ? BoxDecoration(color: AppColors.primaryYellow, borderRadius: BorderRadius.circular(15)) : null,
    child: Text(t, style: TextStyle(color: active ? Colors.black : AppColors.textGrey, fontFamily: 'Cairo', fontWeight: active ? FontWeight.bold : null)),
  );
}