import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagglex/bloc/form_state.dart';
import 'package:hagglex/repository/client.dart';
import 'package:hagglex/repository/model/log_in_response.dart';
import 'package:hagglex/user_interface/screens/home.dart';

class SignInCubit extends Cubit<AppFormState> {
  final GraphqlClient _client = GraphqlClient();

  SignInCubit() : super(InitialState());

  void showLoading() {
    emit(LoadingState());
  }

  Future<void> logIn(
      String username, String password, BuildContext context) async {
    emit(LoadingState());
    _client.logIn(username, password).then((result) {
      if (result.hasException) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${result.exception.graphqlErrors[0].message}')));
        print(result.exception.toString());
      } else {
        final json = result.data;

        final object = LogInResponse.fromJson(json);
        print(object);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      emit(InitialState());
    }).catchError((e) {
      emit(InitialState());
    });
  }
}
