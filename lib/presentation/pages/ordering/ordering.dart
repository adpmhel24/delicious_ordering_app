// import 'package:badges/badges.dart';
// import 'package:delicious_ordering/common_bloc/cart_bloc/bloc.dart';
// import 'package:delicious_ordering/common_bloc/products_bloc/bloc.dart';
// import 'package:delicious_ordering/data/repositories/repositories.dart';
// import 'package:delicious_ordering/presentation/pages/cart/cart.dart';
// import 'package:delicious_ordering/presentation/pages/ordering/bloc/bloc.dart';
// import 'package:delicious_ordering/presentation/widgets/app_drawer.dart';
// import 'package:delicious_ordering/utils/navigation_handler.dart';
// import 'package:double_back_to_close_app/double_back_to_close_app.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'components/body.dart';

// class OrderingPage extends StatelessWidget {
//   static final String routeName = '/ordering';

//   static Route route() {
//     return MaterialPageRoute<void>(builder: (_) => OrderingPage());
//   }

//   const OrderingPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     CartRepo _cartRepo = AppRepo.cartRepository;
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<ProductsBloc>(
//           create: (_) => ProductsBloc()
//             ..add(
//               FetchProductFromLocal(),
//             ),
//         ),
//         BlocProvider<ProductSelectionBloc>(
//           create: (_) => ProductSelectionBloc(),
//         ),
//       ],
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Ordering'),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Badge(
//                 badgeContent: BlocBuilder<ProductSelectionBloc, ProductSelectionState>(
//                   builder: (context, state) {
//                     return BlocBuilder<CartBloc, CartState>(
//                       builder: (context, state) {
//                         return Text(_cartRepo.cartItemsCount.toString());
//                       },
//                     );
//                   },
//                 ),
//                 child: IconButton(
//                   onPressed: () {
//                     context.read<CartBloc>().add(LoadCart());
//                     Go.to(context, CartPage());
//                   },
//                   icon: Icon(Icons.shopping_cart_sharp),
//                 ),
//               ),
//             )
//           ],
//         ),
//         drawer: AppDrawer(),
//         body: DoubleBackToCloseApp(
//           snackBar: const SnackBar(
//             content: Text('Tap back again to leave'),
//           ),
//           child: OrderingProductPage(),
//         ),
//       ),
//     );
//   }
// }



