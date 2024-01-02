import 'package:flutter/material.dart';

class CreateReviewScreen extends StatelessWidget {
  const CreateReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Reviews',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(
              height: 52,
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
              maxLines: 5,
              decoration: const InputDecoration(hintText: 'Write Review'),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                )),
          ],
        ),
      ),
    );
  }
}
