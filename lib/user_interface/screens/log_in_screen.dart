import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagglex/bloc/sign_in_cubit.dart';
import 'package:hagglex/bloc/form_state.dart';
import 'package:hagglex/repository/client.dart';
import 'package:hagglex/user_interface/screens/sign_up_screen.dart';
import 'package:hagglex/user_interface/widgets/app_background.dart';
import 'package:hagglex/user_interface/widgets/app_button.dart';
import 'package:hagglex/user_interface/widgets/app_input_field.dart';
import 'package:hagglex/utils/validators.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final formKey = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    final cubit = SignInCubit();
    return AppBackground(
      child: BlocProvider(
        lazy: false,
        create: (context) => cubit,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppInputField(
                          hintText: ' Email Address',
                          color: Colors.white,
                          validator: Validator.isEmail,
                          onSaved: (value) => email = value.trim(),
                        ),
                        AppInputField(
                          hintText: 'Password (Min. 8 Characters)',
                          obscureText: true,
                          color: Colors.white,
                          validator: Validator.isPassword,
                          onSaved: (value) => password = value.trim(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        // BlocBuilder<FormCubit, AppFormState>(
                        //   builder: (context, state) {
                        //     if (state is InitialState) {
                        //       return Container(
                        //         child: Text('Init state'),
                        //       );
                        //     }
                        //     if (state is LoadingState) {
                        //       return Container(
                        //         child: Text('Wahala'),
                        //       );
                        //     }
                        //     return Container(
                        //       child: Text('Loading'),
                        //     );
                        //   },
                        // ),
                        BlocBuilder<SignInCubit, AppFormState>(
                          builder: (context, state) {
                            return AppButton(
                              label: 'LOG IN',
                              isLoading: state is LoadingState,
                              onTap: () {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                  cubit.logIn(email, password, context);
                                }
                              },
                              textColor: Colors.black,
                              bgColor: Color(0xFFFFC175),
                            );
                          },
                        ),
                        // AppButton(
                        //   label: 'LOG IN',
                        //   onTap: () {
                        //     formKey.currentState.validate();
                        //     testLogIn();
                        //   },
                        //   textColor: Colors.black,
                        //   bgColor: Color(0xFFFFC175),
                        // ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'New User? Create a new account',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  testLogIn() async {
    var repo = GraphqlClient();

    await repo.logIn("devmentor", "#hhdhdhdhdhdhdking123.");
  }
}
