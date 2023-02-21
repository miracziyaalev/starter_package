import "package:flutter/foundation.dart";
import "package:flutter_test/flutter_test.dart";
import "package:starter_package/303/learn/1_generic_learn.dart";
import "package:starter_package/product/widget/card/high_card.dart";

void main() {
  setUp(() {});

  test('best of list', () {
    List<GenericUser> users = [
      GenericUser("vb1", '11', 10),
      GenericUser("vb2", '11', 20),
      GenericUser("vb3", '11', 30)
    ];

    List<HighCard> highCards = users.map((e) {
      return HighCard(items: e.name.split(""));
    }).toList();

    //userslarimin icinden vb yazani almak istiyorum
    //users.singleWhere((element) => element.name == 'vb'); boyle kullanacagina classa func ata
    try {
      final response = users.singleWhere((element) => element.findUserName('x'));
      if (kDebugMode) {
        print(response);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  });

  test('best of list collection', () {
    List<GenericUser> users = [
      GenericUser("vb1", '11', 10),
      GenericUser("vb2", '11', 20),
      GenericUser("vb3", '11', 30)
    ];
    //userslarimin icinden vb yazani almak istiyorum
    //users.singleWhere((element) => element.name == 'vb'); boyle kullanacagina classa func ata
    try {
      final response = users.singleWhere((element) => element.findUserName('x'));
      if (kDebugMode) {
        print(response);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  });
}
