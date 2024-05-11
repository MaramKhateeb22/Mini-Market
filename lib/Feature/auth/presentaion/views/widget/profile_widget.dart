
import 'package:flutter/material.dart';

import '../../../../../core/widgets/sub_text.dart';
import '../../../../../core/widgets/title_text.dart';
import '../../../data/models/user_model.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key,required this.userProfile});
  UserModel userProfile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              TitleText(title: 'First Name',),
              SubText(subTitle:'${userProfile.name!.firstname}'),
            ],
          ),
          Row(
            children: [
              TitleText(title: 'Last Name',),
              SubText(subTitle:'${userProfile.name!.lastname}'),
            ],
          ),
          Row(
            children: [
              TitleText(title: 'Email',),
              SubText(subTitle:'${userProfile.email}'),
            ],
          ),
          Row(
            children: [
              TitleText(title: 'Password',),
              SubText(subTitle:'${userProfile.password}'),
            ],
          ),
          Row(
            children: [
              const TitleText(title: 'phone ',),
              SubText(subTitle:'${userProfile.phone}'),
            ],
          ),
          Row(
            children: [
              TitleText(title: 'city',),
              SubText(subTitle:'${userProfile.address!.city}'),
            ],
          ),
          Row(
            children: [
              TitleText(title: 'street',),
              SubText(subTitle:'${userProfile.address!.street}'),

            ],
          ),


        ],),
    );
  }
}

