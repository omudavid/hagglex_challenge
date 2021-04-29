import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagglex/bloc/form_state.dart';
import 'package:hagglex/repository/client.dart';
import 'package:hagglex/repository/model/sign_up_response.dart';
import 'package:hagglex/user_interface/screens/verify_screen.dart';

class SignUpCubit extends Cubit<AppFormState> {
  final GraphqlClient repo = GraphqlClient();

  SignUpCubit() : super(InitialState());

  Future<void> signUp(String email, String password, String username,
      String phoneNumber, BuildContext context) async {
    emit(LoadingState());

    await Future.delayed(Duration(seconds: 5));

    await repo.signUp(email, password, username, phoneNumber).then((result) {
      if (result.hasException) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${result.exception.graphqlErrors[0].message}')));
        print(result.exception.toString());
      } else {
        final json = result.data;

        final object = SignUpResponse.fromJson(json);
        print(object);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => VerifyScreen(
                      email: object.register.user.email,
                    )));
      }
      emit(InitialState());
    }).catchError((e) {
      emit(InitialState());
    });
  }
}
