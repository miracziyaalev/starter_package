import 'package:flutter/material.dart';
import 'package:starter_package/202/learn/2_model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel7(body: 'a');

  @override
  void initState() {
    super.initState();
    // final user1 = PostModel()
    //   ..userId = 1
    //   ..id = 1;
    // //user1.body = 'hello';

    // final user2 = PostModel2(userId: 1, id: 2, title: 'a', body: "b");
    // //user2.body = 'a'; // yapilabiliyor. cunku final tanimlanmadi

    // final user3 = PostModel3(userId: 3, id: 3, title: 'bb', body: 'cc');
    // //user3.body = 'dd';  hata verir, postModal3 te final parametre
    // final user4 = PostModel4(userId: 4, id: 5, title: 'aa', body: 'bbb');
    // // user4.userId . normalde priv. classta yazilan kural sayesinde erisebildim. get

    // final user5 = PostModel5(userId: 4, id: 5, title: 'aa', body: 'bbb');

    // final user6 = PostModel6();
    // //default valueler atandi. kural sayesinde veriyi cektik
    // //print(user6.userId);

    // //serviste islem yapiyorsan en mantiklisi bu
    // final user7 = PostModel7(body: 'a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          user9 = user9.copyWith(title: 'miracalev');
          //copywith methodu ile final degeri ile olusturulmus bir objenin belli bir parametresine deger atadik
          user9.updateBody('mrc'); // body final degil
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: Text(user9.body ?? 'not has any data'),
      ),
    );
  }
}
