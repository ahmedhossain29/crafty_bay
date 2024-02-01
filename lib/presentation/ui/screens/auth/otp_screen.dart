import 'dart:async';

import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  final String email;
  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  int countdownSeconds = 60;
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                controller: _otpTEController,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                keyboardType: TextInputType.number,
                backgroundColor: Colors.transparent,
                length: 6,
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
                child: GetBuilder<VerifyOTPController>(
                    builder: (verifyOtpController) {
                  return Visibility(
                    visible: verifyOtpController.inProgress == false,
                    replacement: const CenterCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final bool response = await verifyOtpController
                              .verifyOTP(widget.email, _otpTEController.text);
                          if (response) {
                            if (verifyOtpController
                                .shouldNavigateCompleteProfile) {
                              Get.to(() => const CompleteProfileScreen());
                            } else {
                              Get.offAll(() => const MainBottomNavScreen());
                            }
                          } else {
                            Get.showSnackbar(GetSnackBar(
                              title: 'OTP Verification Failed',
                              message: verifyOtpController.errorMessage,
                              duration: const Duration(seconds: 2),
                              isDismissible: true,
                            ));
                          }
                        }
                      },
                      child: const Text('Next'),
                    ),
                  );
                }),
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
                        //style: TextStyle(color: AppColors.primaryColor),
                      )
                    : const Text(
                        'Resend Code',
                        style: TextStyle(color: Colors.grey),
                      ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void _startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
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
