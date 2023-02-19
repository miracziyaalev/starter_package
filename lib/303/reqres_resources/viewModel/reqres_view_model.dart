import 'package:starter_package/303/reqres_resources/model/resources_model.dart';
import 'package:starter_package/product/base_states/loading_state.dart';

import '../../../product/service/project_dio.dart';
import '../service/reqres_service.dart';
import '../view/reqres_view.dart';

abstract class ReqresViewModel extends LoadingStatefull<ReqresView> with ProjectDioMixin {
  late final IReqresService reqresService;

  List<Data> resources = [];

  @override
  void initState() {
    reqresService = ReqresService(service);
    _fetch();
    super.initState();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourcesItem())?.data ?? [];
    changeLoading();
  }
}
