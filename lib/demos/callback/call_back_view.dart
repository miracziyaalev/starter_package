import 'package:flutter/material.dart';
import 'package:starter_package/demos/callback/call_back_button.dart';
import 'package:starter_package/demos/callback/call_back_returnable_button.dart';

class CallBackDemosView extends StatefulWidget {
  const CallBackDemosView({super.key});

  @override
  State<CallBackDemosView> createState() => _CallBackDemosViewState();
}

class _CallBackDemosViewState extends State<CallBackDemosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call back demos'),
      ),
      body: Center(
        child: Column(
          children: [
            CallBackButtonDemos(
              onTap: () async {
                await Future.delayed(const Duration(seconds: 1));
              },
            ),
            CallBackReturnableButton(
              onPressed: (number) {
                return number % 2 == 0;
              },
            )
          ],
        ),
      ),
    );
  }
}
