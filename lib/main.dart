import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skilltest/core/themes/themes.dart';
import 'package:skilltest/features/auth/bloc/auth_bloc.dart';
import 'package:skilltest/features/home/bloc/banners/bloc/banner_bloc.dart';
import 'package:skilltest/features/home/bloc/products/bloc/product_bloc.dart';
import 'package:skilltest/features/splash/pages/splash_page.dart';
import 'package:skilltest/features/wishlist/bloc/wishlist_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductBloc()),
        BlocProvider(create: (_) => BannerBloc()),
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => WishlistBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Builder(
        builder: (context) {
          final m = MediaQuery.of(context);
          return MediaQuery(
            data: m.copyWith(textScaler: const TextScaler.linear(1)),
            child: MaterialApp(
              theme: themeData,
              debugShowCheckedModeBanner: false,
              home: SplashPage(),
            ),
          );
        },
      ),
    );
  }
}
