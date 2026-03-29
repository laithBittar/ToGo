import 'package:equatable/equatable.dart';
import '../data/models/search_model.dart';

class SearchState extends Equatable {
  final SearchModel searchModel;
  final bool isLoading;
  final String? errorMessage;

  const SearchState({
    this.searchModel = const SearchModel(), // القيمة الافتراضية
    this.isLoading = false,
    this.errorMessage,
  });

  SearchState copyWith({
    SearchModel? searchModel,
    bool? isLoading,
    String? errorMessage,
  }) {
    return SearchState(
      searchModel: searchModel ?? this.searchModel,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [searchModel, isLoading, errorMessage];
}