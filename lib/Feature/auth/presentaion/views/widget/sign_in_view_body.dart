

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '/Feature/auth/presentaion/manager/cubit/user_cubit.dart';
import '/Feature/auth/presentaion/views/widget/custom_text_form_feild.dart';
import '/core/utils/styles.dart';
import '/core/widgets/custom_button.dart';

import '../../../../../core/widgets/custom_text_button_gradient.dart';
import '../../manager/cubit/user_state.dart';

class SignInViewBody extends StatelessWidget {
  SignInViewBody({super.key});
  String? email;
  String? password;

  final GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,userState>(
      listener: (context, state) {
        if (state is SiginInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("success"),
            ),

          );
          context.go('/splash_view');

        } else if (state is SiginInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }

      },
      builder: (context,state) {
        return Form(
          key: context.read<UserCubit>().signInFormKey,
          child: Scaffold(
            body:Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                        // AssetImage('assets/images/photo_٢٠٢٤-٠٤-١٩_١١-٠٦-٤١.jpg'),
                        AssetImage('assets/images/photo_20jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  color: const Color.fromARGB(68, 232, 231, 231).withOpacity(0.4),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Center(
                    child: SingleChildScrollView(
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const  Text(
                            'Sign In',
                            style: Styles.style28,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            hintText: 'Enter Your Name',
                            typeField: 'email',
                            controller: context.read<UserCubit>().signInEmail,
                          ),
                          const  SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                            hintText: 'Enter Pssword',
                            typeField: 'password',
                            controller: context.read<UserCubit>().signInPassword,
                          ),
                          const  SizedBox(
                            height: 10,
                          ),
                          state is SiginInLoading
                              ? const CircularProgressIndicator()
                              :   CustomButton(
                            text: 'Sign In',
                            onTaps: () {
                              if (context.read<UserCubit>().signInFormKey.currentState?.validate() ?? false) {

                                BlocProvider.of<UserCubit>(context).signIn(
                                    userName:context.read<UserCubit>().signInEmail.text,
                                    pAssword:context.read<UserCubit>().signInPassword.text);

                              }
                            },
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "don't have an account?  ",
                                style: Styles.style18,
                              ),
                              CustomTextButtonGradient(
                                // nextPage: '/sign_up_view',
                                text: 'Sign Up',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )

          ),
        );
      }
    );
  }
}
