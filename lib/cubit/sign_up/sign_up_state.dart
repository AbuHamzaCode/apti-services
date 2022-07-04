part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const SignUpState._();

  const factory SignUpState.initial({
    @Default(Name.pure()) Name name,
    @Default(Surname.pure()) Surname surname,
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(Phone.pure()) Phone phone,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default('') String exceptionError,
  }) = _Initial;


  bool get displaySignUpButton => status.isValidated;
}