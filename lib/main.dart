import 'package:adf_provider/change_notifier/change_notifier_page.dart';
import 'package:adf_provider/change_notifier/provider_controller.dart';
import 'package:adf_provider/provider/provider_page.dart';
import 'package:adf_provider/provider/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) {
            return UserModel(
              name: 'Elcinho',
              imgAvatar:
                  'https://yt3.ggpht.com/ytc/AKedOLQwsaJxj8Ybra9SLnJX0fr8bxgXpv18nrxT6HTp=s900-c-k-c0x00ffffff-no-rj',
              birthDate: '01/01/2001',
            );
          },
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderController(),
        ),
      ],
      child: MaterialApp(
        // title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        routes: {
          '/provider': (_) => const ProviderPage(),
          '/change': (_) => const ChangeNotifierPage(),
        },
        home: Builder(
          builder: ((context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/provider');
                        },
                        child: const Text('Provider')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/change');
                        },
                        child: const Text('Change Notifier'))
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
