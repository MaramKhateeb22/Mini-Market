import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/Feature/auth/data/models/user_model.dart';
import '/Feature/auth/presentaion/manager/cubit/user_cubit.dart';

import 'profile_widget.dart';


class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FutureBuilder<dynamic>(future: context.read<UserCubit>().getUserProfile(),
          builder:(context, snapshot)
      {
        if (snapshot.connectionState == ConnectionState.waiting) {

          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {

          return Center(child: Text('happen an error ${snapshot.error}'));
        } else {
      UserModel userPpofile =context.read<UserCubit>().userProfile!;
          return ProfileWidget(userProfile: userPpofile,);

          } }),);




  }

}


