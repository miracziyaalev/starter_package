import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await showDialog(
              context: context,
              barrierDismissible: true, // false butonlar harici tiklanamiyor
              builder: (context) {
                return const _ImageZoomDialog();
              });
        },
      ),
    );
  }
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('version update'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close')),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('update')),
      ],
    );
  }
}

class Keys {
  static const versionUpdate = "Version Update";
  static const close = "Close";
  static const update = "Update";
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text(Keys.versionUpdate),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(Keys.close)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text(Keys.update)),
          ],
        );
}

class _ImageZoomDialog extends StatelessWidget {
  const _ImageZoomDialog({Key? key}) : super(key: key);
  final String _url = "https://picsum.photos/200";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        child: Image.network(
          _url,
          fit: BoxFit.cover,
          height: 400,
        ),
      ),
    );
  }
}
