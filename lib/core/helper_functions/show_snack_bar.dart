import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/presentation/manger/signup_cubit/signup_cubit.dart';

void showSnackBar(BuildContext context, SignupFailure state) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(state.message)));
}
