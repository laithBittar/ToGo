import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    
    //  تغيير مدينة الانطلاق
    on<UpdateFromCityEvent>((event, emit) {
      emit(state.copyWith(
        searchModel: state.searchModel.copyWith(fromCity: event.city),
      ));
    });

    // تغيير الوجهة
    on<UpdateToCityEvent>((event, emit) {
      emit(state.copyWith(
        searchModel: state.searchModel.copyWith(toCity: event.city),
      ));
    });

    //   التبديل بين المدينتين (زر الأسهم)
    on<SwapCitiesEvent>((event, emit) {
      final currentFrom = state.searchModel.fromCity;
      final currentTo = state.searchModel.toCity;
      
      emit(state.copyWith(
        searchModel: state.searchModel.copyWith(
          fromCity: currentTo,
          toCity: currentFrom,
        ),
      ));
    });

    //  تحديث التاريخ
    on<UpdateDateEvent>((event, emit) {
      emit(state.copyWith(
        searchModel: state.searchModel.copyWith(tripDate: event.date),
      ));
    });

    //  تحديث عدد المسافرين
    on<UpdatePassengersEvent>((event, emit) {
      emit(state.copyWith(
        searchModel: state.searchModel.copyWith(passengersCount: event.count),
      ));
    });

    //  تحديث نوع الرحلة (عادي / VIP)
    on<UpdateTripTypeEvent>((event, emit) {
      emit(state.copyWith(
        searchModel: state.searchModel.copyWith(isVip: event.isVip),
      ));
    });
  }
}