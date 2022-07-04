import 'package:apti_service/models/response_models/email_verify_code.dart';
import 'package:apti_service/models/response_models/register_response.dart';
import 'package:apti_service/models/response_models/verify_code.dart';
import 'package:apti_service/models/validate_models/surname.dart';
import 'package:bloc/bloc.dart';
import 'package:apti_service/models/validate_models/email.dart';
import 'package:apti_service/models/validate_models/name.dart';
import 'package:apti_service/models/validate_models/password.dart';
import 'package:apti_service/models/validate_models/phone.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/register_api.dart';

part 'sign_up_state.dart';

part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState.initial());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate(
          [state.name, email, state.password, state.surname, state.phone]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate(
          [state.name, state.email, password, state.surname, state.phone]),
    ));
  }

  void surnameChanged(String value) {
    final surname = Surname.dirty(value);
    emit(state.copyWith(
      surname: surname,
      status: Formz.validate(
          [state.name, state.email, state.password, surname, state.phone]),
    ));
  }

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(state.copyWith(
      name: name,
      status: Formz.validate(
          [name, state.email, state.password, state.surname, state.phone]),
    ));
  }

  void phoneChanged(String value) {
    final phone = Phone.dirty(value);
    emit(state.copyWith(
      phone: phone,
      status: Formz.validate(
          [state.name, state.email, state.password, state.surname, phone]),
    ));
  }
}
