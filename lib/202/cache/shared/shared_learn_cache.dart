// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:starter_package/202/cache/shared/shared_manager.dart';
import 'package:starter_package/202/cache/shared/user_model.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _sharedManager;
  late List<User> usersItems = [];

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
    _onChangedValue(_sharedManager.getString(SharedKeys.counter) ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_loading()],
        title: Text(_currentValue.toString()),
      ),
      body: Column(
        children: [
          customField(),
          Expanded(
            child: _UserListView(),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [_saveButton(), _removeButton()],
      ),
    );
  }

  SingleChildRenderObjectWidget _loading() {
    return isLoading
        ? Center(child: CircularProgressIndicator(color: themeData.scaffoldBackgroundColor))
        : const SizedBox.shrink();
  }

  TextField customField() {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged: (value) {
        _onChangedValue(value);
      },
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

class _UserListView extends StatelessWidget {
  _UserListView();

  final List<User> users = UserItems().users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(users[index].title ?? ''),
            subtitle: Text(users[index].description ?? ''),
            trailing: Text(users[index].url ?? "",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(decoration: TextDecoration.underline)),
          ),
        );
      },
    );
  }
}

class UserItems {
  late final List<User> users;

  UserItems() {
    users = [
      User('vb', '100', 'vb10.dev'),
      User('vb2', '102', 'vb10.dev'),
      User('vb3', '103', 'vb10.dev'),
    ];
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
