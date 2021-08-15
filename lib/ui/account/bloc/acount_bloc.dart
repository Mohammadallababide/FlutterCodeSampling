import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p2_mobile/data/remote_data_source/ServerApi.dart';
import 'package:p2_mobile/models/User.dart';

part 'acount_event.dart';
part 'acount_state.dart';

class AcountBloc extends Bloc<AcountEvent, AcountState> {
  AcountBloc() : super(AcountInitial());

  @override
  Stream<AcountState> mapEventToState(
    AcountEvent event,
  ) async* {
    if (event is SingIn) {
      yield RegistrationProcessing();
      String? error;
      User? user;
      await ServerApi.apiClient
          .singIn(email: event.email, password: event.password)
          .then((value) {
        user = value;
      }).catchError((onError) async => error = onError);
      if (error == null) {
        yield SucessSingIn(user);
      } else {
        yield ErrorSingIn(error);
      }
    } else if (event is SingUp) {
      yield RegistrationProcessing();
      String? error;
      User? user;
      await ServerApi.apiClient
          .singUp(
        email: event.email,
        password: event.password,
        address: event.address,
        imageUrl: event.imageUrl,
        phone: event.phone,
        name: event.name,
      )
          .then((value) {
        user = value;
      }).catchError((onError) async => error = onError);
      if (error == null) {
        yield SucessSingUp(user);
      } else {
        yield ErrorSingUp(error);
      }
    }
  }
}
