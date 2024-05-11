import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/Feature/cart/presentation/views/cart_view.dart';
import '/Feature/product/presentation/manager/cubit/all_product_cubit.dart';
import '/Feature/product/presentation/views/all_product_view.dart';

import '../../../../auth/presentaion/views/profile_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;
  final List<Widget> _pages = [

    AllProductView(),
    CartView(),
    ProfileView(),

  ];


  // int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    final  List<Widget> _navigationItems = <Widget>  [

      Icon(Icons.home, color: currentIndex == 0 ? Colors.white : Colors.grey),
      Icon(Icons.shopping_cart, color: currentIndex == 1 ? Colors.white : Colors.grey),
      Icon(Icons.person, color: currentIndex == 2 ? Colors.white : Colors.grey),

    ];

    return Scaffold(

      body: _pages[currentIndex],
      bottomNavigationBar:CurvedNavigationBar(
        // key: _bottomNavigationKey,
        index: currentIndex,

        height: 50.0,
        items:_navigationItems,
        color: Colors.white,
        buttonBackgroundColor: Colors.greenAccent,
        backgroundColor: Colors.white,

        // animationCurve: Curves.bounceIn,

        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(
                () {
              currentIndex = index;
            },
          );
        },
      ),


    );
}
}
