import 'dart:async';

import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_creen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int countdownSeconds = 60;
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 160,
            ),
            const AppLogo(),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Enter OTP Code',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'A 4 Digit OTP Code has been Sent',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 24,
            ),
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              keyboardType: TextInputType.number,
              backgroundColor: Colors.transparent,
              length: 4,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: AppColors.primaryColor,
                activeColor: Colors.green,
                selectedFillColor: Colors.white,
                inactiveFillColor: Colors.red,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: false,
              onCompleted: (v) {},
              onChanged: (value) {
                print(value);
              },
              beforeTextPaste: (text) {
                return true;
              },
              appContext: context,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(const CompleteProfileScreen());
                },
                child: Text('Next'),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text: 'This code will expire',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: countdownSeconds > 0 ? " in $countdownSeconds s" : "",
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ]),
            ),
            const SizedBox(
              height: 12,
            ),
            TextButton(
              onPressed: isButtonEnabled ? () => _handleResend() : null,
              child: countdownSeconds == 0
                  ? const Text(
                      'Resend Code',
                      style: TextStyle(color: AppColors.primaryColor),
                    )
                  : const Text(
                      'Resend Code',
                      style: TextStyle(color: Colors.grey),
                    ),
            ),
          ]),
        ),
      ),
    );
  }

  void _startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (countdownSeconds > 0) {
          countdownSeconds--;
        } else {
          isButtonEnabled = true;
          timer.cancel(); // Stop the countdown when it reaches 0
        }
      });
    });
  }

  void _handleResend() {
    // Reset the countdown and disable the button
    setState(() {
      countdownSeconds = 60;
      isButtonEnabled = false;
    });

    // Start the countdown again
    _startCountdown();
  }
}
