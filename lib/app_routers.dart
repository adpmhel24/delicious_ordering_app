import 'package:delicious_ordering/presentation/pages/add_order/ordering_home.dart';
import 'package:delicious_ordering/presentation/pages/orders_for_dispo/orders_for_dispo.dart';

import 'presentation/pages/add_customer/new_customer.dart';
// import 'presentation/pages/cart_and_checkout/cart.dart';
import 'presentation/pages/login/login.dart';
import 'presentation/pages/orders/orders.dart';

class AppPages {
  static var appPages = {
    LoginPage.routeName: (context) => const LoginPage(),
    OrderingHomePage.routeName: (context) => const OrderingHomePage(),
    OrdersPage.routeName: (context) => const OrdersPage(),
    AddingCustomerPage.routeName: (context) => const AddingCustomerPage(),
    OrdersForDispo.routeName: (context) => const OrdersForDispo(),
  };
}
