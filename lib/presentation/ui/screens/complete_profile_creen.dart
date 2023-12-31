import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const AppLogo(),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Complete Profile',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text(
              'Get started with us with your details',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'First Name'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Last Name'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Mobile'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'City'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              maxLines: 4,
              decoration: const InputDecoration(hintText: 'Shipping Address'),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Complete'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
