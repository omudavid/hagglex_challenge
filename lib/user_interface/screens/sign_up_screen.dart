import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagglex/bloc/form_state.dart';
import 'package:hagglex/bloc/sign_up_cubit.dart';
import 'package:hagglex/user_interface/screens/search_Country.dart';
import 'package:hagglex/user_interface/widgets/app_back_button.dart';
import 'package:hagglex/user_interface/widgets/app_background.dart';
import 'package:hagglex/user_interface/widgets/app_input_field.dart';
import 'package:hagglex/user_interface/widgets/gradient_button.dart';
import 'package:hagglex/utils/validators.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  String email;
  String password;
  String username;
  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    final cubit = SignUpCubit();
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Create a new account',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              AppInputField(
                                color: Colors.black,
                                hintText: 'Email Address',
                                validator: Validator.isEmail,
                                onSaved: (value) => email = value.trim(),
                              ),
                              AppInputField(
                                color: Colors.black,
                                hintText: 'Password (Min. 8 Characters)',
                                obscureText: true,
                                validator: Validator.isPassword,
                                onSaved: (value) => password = value.trim(),
                              ),
                              AppInputField(
                                color: Colors.black,
                                hintText: 'Create a username',
                                validator: Validator.isUserName,
                                onSaved: (value) => username = value.trim(),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 15, right: 10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: Color(0xFFF4F4F4),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchCountry()));
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 10,
                                            child: Image.asset(
                                                'assets/images/nigerian_flag.png'),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            '(+234)',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: AppInputField(
                                      color: Colors.black,
                                      keyboardType: TextInputType.phone,
                                      hintText: 'Enter your phone number',
                                      validator: Validator.isPhoneNumber,
                                      onSaved: (value) =>
                                          phoneNumber = value.trim(),
                                    ),
                                  ),
                                ],
                              ),
                              AppInputField(
                                color: Colors.black,
                                hintText: 'Referral code',
                              ),
                              Text(
                                'By signing, you agree to HaggleX terms and privacy policy.',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                              BlocBuilder<SignUpCubit, AppFormState>(
                                builder: (context, state) {
                                  return GradientButton(
                                      isLoading: state is LoadingState,
                                      label: 'SIGN UP',
                                      onTap: () {
                                        if (formKey.currentState.validate()) {
                                          formKey.currentState.save();
                                          cubit.signUp(email, password,
                                              username, phoneNumber, context);
                                        }
                                      });
                                },
                              ),

                              // GradientButton(
                              //     label: 'SIGN UP',
                              //     onTap: () {
                              //       formKey.currentState.validate();
                              //     })
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
