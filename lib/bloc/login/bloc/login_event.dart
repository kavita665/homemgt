import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginWithGooglePressed extends LoginEvent {
  @override
  List<Object> get props => [];
}

class LoginWithFacebookPressed extends LoginEvent {
  @override
  List<Object> get props => [];
}
