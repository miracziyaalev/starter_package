import 'package:flutter/material.dart';

class NavigateDetailLearnDart extends StatefulWidget {
  const NavigateDetailLearnDart({super.key, this.isOkey = false});
  final bool isOkey;

  @override
  State<NavigateDetailLearnDart> createState() => _NavigateDetailLearnDartState();
}

class _NavigateDetailLearnDartState extends State<NavigateDetailLearnDart> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pop(!widget.isOkey);
            },
            icon: widget.isOkey ? const Icon(Icons.check) : const Icon(Icons.airplanemode_inactive_sharp),
            label: widget.isOkey ? const Text('reddet') : const Text('onayla')),
      ),
    );
  }
}
