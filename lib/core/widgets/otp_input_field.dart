import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpInputField extends StatelessWidget {
  const OtpInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      onCompleted: (otp) {
        // Verify OTP
      },
    );
  }
}
