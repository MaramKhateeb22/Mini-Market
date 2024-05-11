// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:smile_shop/Feature/auth/presentaion/manager/cubit/user_cubit.dart';
// import 'package:smile_shop/Feature/auth/presentaion/views/widget/custom_text_form_feild.dart';
// import 'package:smile_shop/core/utils/styles.dart';
// import 'package:smile_shop/core/widgets/custom_button.dart';
//
// import '../../../../../core/widgets/custom_text_button_gradient.dart';
// import '../../manager/cubit/user_state.dart';
//
// class SignUpViewBody extends StatelessWidget {
//   SignUpViewBody({super.key});
//   String? email;
//   String? password;
//
//   final GlobalKey<FormState> form = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<UserCubit,userState>(
//       listener: (context, state) {
//
//       },
//       builder: (context,state) {
//         return Form(
//           key: context.read<UserCubit>().signUpFormKey,
//           child: Scaffold(
//             body: Padding(
//               padding: EdgeInsets.all(30),
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                   const  Text(
//                       'إنشاء حساب',
//                       style: Styles.style28,
//                     ),
//                    const SizedBox(
//                       height: 20,
//                     ),
//                     CustomTextFormField(
//                       hintText: 'أدخل بريدك الالكتروني',
//                       typeField: 'email',
//                     controller: context.read<UserCubit>().signUpEmail,
//                     ),
//                   const  SizedBox(
//                       height: 20,
//                     ),
//                     CustomTextFormField(
//
//                       hintText: 'أدخل كلمة المرور',
//                       typeField: 'password',
//                         controller: context.read<UserCubit>().signUpPassword,
//
//                     ),
//                   const  SizedBox(
//                       height: 10,
//                     ),
//                     CustomButton(
//                       text: 'إنشاء حساب',
//                       onTaps: () {
//
//                         if (context.read<UserCubit>().signUpFormKey.currentState?.validate() ?? false) {
//                           print('$password' ' hello');
//                         }
//                       },
//                     ),
//
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'لديك حساب مسبقاً؟',
//                           style: Styles.style18,
//                         ),
//                         CustomTextButtonGradient(
//                           nextPage: '/sign_in_view',
//                           text: 'تسجيل دخول',
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       }
//     );
//   }
// }
