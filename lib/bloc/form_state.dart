import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AppFormState extends Equatable {}

class InitialState extends AppFormState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AppFormState {
  @override
  List<Object> get props => [];
}
