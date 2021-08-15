part of 'acount_bloc.dart';

abstract class AcountEvent extends Equatable {
  const AcountEvent();

  @override
  List<Object> get props => [];
}

///
///[SingUp] event active when click the signup button and all
/// the data signup form it right
///
///[SingIn] event active when click the singin button and all
/// the data singin form it right
///

class SingUp extends AcountEvent {
  final String name;

  final String email;

  final String password;

  final String address;

  final String imageUrl;

  final String phone;

  SingUp({
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.imageUrl,
    required this.phone,
  });
}

class SingIn extends AcountEvent {
  final String email;

  final String password;

  SingIn({
    required this.email,
    required this.password,
  });
}

class LogOut extends AcountEvent {}
