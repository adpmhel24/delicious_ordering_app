import 'package:auto_route/auto_route.dart';
import 'package:delicious_ordering/presentation/pages/add_customer/new_customer.dart';
import 'package:delicious_ordering/presentation/pages/add_order/ordering_home.dart';
import 'package:delicious_ordering/presentation/pages/login/login.dart';
import 'package:delicious_ordering/presentation/pages/orders/orders.dart';
import 'package:delicious_ordering/presentation/pages/orders_for_dispo/orders_for_dispo.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: LoginPage,
      name: 'LoginPageRoute',
      path: '/login',
    ),
    // AutoRoute(
    //   page: DashboardScreen,
    //   name: 'DashboardRoute',
    //   path: '/dashboard',
    //   children: <AutoRoute>[
    //     AutoRoute<EmptyRouterPage>(
    //       name: 'ProductsRoute',
    //       path: 'products',
    //       page: EmptyRouterPage,
    //       children: [
    //         AutoRoute(
    //           page: ProductsScreen,
    //           path: '',
    //         ),
    //         AutoRoute(
    //             page: AddProductsScreen,
    //             name: 'AddProductsRoute',
    //             path: 'add_products'),
    //       ],
    //     ),
    //     AutoRoute(page: ProfileScreen, name: 'ProfileRoute', path: 'profile')
    //   ],
    // ),
    AutoRoute(
        page: OrderingHomePage,
        name: 'OrderingHomePageRoute',
        path: '/add_order',
        initial: true),
    AutoRoute(
      page: OrdersPage,
      name: 'OrdersPageRoute',
      path: '/my_orders',
    ),
    AutoRoute(
      page: AddingCustomerPage,
      name: 'AddingCustomerPageRoute',
      path: '/add_new_customer',
    ),
    AutoRoute(
      page: OrdersForDispo,
      name: 'OrdersForDispoRoute',
      path: '/orders_for_dispo',
    ),
  ],
)
class $AppRouter {}
