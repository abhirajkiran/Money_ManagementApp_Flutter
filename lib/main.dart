import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_app/models/category/category_model.dart';
import 'package:money_app/models/transaction/transaction_model.dart';
import 'package:money_app/screens/add_transaction/screen_add_transaction.dart';
import 'package:money_app/screens/home/screen_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
      Hive.registerAdapter(CategoryTypeAdapter());
  }


  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
      Hive.registerAdapter(CategoryModelAdapter());
  }


  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
      Hive.registerAdapter(TransactionModelAdapter());
  }
  runApp(const MyApp());
}

mixin CatergoryModelAdapter {
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ScreenHome(),
        routes: {
          ScreenaddTransaction.routeName:(ctx)=>const ScreenaddTransaction(),
        },
        
        );
        
  }
}
