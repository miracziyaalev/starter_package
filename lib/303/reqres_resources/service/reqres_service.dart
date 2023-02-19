// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:starter_package/303/reqres_resources/model/resources_model.dart';

enum _ReqresPaths { unknown }

abstract class IReqresService {
  IReqresService(this.dio);

  final Dio dio;

  Future<ResourcesModel?> fetchResourcesItem();
}

class ReqresService extends IReqresService {
  ReqresService(Dio dio) : super(dio);

  @override
  Future<ResourcesModel?> fetchResourcesItem() async {
    final response = await dio.get(_ReqresPaths.unknown.name);

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;

      if (jsonBody is Map<String, dynamic>) {
        return ResourcesModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
