// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:starter_package/product/widget/button/answer_button.dart';
import 'package:starter_package/product/widget/button/loading_button.dart';
import 'package:starter_package/product/widget/call_back_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CallBackDropdown(onUserSelected: (CallbackUser user) {
            print(user.name);
          }),
          AnswerButton(
            onNumber: (number) {
              return number % 2 == 0;
            },
          ),
          LoadingButton(
              title: 'Save',
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 1));
              })
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final int id;
  CallbackUser(
    this.name,
    this.id,
  );

//TODO dummy remove it
  static List<CallbackUser> dummyUsers() {
    return [
      CallbackUser('vb', 123),
      CallbackUser('vb2', 124),
    ];
  }

  @override
  bool operator ==(covariant CallbackUser other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
