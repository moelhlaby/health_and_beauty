// import 'package:flutter_bloc/flutter_bloc.dart';

// mixin PaginationMixin<T, State> on Cubit<State> {
//   int _page = 1;
//   final int _perPage = 10;
//   bool _hasReachedMax = false;
//   bool _isLoading = false;

//   int get currentPage => _page;
//   int get perPage => _perPage;
//   bool get hasReachedMax => _hasReachedMax;
//   bool get isLoading => _isLoading;

//   void resetPagination() {
//     _page = 1;
//     _hasReachedMax = false;
//   }

//   Future<void> loadInitialData(Future<Either<Failure, List<T>>> Function(int page, int perPage) fetchFunction) async {
//     if (_isLoading) return;
    
//     resetPagination();
//     _isLoading = true;
    
//     final result = await fetchFunction(_page, _perPage);
//     _handleResult(result, isInitialLoad: true);
//   }

//   Future<void> loadMoreData(Future<Either<Failure, List<T>>> Function(int page, int perPage) fetchFunction) async {
//     if (_isLoading || _hasReachedMax) return;
    
//     _isLoading = true;
//     _page++;
    
//     final result = await fetchFunction(_page, _perPage);
//     _handleResult(result);
//   }

//   void _handleResult(Either<Failure, List<T>> result, {bool isInitialLoad = false}) {
//     result.when(
//       failure: (failure) {
//         if (!isInitialLoad) _page--; // Revert page increment on failure
//         _isLoading = false;
//         // Handle error in your cubit's state
//       },
//       success: (items) {
//         _isLoading = false;
//         _hasReachedMax = items.length < _perPage;
//         // Update state in your cubit
//       },
//     );
//   }
// }