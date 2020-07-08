import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hands_on/components/product_card.dart';
import 'package:flutter_hands_on/pages/page_product_list.dart';
import 'package:flutter_hands_on/stores/product_list_store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hands_on/pages/product_detail.dart';
import 'package:flutter_hands_on/stores/product_list_store.dart';
import 'package:provider/provider.dart';

// main()はFlutterアプリケーションのエントリポイントです
// main()の中で、runAppにルートとなるウィジェットを格納して呼ぶ必要があります
void main() async {
  await DotEnv().load('.env.sample');
  runApp(MultiProvider(

    providers: [

      ChangeNotifierProvider(
        create: (context) => ProductListStore(),
      )
    ],

    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final store = Provider.of<ProductListStore>(context, listen: false);
    if(store.products.isEmpty && store.isFetching == false) {
      store.fetchNextProducts();
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),

      routes: {
        ProductDetail.routeName: (context) => ProductDetail(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SUZURI"),
      ),
      body: PageProductList(),
    );
  }
}
