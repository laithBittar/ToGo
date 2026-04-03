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
    final dt = bookingData.tripDate ?? DateTime.now();
    final date = DateFormat('yyyy-MM-dd').format(dt);
    final time = DateFormat('HH:mm').format(dt);
    final isVip = bookingData.isVip ?? false;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _buildTabs(),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardBg, // حذفنا const من الـ Container
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                _buildHeaderRow("TG-8X1J-VUR3", "TICKET SERIAL"),
                const Divider(color: Colors.white10, height: 20),
                Row(
                  children: [
                    if (isVip) ...[_badge("VIP"), const SizedBox(width: 6)],
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10),
                      child: Text(
                        // حذفنا const
                        "شركة الحسن",
                        style: TextStyle(
                          // حذفنا const
                          color: AppColors.textWhite,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 10),
                      child: _buildRoute(
                        bookingData.fromCity,
                        bookingData.toCity,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TicketDetailsGrid(
                  date: date,
                  time: time,
                  passengers: bookingData.passengersCount.toString(),
                ),
                const Divider(color: Colors.white10, height: 25),
                _btn(
                  "عرض مسار الرحلة",
                  Icons.map_outlined,
                  AppColors.primaryYellow,
                  Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const TripStatusSection(),
          const SizedBox(height: 12),
          _btn(
            "تأكيد الحجز (Sham Cash)",
            Icons.wallet,
            AppColors.primaryYellow,
            Colors.black,
          ),
          const SizedBox(height: 8),
          _btn(
            "إلغاء الحجز",
            Icons.close,
            Colors.transparent,
            Colors.redAccent,
          ),
        ],
      ),
    );
  }

  // --- دوال مساعدة لتقليص الكود (Widgets) ---

  Widget _buildHeaderRow(String code, String label) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        code,
        style: TextStyle(
          // حذفنا const
          color: AppColors.primaryYellow,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
      Text(
        label,
        style: TextStyle(
          color: AppColors.textGrey,
          fontSize: 10,
        ), // حذفنا const
      ),
    ],
  );

  Widget _buildRoute(String from, String to) => Flexible(
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          Text(
            from,
            style: TextStyle(
              // حذفنا const
              color: AppColors.textWhite,
              fontSize: 14,
              fontFamily: 'Cairo',
            ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Icon(
              Icons.arrow_forward_rounded,
              color: AppColors.primaryYellow,
              size: 16,
            ),
          ),
          Text(
            to,
            style: TextStyle(
              // حذفنا const
              color: AppColors.textWhite,
              fontSize: 14,
              fontFamily: 'Cairo',
            ),
          ),
        ],
      ),
    ),
  );

  Widget _badge(String t) => Container(
    margin: const EdgeInsetsDirectional.only(end: 8),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    decoration: BoxDecoration(
      color: AppColors.primaryYellow.withOpacity(0.1),
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: AppColors.primaryYellow, width: 0.5),
    ),
    child: Text(
      t,
      style: TextStyle(
        // حذفنا const
        color: AppColors.primaryYellow,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Widget _btn(String l, IconData i, Color bg, Color tc) => SizedBox(
    width: double.infinity,
    child: ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(i, color: tc, size: 18),
      label: Text(
        l,
        style: TextStyle(
          color: tc,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        elevation: 0,
        side: bg == Colors.transparent ? BorderSide(color: tc) : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: const Size(double.infinity, 48),
      ),
    ),
  );

  Widget _buildTabs() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _tab("الملغاة"),
      const SizedBox(width: 8),
      _tab("السابقة"),
      const SizedBox(width: 8),
      _tab("القادمة", active: true),
    ],
  );

  Widget _tab(String t, {bool active = false}) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: active
        ? BoxDecoration(
            color: AppColors.primaryYellow,
            borderRadius: BorderRadius.circular(12),
          )
        : null,
    child: Text(
      t,
      style: TextStyle(
        color: active ? Colors.black : AppColors.textGrey,
        fontFamily: 'Cairo',
        fontSize: 12,
        fontWeight: active ? FontWeight.bold : null,
      ),
    ),
  );
}
