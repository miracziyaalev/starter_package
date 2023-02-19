// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:starter_package/303/learn/1_generic_learn.dart';

void main() {
  setUp(() {});

  test('user calculate', () {
    final users = [
      GenericUser("vb", '11', 10),
      GenericUser("vb", '11', 20),
      GenericUser("vb", '11', 30),
    ];

    final result = UserManagement(AdminUser("vAdmin", "1", 15, 1)).calculateMoney(users);

    expect(result, 75);

    final response = UserManagement(AdminUser("vAdmin", "1", 15, 2)).showNames<String>(users);
  });
}
