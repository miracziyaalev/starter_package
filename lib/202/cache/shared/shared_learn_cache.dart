import 'package:flutter/material.dart';
import 'package:starter_package/202/cache/shared/shared_manager.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _sharedManager;

  void _onChangedValue(String value) {
    final value0 = int.tryParse(value);

    if (value0 != null) {
      setState(() {
        _currentValue = value0;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _sharedManager = SharedManager();
    _initialze();
  }

  Future<void> _initialze() async {
    changeLoading();
    await _sharedManager.init();
    await readData();
    changeLoading();
  }

  Future<void> readData() async {
    // final prefs = await SharedPreferences.getInstance();

    // final int? counter = prefs.getInt('counter');

    _onChangedValue(_sharedManager.getString(SharedKeys.counter) ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          isLoading
              ? Center(child: CircularProgressIndicator(color: themeData.scaffoldBackgroundColor))
              : const SizedBox.shrink()
        ],
        title: Text(_currentValue.toString()),
      ),
      body: TextField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          _onChangedValue(value);
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [_saveButton(), _removeButton()],
      ),
    );
  }

  FloatingActionButton _removeButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        // final prefs = await SharedPreferences.getInstance();
        // final success = await prefs.remove('counter');
        await _sharedManager.removeItem(SharedKeys.counter);
        changeLoading();
      },
      child: const Icon(Icons.remove_circle_outline),
    );
  }

  FloatingActionButton _saveButton() {
    return FloatingActionButton(
      onPressed: () async {
        changeLoading();
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setInt('counter', _currentValue);
        await _sharedManager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
      child: const Icon(Icons.save_alt_outlined),
    );
  }
}

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);

  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
