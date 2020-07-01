import 'package:flutter/material.dart';
import 'package:flutter_hands_on/components/product_card.dart';

class PageProductList extends StatelessWidget {
  // 画面を遷移するために必要なウィジェットの名前を定義する
  static const routeName = "/productDetail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // GridViewはウィジェットをグリッドで表示してくれるウィジェット
        // iOS UIKitで言うところの UICollectionView
        // GridView.builderというfactory(カスタムコンストラクタ)で初期化する
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // グリッド横方向のウィジェット数
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              // グリッド表示するウィジェットの縦横比
              childAspectRatio: 0.7,
            ),
            // グリッドに表示したいウィジェットの数
            itemCount: 6,
            // itemBuilderはGridViewのインデックス毎に表示したいウィジェットを返すデリゲート
            // context, indexを引数にとり、ウィジェットを返す関数を指定してやる
            // itemContの回数だけ呼ばれる、この例では6回
            itemBuilder: (context, index) {
              // とりあえずグレーのコンテナを表示してみる
              return ProductCard();
            }),
      ),
    );
  }
}
