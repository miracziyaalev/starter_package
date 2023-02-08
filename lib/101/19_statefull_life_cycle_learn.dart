// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StatefullLifeCircleLearn extends StatefulWidget {
  const StatefullLifeCircleLearn({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  State<StatefullLifeCircleLearn> createState() => _StatefullLifeCircleLearnState();
}

class _StatefullLifeCircleLearnState extends State<StatefullLifeCircleLearn> {
  String _message = "";
  late final bool _isOdd;

  // mesaj tekse yanina tek yoksa cift yaz

  //
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('c');
  }



// sayfadan cikarken  verileri oldurur
  @override
  void dispose() {
    super.dispose();
  }

//onceki gelen veri ile karsilastirma yapabildigin widget
  @override
  void didUpdateWidget(covariant StatefullLifeCircleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.message != widget.message) {
      _message = widget.message;

      setState(() {
        _computeValue();
      });
    }
    print('b');
  }

//initState ekran cizilmeden once bir kere calisir. ve ona gore cizer. daha sonra bir degisiklik yapamaz. calisamaz
  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    print('a');
    _computeValue();
  }

  void _computeValue() {
    if (_isOdd) {
      _message += 'TEK';
    } else {
      _message += 'CIFT';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_message)),
      body: _isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
