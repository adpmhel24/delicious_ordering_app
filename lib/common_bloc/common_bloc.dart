import 'package:delicious_ordering/common_bloc/auth_bloc/bloc.dart';
import 'package:delicious_ordering/common_bloc/cart_bloc/cart_bloc.dart';
import 'package:delicious_ordering/common_bloc/customer_bloc/bloc.dart';
import 'package:delicious_ordering/common_bloc/disc_type_bloc/bloc.dart';
import 'package:delicious_ordering/common_bloc/order_bloc/bloc.dart';
import 'package:delicious_ordering/common_bloc/products_bloc/products_bloc.dart';
import 'package:delicious_ordering/common_bloc/sales_type_bloc/bloc.dart';
import 'package:delicious_ordering/common_bloc/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonBloc {
  static final authBloc = AuthBloc();
  static final productsBloc = ProductsBloc();
  static final cartBloc = CartBloc();
  static final customerBloc = CustomerBloc();
  static final salesTypeBloc = SalesTypeBloc();
  static final discTypeBloc = DiscTypeBloc();
  static final ordersBloc = OrdersBloc();
  static final custTypeBloc = CustTypeBloc();
  // static final appInitBloc = AppInitBloc();

  static final List<BlocProvider> blocProviders = [
    BlocProvider<AuthBloc>(create: (context) => authBloc),
    BlocProvider<ProductsBloc>(create: (context) => productsBloc),
    BlocProvider<CartBloc>(create: (context) => cartBloc),
    BlocProvider<CustomerBloc>(create: (context) => customerBloc),
    BlocProvider<SalesTypeBloc>(create: (context) => salesTypeBloc),
    BlocProvider<DiscTypeBloc>(create: (context) => discTypeBloc),
    BlocProvider<OrdersBloc>(create: (context) => ordersBloc),
    BlocProvider<CustTypeBloc>(create: (context) => custTypeBloc),
    // BlocProvider<AppInitBloc>(
    //     create: (context) => appInitBloc..add(OpeningApp())),
  ];

  static void dispose() {
    authBloc.close();
    productsBloc.close();
    cartBloc.close();
    customerBloc.close();
    salesTypeBloc.close();
    discTypeBloc.close();
    ordersBloc.close();
    custTypeBloc.close();
    // appInitBloc.close();
  }

  /// Singleton factory
  static final CommonBloc _instance = CommonBloc._internal();

  factory CommonBloc() {
    return _instance;
  }
  CommonBloc._internal();
}
