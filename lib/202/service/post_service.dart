import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:starter_package/202/service/comment_model.dart';
import 'package:starter_package/202/service/post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<CommentModel>?> fetchReleatedCommentsWithPostId(int postId);
}

class PostService implements IPostService {
  late final Dio _networkManager;
  PostService() : _networkManager = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response = await _networkManager.post(_PostServicePaths.posts.name, data: postModel);

      return response.statusCode == HttpStatus.created;
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _networkManager.get(_PostServicePaths.posts.name);

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          return datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
      // hata olma durumuna gore burasi doldurulur. enxeption yapilir
    }
    return null;
  }

  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try {
      final response = await _networkManager.put("${_PostServicePaths.posts.name}/$id", data: postModel);

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _networkManager.delete("${_PostServicePaths.posts.name}/$id");

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return false;
  }

  @override
  Future<List<CommentModel>?> fetchReleatedCommentsWithPostId(int postId) async {
    try {
      final response = await _networkManager
          .get(_PostServicePaths.comments.name, queryParameters: {_PostQueryPaths.postId.name: postId});

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          return datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
      // hata olma durumuna gore burasi doldurulur. enxeption yapilir
    }
    return null;
  }
}

enum _PostServicePaths { posts, comments }

enum _PostQueryPaths { postId }

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
    }
  }
}
