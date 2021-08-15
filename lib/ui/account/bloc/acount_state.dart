part of 'acount_bloc.dart';

abstract class AcountState extends Equatable {
  const AcountState();

  @override
  List<Object> get props => [];
}

class AcountInitial extends AcountState {}

///
///[SucessSingIn]this state for the signIn process when it sucess signIn
///[ErrorSingIn]this state for the signIn process when it fauilt signIn
///[RegistrationProcessing]this state for the sigin and sigup process when it proceessing the sigin or signup process
///[SucessSingUp]this state for the signUp process when it sucess signUp
///[ErrorSingUp]this state for the signUp process when it fauilt signUp
///

class SucessSingIn extends AcountState {
  final User? user;

  SucessSingIn(this.user);
}

class ErrorSingIn extends AcountState {
  final String? error;

  ErrorSingIn(this.error);
}

class RegistrationProcessing extends AcountState {}

class SucessSingUp extends AcountState {
  final User? user;

  SucessSingUp(this.user);
}

class ErrorSingUp extends AcountState {
  final String? error;

  ErrorSingUp(this.error);
}
