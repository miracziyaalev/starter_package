import '../../303/reqres_resources/model/resources_model.dart';

class ResourceContext {
  ResourcesModel? model;

  void saveModel(ResourcesModel? model) {
    this.model = model;
  }

  void clear() {
    model = null;
  }
}
