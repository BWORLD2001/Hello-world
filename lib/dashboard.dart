import 'package:flutter/material.dart';

class MyDashboard extends StatelessWidget {
  final String fname, phn, email;
  const MyDashboard(
      {Key? key, required this.fname, required this.phn, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My dashboard'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'FullName: $fname',
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                ),
              ),
              Text(
                'FullName: $phn',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
              Text(
                'FullName: $email',
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 3,
                ),
              )
            ],
          ),
        ));
  }
}
