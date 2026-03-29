import 'package:equatable/equatable.dart';

// هاد الكلاس الأب اللي بتورث منه كل الأحداث
abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

//  حدث تغيير مدينة الانطلاق
class UpdateFromCityEvent extends SearchEvent {
  final String city;
  const UpdateFromCityEvent(this.city);

  @override
  List<Object> get props => [city];
}

// حدث تغيير الوجهة
class UpdateToCityEvent extends SearchEvent {
  final String city;
  const UpdateToCityEvent(this.city);

  @override
  List<Object> get props => [city];
}

//  حدث التبديل بين المدينتين (زر الأسهم)
class SwapCitiesEvent extends SearchEvent {}

//  حدث تغيير التاريخ
class UpdateDateEvent extends SearchEvent {
  final String date;
  const UpdateDateEvent(this.date);

  @override
  List<Object> get props => [date];
}

//  حدث تغيير عدد الركاب
class UpdatePassengersEvent extends SearchEvent {
  final int count;
  const UpdatePassengersEvent(this.count);

  @override
  List<Object> get props => [count];
}

//  حدث تغيير نوع الرحلة 
class UpdateTripTypeEvent extends SearchEvent {
  final bool isVip;
  const UpdateTripTypeEvent(this.isVip);

  @override
  List<Object> get props => [isVip];
}