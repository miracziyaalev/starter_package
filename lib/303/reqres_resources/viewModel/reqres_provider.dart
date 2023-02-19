import 'package:flutter/material.dart';
import 'package:starter_package/product/global/resource_context.dart';

import '../model/resources_model.dart';
import '../service/reqres_service.dart';

class ReqresProvider extends ChangeNotifier {
  ReqresProvider(this.reqresService) {
    _fetch();
  }

  final IReqresService reqresService;
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  List<Data> resources = [];

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqresService.fetchResourcesItem())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourcesModel(data: resources));
  }
}
