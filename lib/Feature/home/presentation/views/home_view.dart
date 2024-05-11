import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/cache_helper/cache_helper.dart';
import '../../../../core/utils/styles.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                bool result = await   cacheHelper.clearUser();
                // await FirebaseAuth.instance.signOut();
                GoRouter.of(context).go('/splash_view');

                // Navigator.of(context).pushReplacementNamed("/");
              },
              icon: Icon(Icons.logout))
        ],

        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
      'Mini Market ',
          textAlign: TextAlign.center,
          style: Styles.style25,
        ),
      ) ,
      body: HomeViewBody(),
    );
  }
}
