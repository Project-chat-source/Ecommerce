import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/app/global/enums/blocstatus.dart';
import 'package:learning/app/view/features/Home/domain/usecases/home_page_usecases.dart';
import 'package:learning/app/view/features/Home/ui/bloc/home_page_event.dart';
import 'package:learning/app/view/features/Home/ui/bloc/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final HomePageUsecases homePageUsecases;

  HomePageBloc({required this.homePageUsecases})
    : super(HomePageState.initial()) {
    on<LoadProducts>((event, emit) async {
      emit(state.copyWith(productStatus: Blocstatus.isLoading));

      final response = await homePageUsecases.loadProducts();

      response.fold(
        (l) {
          emit(
            state.copyWith(productStatus: Blocstatus.isFailure , errorMessage : l.errorMessage.toString()),
          );
        },
        (r) {
          emit(
            state.copyWith(productStatus: Blocstatus.isSuccess, products: r),
          );
        },
      );
    });
  }
}
