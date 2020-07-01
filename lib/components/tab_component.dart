import 'package:flutter/material.dart';
import 'package:flutter_hands_on/main.dart';
import 'package:flutter_hands_on/components/product_card.dart';
import 'package:flutter_hands_on/pages/tab_store.dart';
import 'package:flutter_hands_on/pages/tab_profile.dart';

class _TabComponent extends State {

  int _currentIndex = 0;

  Widget callPage(int currentIndex) {
    switch(currentIndex) {
      case 0: return ProductCard();
      case 1: return TabStore();
      case 2: return TabProfile();

      break;
      default: return ProductCard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SUZURI"),
      ),
      body: Column(
        children: <Widget>[
          callPage(_currentIndex),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex = value;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("ホーム"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            title: Text("カート"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("あなた"),
          ),
        ],
      ),
    );

  }

}