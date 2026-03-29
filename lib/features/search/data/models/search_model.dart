import 'package:equatable/equatable.dart';

class SearchModel extends Equatable {
  final String fromCity;
  final String toCity;
  final String tripDate;
  final int passengersCount;
  final bool isVip; // true يعني VIP، و false يعني عادي

  const SearchModel({
    this.fromCity = 'دمشق', // قيم افتراضية مشان أول ما يفتح التطبيق
    this.toCity = 'حلب',
    this.tripDate = 'اختر التاريخ',
    this.passengersCount = 1,
    this.isVip = false, 
  });

  // بتسمحلنا نعدل قيمة وحدة (مثلاً نزيد عدد الركاب) بدون ما نمسح باقي البيانات (مثل المدن اللي اختارها)
  SearchModel copyWith({
    String? fromCity,
    String? toCity,
    String? tripDate,
    int? passengersCount,
    bool? isVip,
  }) {
    return SearchModel(
      fromCity: fromCity ?? this.fromCity,
      toCity: toCity ?? this.toCity,
      tripDate: tripDate ?? this.tripDate,
      passengersCount: passengersCount ?? this.passengersCount,
      isVip: isVip ?? this.isVip,
    );
  }

  //   بتخلي البلوك يعرف إذا في قيمة تغيرت مشان يحدث الشاشة
  @override
  List<Object?> get props => [
        fromCity,
        toCity,
        tripDate,
        passengersCount,
        isVip,
      ];
}