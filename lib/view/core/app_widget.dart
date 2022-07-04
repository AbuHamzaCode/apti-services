import 'package:apti_service/cubit/auth/auth_cubit.dart';
import 'package:apti_service/cubit/sign_up/sign_up_cubit.dart';
import 'package:apti_service/view/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: BlocProvider(
          lazy: false,
          create: (_) => SignUpCubit(),
          child: const SignUpPage(),
        ));
  }
}