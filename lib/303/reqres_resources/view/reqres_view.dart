import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_package/101/11_image_learn.dart';
import 'package:starter_package/303/reqres_resources/service/reqres_service.dart';
import 'package:starter_package/303/reqres_resources/viewModel/reqres_provider.dart';
import 'package:starter_package/product/extension/string_color_extension.dart';
import 'package:starter_package/product/global/resource_context.dart';
import 'package:starter_package/product/global/theme_notifer.dart';
import 'package:starter_package/product/service/project_network_manager.dart';

import '../model/resources_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({super.key});

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

//class _ReqresViewState extends ReqresViewModel
class _ReqresViewState extends State<ReqresView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      create: (context) => ReqresProvider(ReqresService(ProjectNetworkManager.instance.service)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifer>().changeTheme();
            },
          ),
          appBar: AppBar(
              actions: const [_SaveAndNavigateWidget()],
              title: context.watch<ReqresProvider>().isLoading ? const CircularProgressIndicator() : null),
          body: Column(
            children: [
              const _TempPlaceHolder(),
              Expanded(child: _resourceListview(context, context.watch<ReqresProvider>().resources)),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListview(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        //resources[index].colorValue seklinde modele entegre edilebilir. ya da globalse
        // extension yazilir
        return Card(color: Color(items[index].color?.colorValue ?? 0), child: Text(items[index].name ?? ''));
      },
    );
  }
}

class _SaveAndNavigateWidget extends StatelessWidget {
  const _SaveAndNavigateWidget();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<ReqresProvider>().saveToLocale(context.read<ResourceContext>());
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) {
              return const ImageLearn();
            },
          ));
        },
        child: const Icon(Icons.ac_unit));
  }
}

class _TempPlaceHolder extends StatelessWidget {
  const _TempPlaceHolder();

  @override
  Widget build(BuildContext context) {
    return Selector<ReqresProvider, bool>(
      builder: (context, value, child) {
        return value ? const Placeholder() : const Text('data');
      },
      selector: (context, provider) {
        return provider.isLoading;
      },
    );
  }
}
