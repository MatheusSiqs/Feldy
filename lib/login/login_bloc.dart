import 'package:feldy/auth/auth_repository.dart';
import 'package:feldy/auth/form_submission_status.dart';
import 'package:feldy/login/login_event.dart';
import 'package:feldy/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginBloc,LoginState>{
  final AuthRepository authRepo;
  LoginBloc({required this.authRepo}) : super(LoginState());

  Stream<LoginState> mapEventToState(LoginEvent event) async*{
    if(event is LoginUsernameChanged){
      yield state.copyWith(username: event.username);
    }else if(event is LoginPasswordChanged){
      yield state.copyWith(password: event.password);
    }else if(event is LoginSubmitted){
      yield state.copyWith(formStatus: FormSubmitting());

      try{
        await authRepo.login();
        yield state.copyWith(formStatus: SubmissionSuccess());
      }on Exception catch(e){
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}