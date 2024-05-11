import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/core/utils/styles.dart';
import '/core/widgets/custom_button.dart';

class SelectPageViewBody extends StatelessWidget {
  const SelectPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Welcome',style: Styles.style28,),
              SizedBox(height: 15,),
              CustomButton(text: 'Create Account', onTaps:(){
                // context.go('/sign_up_view');
              } ),
              SizedBox(height: 15,),
              CustomButton(text: 'SignIn', onTaps:(){
                context.go('/sign_in_view');
              } ),




            ],
          ),
        ),
      ),
    );
  }
}
