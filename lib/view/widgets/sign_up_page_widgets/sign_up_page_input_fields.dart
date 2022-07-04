import 'package:apti_service/cubit/sign_up/sign_up_cubit.dart';
import 'package:apti_service/view/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:apti_service/models/validate_models/email.dart';
import 'package:apti_service/models/validate_models/name.dart';
import 'package:apti_service/models/validate_models/surname.dart';
import 'package:apti_service/models/validate_models/password.dart';
import 'package:apti_service/models/validate_models/phone.dart';

class SignUpPageNameInputField extends StatelessWidget {
  const SignUpPageNameInputField(
      {Key? key,
      required this.state,
      required this.controller})
      : super(key: key);
  final SignUpState state;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      controller: controller,
      padding: const EdgeInsets.symmetric(vertical: 10),
      hint: 'Name',
      keyboardType: TextInputType.name,
      error: state.name.error?.name,
      onChanged: (name) => context.read<SignUpCubit>().nameChanged(name),
    );
  }
}

class SignUpPageEmailInputField extends StatelessWidget {
  const SignUpPageEmailInputField(
      {Key? key,
      required this.state,
      required this.controller})
      : super(key: key);
  final SignUpState state;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      controller: controller,
      padding: const EdgeInsets.symmetric(vertical: 10),
      hint: 'Email',
      keyboardType: TextInputType.emailAddress,
      error: state.email.error?.name,
      onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
    );
  }
}

class SignUpPagePasswordInputField extends StatelessWidget {
  const SignUpPagePasswordInputField(
      {Key? key,
      required this.state,
      required this.controller})
      : super(key: key);
  final SignUpState state;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      controller: controller,
      padding: const EdgeInsets.symmetric(vertical: 10),
      hint: 'Password',
      isPasswordField: true,
      keyboardType: TextInputType.text,
      error: state.password.error?.name,
      onChanged: (password) =>
          context.read<SignUpCubit>().passwordChanged(password),
    );
  }
}

class SignUpPageSurnameInputField extends StatelessWidget {
  const SignUpPageSurnameInputField(
      {Key? key,
      required this.state,
      required this.controller})
      : super(key: key);
  final SignUpState state;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      controller: controller,
      padding: const EdgeInsets.symmetric(vertical: 10),
      hint: 'Surname',
      keyboardType: TextInputType.text,
      error: state.surname.error?.name,
      onChanged: (surname) =>
          context.read<SignUpCubit>().surnameChanged(surname),
    );
  }
}

class SignUpPagePhoneInputField extends StatelessWidget {
  const SignUpPagePhoneInputField(
      {Key? key,
      required this.state,
      required this.controller})
      : super(key: key);
  final SignUpState state;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      controller: controller,
      padding: const EdgeInsets.symmetric(vertical: 10),
      hint: 'Phone Number',
      keyboardType: TextInputType.text,
      error: state.phone.error?.name,
      onChanged: (phone) => context.read<SignUpCubit>().phoneChanged(phone),
    );
  }
}
