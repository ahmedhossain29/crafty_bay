import 'package:crafty_bay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/otp_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 180,
                ),
                const AppLogo(
                  height: 100,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Please Enter Your Email Address',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailTEController,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter Your Email';
                    }
                    // TODO: Validate email with Regex
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<SendEmailOtpController>(builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: controller.inProgress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final bool result = await controller
                                .sendOtpToEmail(_emailTEController.text.trim());
                            if (result) {
                              Get.to(() => VerifyOtpScreen(
                                    email: _emailTEController.text.trim(),
                                  ));
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                title: 'Send OTP Failed',
                                message: controller.errorMessage,
                                duration: const Duration(seconds: 2),
                              ));
                            }
                          }
                        },
                        child: const Text('Next'),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
