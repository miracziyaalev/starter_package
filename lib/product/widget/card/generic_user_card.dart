// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../303/learn/1_generic_learn.dart';

class GenericUserCard extends StatelessWidget {
  const GenericUserCard({
    Key? key,
    required this.model,
  }) : super(key: key);
  
  final GenericUser model;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(model.name));
  }
}
