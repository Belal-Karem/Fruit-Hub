import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/otp_verifi_view_body.dart';

class OtpVerifiView extends StatelessWidget {
  const OtpVerifiView({super.key});

  static const routeName = 'otp_verifi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OtpVerifiViewBody());
  }
}
