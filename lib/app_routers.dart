import 'package:delicious_ordering/presentation/pages/ordering/ordering_home.dart';

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
  };
}
