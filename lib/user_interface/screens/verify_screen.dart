import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hagglex/bloc/form_state.dart';
import 'package:hagglex/bloc/verification_cubit.dart';
import 'package:hagglex/user_interface/widgets/app_back_button.dart';
import 'package:hagglex/user_interface/widgets/app_background.dart';
import 'package:hagglex/user_interface/widgets/app_input_field.dart';
import 'package:hagglex/user_interface/widgets/gradient_button.dart';

class VerifyScreen extends StatefulWidget {
  final String email;

  VerifyScreen({this.email});

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final formKey = GlobalKey<FormState>();
  int code;

  @override
  Widget build(BuildContext context) {
    final cubit = VerificationCubit();
    return BlocProvider(
      create: (context) => cubit,
      child: AppBackground(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBackButton(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Verify your account',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 40.0, horizontal: 25),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/svg/verify.svg'),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                'We just sent a verification code to your email. Please enter the code',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              AppInputField(
                                keyboardType: TextInputType.number,
                                color: Colors.black,
                                hintText: 'Verification code',
                                onSaved: (value) =>
                                    code = int.parse(value.trim()),
                              ),
                              BlocBuilder<VerificationCubit, AppFormState>(
                                builder: (context, state) {
                                  return GradientButton(
                                      isLoading: state is LoadingState,
                                      label: 'VERIFY ME',
                                      onTap: () {
                                        if (formKey.currentState.validate()) {
                                          formKey.currentState.save();
                                          cubit.verifyAccount(code, context);
                                        }
                                      });
                                },
                              ),
                              GradientButton(label: 'VERIFY ME ', onTap: () {}),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'This code will expire in 10 minutes',
                                style: TextStyle(fontSize: 9),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextButton(
                                onPressed: () {
                                  cubit.resendVerification(
                                      widget.email, context);
                                },
                                child: Text(
                                  'Resend Code',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
