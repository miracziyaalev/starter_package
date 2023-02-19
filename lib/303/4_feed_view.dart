import 'package:flutter/material.dart';
import 'package:starter_package/202/service/post_service.dart';

import '../202/service/post_model.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> with AutomaticKeepAliveClientMixin {
  final IPostService _postService = PostService();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(),
      body: FeedFutureBuilder(postService: _postService),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class FeedFutureBuilder extends StatelessWidget {
  const FeedFutureBuilder({
    super.key,
    required IPostService postService,
  }) : _postService = postService;

  final IPostService _postService;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>?>(
      future: _postService.fetchPostItemsAdvance(),
      builder: (BuildContext context, AsyncSnapshot<List<PostModel>?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Placeholder();

          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());

          case ConnectionState.active:
            return const Center(child: CircularProgressIndicator());

          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data?[index].body ?? ''),
                    ),
                  );
                },
              );
            } else {
              return const Placeholder();
            }
        }
      },
    );
  }
}
