// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:starter_package/101/11_image_learn.dart';

import 'package:starter_package/core/random_image.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  Color _backgroundColor = Colors.white38;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,
      body: Center(
        child: TextButton(
            onPressed: () {
              showCustomSheet(context, const Expanded(child: ImageLearn()));
            },
            child: const Text('show')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
            // backgroundColor: Colors.red,
            // barrierColor: Colors.transparent,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            isScrollControlled: true, //false olursa yarisina kadar cizer. true yapip yukseklik verirsen etkilenir.
            context: context,
            builder: (context) {
              return _CustomSheet(backgroundColor: _backgroundColor);
            },
          );

          if (result is bool && result == true) {
            setState(() {
              _backgroundColor = Colors.cyan;
            });
          }
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({Key? key, required Color backgroundColor}) : super(key: key);

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  Color _backgroundColor = Colors.white;
  final _gripHeight = 24.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: _gripHeight,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Divider(
                color: Colors.black26,
                thickness: 3,
                //soldan sagdan kesti
                indent: MediaQuery.of(context).size.width * 0.4,
                endIndent: MediaQuery.of(context).size.width * 0.4,
              ),
              Positioned(
                right: 20,
                top: 0,
                child: Container(
                    child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close),
                )),
              )
            ],
          ),
        ),
        const Text('a'),
        const RandomImage(height: 200),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _backgroundColor = Colors.blueGrey;
              });
              Navigator.of(context).pop<bool>(true);
            },
            child: const Text('OK'))
      ],
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
      // backgroundColor: Colors.red,
      // barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      isScrollControlled: false, //false olursa yarisina kadar cizer. true yapip yukseklik verirsen etkilenir.
      context: context,
      builder: (context) {
        return _CustomMainSheet(child: child);
      },
    );
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({Key? key, required this.child}) : super(key: key);

  final Widget child;
  final _gripHeight = 24.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [_BaseSheetHeader(gripHeight: _gripHeight), child],
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader({
    required double gripHeight,
  }) : _gripHeight = gripHeight;

  final double _gripHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Divider(
            color: Colors.black26,
            thickness: 3,
            //soldan sagdan kesti
            indent: MediaQuery.of(context).size.width * 0.4,
            endIndent: MediaQuery.of(context).size.width * 0.4,
          ),
          Positioned(
            right: 20,
            top: 0,
            child: Container(
                child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.close),
            )),
          )
        ],
      ),
    );
  }
}
