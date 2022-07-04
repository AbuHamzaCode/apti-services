import 'package:apti_service/cubit/sign_up/sign_up_cubit.dart';
import 'package:apti_service/models/response_models/email_verify_code.dart';
import 'package:apti_service/models/response_models/register_response.dart';
import 'package:apti_service/models/response_models/verify_code.dart';
import 'package:apti_service/services/register_api.dart';
import 'package:apti_service/view/widgets/sign_up_page_widgets/sign_up_page_input_fields.dart';
import 'package:apti_service/view/widgets/sign_up_page_widgets/constant_sign_up_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignUpForm extends StatelessWidget {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var surnameController = TextEditingController();
  var emailAddressController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var codeController = TextEditingController();

  String? attemptId;
  bool? verifyEmail;
  RegisterResponse? canLogin;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            var snackBar = SnackBar(
                content: Text(state.exceptionError),
                backgroundColor: Colors.red);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state.status.isSubmissionSuccess) {
            var snackBar = const SnackBar(
                content: Text("Success!"), backgroundColor: Colors.green);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) => Stack(children: [
              Positioned.fill(
                  child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(38.0, 0, 38.0, 8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SignUpText(),
                            SignUpPageNameInputField(
                              state: state,
                              controller: nameController,
                            ),
                            SignUpPageEmailInputField(
                              state: state,
                              controller: emailAddressController,
                            ),
                            SignUpPagePasswordInputField(
                              state: state,
                              controller: passwordController,
                            ),
                            SignUpPageSurnameInputField(
                              state: state,
                              controller: surnameController,
                            ),
                            SignUpPagePhoneInputField(
                              state: state,
                              controller: phoneNumberController,
                            ),
                          ]))),
              state.status.isSubmissionInProgress
                  ? const Positioned(
                      child: Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Send all fields'),
                        onPressed: () {
                          sendEmailVerificationCode();
                          if(attemptId == null){
                            state.status.isSubmissionFailure;
                          }else {
                            state.status.isSubmissionSuccess;
                          }
                        },
                      )),
            ]));
  }

  void sendEmailVerificationCode() async {
    var response = await RegisterApi.sendEmailVerificationCode(
        email: emailAddressController.text);
    if (response.success == true) attemptId = response.result;
    else print("SendEmail fail");
  }

  void verifyEmailVerificationCode() async {
    var response = await RegisterApi.verifyEmailVerificationCode(
        attemptId: attemptId!, code: codeController.text);
    if (response.success == true) verifyEmail = response.result;
    else print("VerifyEmail fail");
  }

  void register() async {
    var response = await RegisterApi.register(
        name: nameController.text,
        surname: surnameController.text,
        email: emailAddressController.text,
        password: passwordController.text,
        phone: phoneNumberController.text);
    if(response.canLogin == true) verifyEmail = response.canLogin;
    else print("Register fail");
  }
}
