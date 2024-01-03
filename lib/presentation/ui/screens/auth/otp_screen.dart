import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_creen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
              text: const TextSpan(children: [
                TextSpan(
                  text: 'This code will expire in',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: ' 120s',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ]),
            ),
            const SizedBox(
              height: 12,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Resend Code',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
