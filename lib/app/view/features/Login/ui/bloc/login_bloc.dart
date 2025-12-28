import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/app/view/features/Login/domain/usecases/login_usecase.dart';
import 'package:learning/app/view/features/Login/ui/bloc/login_event.dart';
import 'package:learning/app/view/features/Login/ui/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());

      final response = await loginUseCase.loginUser(event.username, event.password);

      response.fold((l){
        emit(LoginFailure(errorMessage: l.errorMessage));
      }, (r){
        emit(LoginSuccess(successMessage: 'Logged in Successfully'));
      });

    });
  }
}
