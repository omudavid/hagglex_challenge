import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagglex/bloc/form_state.dart';
import 'package:hagglex/repository/client.dart';
import 'package:hagglex/repository/model/resend_verification_response.dart';

class VerificationCubit extends Cubit<AppFormState> {
  final GraphqlClient repo = GraphqlClient();

  VerificationCubit() : super(InitialState());

  Future<void> resendVerification(String email, BuildContext context) async {
    await repo.resendVerification(email).then((result) {
      if (result.hasException) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${result.exception.graphqlErrors[0].message}')));
        print(result.exception.toString());
      } else {
        final json = result.data;

        final object = ResendVerificationResponse.fromJson(json);
        if (object.resendVerificationCode == true) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Verification Resent')));
        }
      }
    }).catchError((e) {});
  }

  Future<void> verifyAccount(int code, BuildContext context) async {
    emit(LoadingState());
    await repo.verifyAccount(code).then((result) {
      if (result.hasException) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${result.exception.graphqlErrors[0].message}')));
        print(result.exception.toString());
      } else {
        final json = result.data;

        // final object = ResendVerificationResponse.fromJson(json);
        //if (object.resendVerificationCode == true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Account Verified')));
      }
      // }
      emit(InitialState());
    }).catchError((e) {
      emit(InitialState());
    });
  }
}
