import 'package:apti_service/cubit/sign_up/sign_up_cubit.dart';
import 'package:apti_service/view/forms/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => SignUpCubit(),
        child: SignUpForm(),
      ),
    );
  }
}