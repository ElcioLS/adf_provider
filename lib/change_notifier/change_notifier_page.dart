import 'package:adf_provider/change_notifier/provider_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 1));
      context.read<ProviderController>().alterarDados();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Selector<ProviderController, String>(
                selector: (_, controller) => controller.imgAvatar,
                builder: (_, imgAvatar, __) {
                  return CircleAvatar(
                    backgroundImage: NetworkImage(imgAvatar),
                    radius: 60,
                  );
                },
              ),
              // Consumer<ProviderController>(
              //   builder: (_, controller, __) {
              //     return CircleAvatar(
              //       backgroundImage: NetworkImage(controller.imgAvatar),
              //       radius: 60,
              //     );
              //   },
              // ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Selector<ProviderController, String>(
                  //   selector: (_, controller) => controller.name,
                  //   builder: (_, name, __) {
                  //     return Text(name);
                  //   },
                  // ),

                  // Consumer<ProviderController>(
                  //   builder: (_, controller, __) {
                  //     return Text(controller.name);
                  //   },
                  // ),
                  //Selector tuple2
                  Selector<ProviderController, Tuple2<String, String>>(
                    selector: (_, controller) =>
                        Tuple2(controller.birthDate, controller.name),
                    builder: (_, tuple, __) {
                      return Text('${tuple.item2}(${tuple.item1})');
                    },
                  ),
                  //
                  // Selector
                  Selector<ProviderController, String>(
                    selector: (_, controller) => controller.birthDate,
                    builder: (_, birthDate, __) {
                      return Text('($birthDate)');
                    },
                  ),
                  //
                  //
                  // Consumer<ProviderController>(
                  //   builder: (_, controller, __) {
                  //     return Text('(${controller.birthDate})');
                  //   },
                  // ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<ProviderController>().alterarDados();
                  },
                  child: const Text('Alterar Nome'))
              // Provider(create: (_) => ProdutoModel(nome: 'Fábrica de apps'),
            ],
          ),
        ),
      ),
    );
  }
}
