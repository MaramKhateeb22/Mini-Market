import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '/Feature/auth/presentaion/manager/cubit/user_cubit.dart';
import '/Feature/cart/data/repos/cart_repo.dart';
import '/Feature/cart/presentation/manager/cubit/cart_cubit.dart';

import '/Feature/cart/presentation/views/cart_view.dart';
import '/Feature/product/presentation/manager/cubit/all_product_cubit.dart';
import '/Feature/product/presentation/views/detail_product_view.dart';
import 'Feature/auth/data/repos/user_repo.dart';
import 'Feature/auth/presentaion/views/select_page_view.dart';
import 'Feature/auth/presentaion/views/sign_in_view.dart';
import 'Feature/auth/presentaion/views/sign_up_view.dart';
import 'Feature/auth/presentaion/views/splash_view.dart';
import 'Feature/cart/data/models/all_carts_model.dart';
import 'Feature/cart/data/models/get_single_product.dart';
import 'Feature/cart/presentation/manager/provider/cart_provider.dart';
import 'Feature/cart/presentation/views/widget/custom_one_cart.dart';
import 'Feature/home/presentation/views/home_view.dart';
import 'Feature/product/data/data/model/all_product_model.dart';
import 'Feature/product/data/data/repos/all_product_repos.dart';
import 'core/cache_helper/cache_helper.dart';
import 'core/utils/api/dio_consumer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await cacheHelper.initInstance();
  runApp(
    const MyApp(),

    // DevicePreview(
    //   enabled: true,
    //   tools: const [
    //     ...DevicePreview.defaultTools,
    //   ],
    //   builder: (context) => const MyApp(),
    // ),
  );
}
final GoRouter _router = GoRouter(
  initialLocation: '/splash_view',
  routes: <RouteBase>[
    GoRoute(
        path: '/splash_view',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        }
    ), GoRoute(
        path: '/home_view',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        }
    ),
    GoRoute(
        path: '/select_pageView',
        builder: (BuildContext context, GoRouterState state) {
          return const SelectPageView();
        }
    ),
    GoRoute(
        path: '/sign_in_view',
        builder: (BuildContext context, GoRouterState state) {
          return const SignInView();
        }
    ),
    // GoRoute(
    //     path: '/sign_up_view',
    //     builder: (BuildContext context, GoRouterState state) {
    //       return const SignUpView();
    //     }
    // ),
    GoRoute(
        path: '/cart_view',
        builder: (BuildContext context, GoRouterState state) {
          return const CartView();
        }
    ),
    GoRoute(
        path: '/detail_product_view',
        builder: (BuildContext context, GoRouterState state) {
          final AllProductMdel product = state.extra as AllProductMdel;
          return  DetailProductView(product: product);
        }
    ),
    GoRoute(
        path: '/custom_one_cart',
        builder: (BuildContext context, GoRouterState state) {
          // final AllCartsModel item = state.extra as AllCartsModel;
          final  AllCartsModel item = state.extra as AllCartsModel ;
          return CustomOneCart(item: item,);
        }
    ),
  ],
);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context,child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<UserCubit>(create: (context) => UserCubit( UserRepository(api: DioConsumer(dio: Dio()),),),  ),
            BlocProvider<AllProductubit>(create: (context) => AllProductubit( AllProductRepository(api: DioConsumer(dio: Dio()),),),  ),
            BlocProvider<CartCubit>(create: (context) => CartCubit( CartRepository(api: DioConsumer(dio: Dio()),),),  ),
            ChangeNotifierProvider<ProviderCart>(
              create: (context) => ProviderCart(),)
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            // localizationsDelegates: const [
            //   GlobalCupertinoLocalizations.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            // ],
            // supportedLocales: const [
            //   Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
            // ],
            // locale: const Locale("ar", "AE"),
            routerConfig: _router,
            theme: ThemeData(
            iconTheme: IconThemeData(
              color:  Colors.grey,
              size: 28,
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),

          ),
        );
      }
    );
  }
}

