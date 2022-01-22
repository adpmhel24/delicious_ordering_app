import 'package:delicious_ordering/app_routers.dart';
import 'package:delicious_ordering/common_bloc/cust_type_bloc/cust_type_bloc.dart';
import 'package:delicious_ordering/common_bloc/cust_type_bloc/cust_type_event.dart';
import 'package:delicious_ordering/common_bloc/customer_bloc/bloc.dart';
import 'package:delicious_ordering/common_bloc/products_bloc/bloc.dart';
import 'package:delicious_ordering/configs/size_config.dart';
import 'package:delicious_ordering/presentation/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common_bloc/common_bloc.dart';
import 'common_bloc/auth_bloc/auth_bloc.dart';
import 'common_bloc/auth_bloc/auth_state.dart';
import 'presentation/pages/ordering/ordering_home.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  void dispose() {
    CommonBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delicious Ordering System',
      navigatorKey: _navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Color(0xff393e46),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Color(0xFFFFF89A),
            primary: Color(0xFF1A5F7A),
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xFF876445)),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered))
                  return Colors.white.withOpacity(0.04);
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed))
                  return Colors.white.withOpacity(0.12);
                return null; // Defer to the widget's default.
              },
            ),
          ),
        ),
        textTheme: GoogleFonts.merriweatherTextTheme().copyWith(
          headline1: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.merriweather().fontFamily,
          ),
          headline2: TextStyle(
            fontSize: SizeConfig.defaultSize * 2,
            fontWeight: FontWeight.bold,
            color: Color(0xFFB3541E),
            fontStyle: FontStyle.italic,
            fontFamily: GoogleFonts.merriweather().fontFamily,
            letterSpacing: 1.0,
          ),
          headline3: TextStyle(
            fontSize: SizeConfig.defaultSize * 1.2,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.merriweather().fontFamily,
            letterSpacing: 1.0,
          ),
          subtitle1: TextStyle(
            fontSize: SizeConfig.defaultSize * 1.5,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.merriweather().fontFamily,
            letterSpacing: 1.0,
          ),
          subtitle2: TextStyle(
            fontSize: SizeConfig.defaultSize,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.merriweather().fontFamily,
            letterSpacing: 1.0,
          ),
          bodyText1: TextStyle(
            fontSize: SizeConfig.defaultSize * 1.5,
            fontFamily: GoogleFonts.merriweather().fontFamily,
          ),
          bodyText2: TextStyle(
            fontSize: SizeConfig.defaultSize * 1.2,
            fontFamily: GoogleFonts.merriweather().fontFamily,
          ),
        ),
      ),
      routes: AppPages.appPages,
      initialRoute: LoginPage.routeName,
      builder: (_, child) {
        return Builder(builder: (_) {
          return BlocListener<AuthBloc, AuthState>(
            listener: (_, authState) async {
              if (authState is Authenticated) {
                context.read<CustomerBloc>()..add(FetchCustomerFromAPI());
                context.read<CustTypeBloc>()..add(FetchCustTypeFromAPI());
                context.read<ProductsBloc>()..add(FetchProductFromAPI());

                _navigator.pushAndRemoveUntil<void>(
                  OrderingHomePage.route(),
                  (route) => false,
                );
                // await AppRepo.customerTypeRepository.fetchCustomerType();
              } else {
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
              }
            },
            child: child,
          );
        });
      },
    );
  }
}
