import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:homemgt/services/user_repository.dart';

import '../../login/login.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository, super();

  @override
  LoginState get initialState => LoginState.empty();



  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
     if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGooglePressedToState();
    } 
  }



  Stream<LoginState> _mapLoginWithGooglePressedToState() async* {
    try {
      await _userRepository.signInWithGoogle();
      yield LoginState.success();
    } on PlatformException catch (e) {
      yield LoginState.failure(e.message);
    }
  }

 


}
