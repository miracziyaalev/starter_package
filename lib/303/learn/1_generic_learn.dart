// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserManagement<T extends AdminUser> {
  final T admin;

  UserManagement(this.admin);

  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;

    for (var item in users) {
      sum += item.money;
    }

    int initialValue = admin.role == 1 ? admin.money : 0;

    final sumMoney = users.map((e) => e.money).fold<int>(0, (initialValue, element) => initialValue + element);

    final money = users.fold<int>(initialValue, (initialValue, element) => initialValue + element.money);
    return money;
  }

  Iterable<R>? showNames<R>(List<GenericUser> users) {
    //bunu sadece role 1 olanlar
    if (R == String) {
      final names = users.map((e) => e.name);
      return names.cast<R>();
    }
    return null;
  }
}

class VBModel<T> {
  final String name = "vb";
  final List<T> items;
  VBModel(
    this.items,
  );
}

class GenericUser {
  final String name;
  final String id;
  final int money;
  GenericUser(
    this.name,
    this.id,
    this.money,
  );

  bool findUserName(String name) {
    return this.name == name;
  }
}

class AdminUser extends GenericUser {
  final int role;

  AdminUser(String name, String id, int money, this.role) : super(name, id, money);
}
