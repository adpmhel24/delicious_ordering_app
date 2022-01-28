// import 'package:delicious_ordering/common_bloc/cart_bloc/bloc.dart';
// import 'package:delicious_ordering/configs/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CartTableView extends StatelessWidget {
//   // final List<CartItem> cartItems;
//   const CartTableView({
//     Key? key,
//     // required this.cartItems,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartBloc, CartState>(
//       buildWhen: (prevState, currState) =>
//           currState is CartLoaded || currState is EmptyCart,
//       builder: (context, state) {
//         if (state is CartLoaded) {
//           // return ListView.builder(
//           //   shrinkWrap: true,
//           //   physics: NeverScrollableScrollPhysics(),
//           //   itemCount: state.cartItems.length,
//           //   itemBuilder: (context, index) {
//           //     return DismissibleCart(cartItem: state.cartItems[index]);
//           //   },
//           // );
//           return SizedBox(
//             width: double.infinity,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 onSelectAll: (value) {
//                   context.read<CartBloc>()..add(ToggleSelectAllCartItem());
//                 },
//                 columns: [
//                   DataColumn(
//                     label: FittedBox(
//                       fit: BoxFit.fitWidth,
//                       child: Text(
//                         'Item Code',
//                         style: Theme.of(context).textTheme.headline4,
//                       ),
//                     ),
//                   ),
//                   DataColumn(
//                     label: FittedBox(
//                       fit: BoxFit.fitWidth,
//                       child: Text(
//                         'Quantity',
//                         style: Theme.of(context).textTheme.headline4,
//                       ),
//                     ),
//                   ),
//                   DataColumn(
//                     label: FittedBox(
//                       fit: BoxFit.fitWidth,
//                       child: Text(
//                         'Unit Price',
//                         style: Theme.of(context).textTheme.headline4,
//                       ),
//                     ),
//                   ),
//                   DataColumn(
//                     label: FittedBox(
//                       fit: BoxFit.fitWidth,
//                       child: Text(
//                         'Total',
//                         style: Theme.of(context).textTheme.headline4,
//                       ),
//                     ),
//                   ),
//                 ],
//                 rows: state.cartItems.asMap().entries.map((e) {
//                   return DataRow(
//                     cells: [
//                       DataCell(
//                         FittedBox(
//                           alignment: Alignment.centerLeft,
//                           fit: BoxFit.fitWidth,
//                           child: Text(
//                             e.value.itemCode,
//                           ),
//                         ),
//                       ),
//                       DataCell(
//                         FittedBox(
//                           alignment: Alignment.centerLeft,
//                           fit: BoxFit.fitWidth,
//                           child: Text(
//                             e.value.quantity.toString(),
//                           ),
//                         ),
//                       ),
//                       DataCell(
//                         FittedBox(
//                           alignment: Alignment.centerLeft,
//                           fit: BoxFit.fitWidth,
//                           child: Text(
//                             e.value.unitPrice.toString(),
//                           ),
//                         ),
//                       ),
//                       DataCell(
//                         FittedBox(
//                           alignment: Alignment.centerLeft,
//                           fit: BoxFit.fitWidth,
//                           child: Text(
//                             e.value.total.toString(),
//                           ),
//                         ),
//                       ),
//                     ],
//                     onSelectChanged: (_) {
//                       context.read<CartBloc>()
//                         ..add(ToggleIsSelectedCartItem(e.key));
//                     },
//                     selected: e.value.isSelected,
//                   );
//                 }).toList(),
//               ),
//             ),
//           );
//         }
//         return Padding(
//           padding: EdgeInsets.all(20),
//           child: Center(
//             child: Text('No Item In Cart'),
//           ),
//         );
//       },
//     );
//   }
// }
