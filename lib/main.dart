import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hands_on/components/product_card.dart';
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
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(),
          body: _productsList(context),
//          bottomNavigationBar: BottomNavigationBar(
//            currentIndex: 0,
//            items: [
//              BottomNavigationBarItem(
//                icon: Icon(Icons.home),
//                title: Text("ホーム"),
//              ),
//              BottomNavigationBarItem(
//                icon: Icon(Icons.local_grocery_store),
//                title: Text("カート"),
//              ),
//              BottomNavigationBarItem(
//                icon: Icon(Icons.person),
//                title: Text("あなた"),
//              ),
//            ],
//          ),
        ),
      ),
    );
  }

  Widget _productsList(BuildContext context) {

    final store = Provider.of<ProductListStore>(context);
    final products = store.products;

    if (products.isEmpty) {
      return Container(
        // GridViewはウィジェットをグリッドで表示してくれるウィジェット
        // iOS UIKitで言うところの UICollectionView
        // GridView.builderというfactory(カスタムコンストラクタ)で初期化する
        child: Column(
          children: <Widget>[
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // グリッド横方向のウィジェット数
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  // グリッド表示するウィジェットの縦横比
                  childAspectRatio: 0.7,
                ),
                // グリッドに表示したいウィジェットの数
                itemCount: products.length,
                // itemBuilderはGridViewのインデックス毎に表示したいウィジェットを返すデリゲート
                // context, indexを引数にとり、ウィジェットを返す関数を指定してやる
                // itemContの回数だけ呼ばれる、この例では6回
                itemBuilder: (context, index) {
                  // とりあえずグレーのコンテナを表示してみる
                  return ProductCard(product: products[index],);
                }
            ),
          ],
        ),
      );
    } else {
      return Container(

        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            }
        ),
      );
    }
  }
}
