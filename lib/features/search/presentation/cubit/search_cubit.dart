import 'package:docdoc/features/home/domain/entities/doctor_entity.dart';
import 'package:docdoc/features/search/domain/repo/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> search({required String query}) async {
    emit(SearchLoading());
    final result = await searchRepo.search(query: query);
    result.fold(
      (l) => emit(SearchError(message: l.message)),
      (r) => emit(SearchSuccess(doctors: r)),
    );
  }
}
