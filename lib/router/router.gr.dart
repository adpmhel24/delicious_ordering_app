// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../presentation/pages/add_customer/new_customer.dart' as _i4;
import '../presentation/pages/add_order/ordering_home.dart' as _i2;
import '../presentation/pages/login/login.dart' as _i1;
import '../presentation/pages/orders/orders.dart' as _i3;
import '../presentation/pages/orders_for_dispo/orders_for_dispo.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    OrderingHomePageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OrderingHomePage());
    },
    OrdersPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.OrdersPage());
    },
    AddingCustomerPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.AddingCustomerPage());
    },
    OrdersForDispoRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.OrdersForDispo());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(LoginPageRoute.name, path: '/'),
        _i6.RouteConfig(OrderingHomePageRoute.name, path: '/add_order'),
        _i6.RouteConfig(OrdersPageRoute.name, path: '/my_orders'),
        _i6.RouteConfig(AddingCustomerPageRoute.name,
            path: '/add_new_customer'),
        _i6.RouteConfig(OrdersForDispoRoute.name, path: '/orders_for_dispo')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginPageRoute extends _i6.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: '/');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i2.OrderingHomePage]
class OrderingHomePageRoute extends _i6.PageRouteInfo<void> {
  const OrderingHomePageRoute()
      : super(OrderingHomePageRoute.name, path: '/add_order');

  static const String name = 'OrderingHomePageRoute';
}

/// generated route for
/// [_i3.OrdersPage]
class OrdersPageRoute extends _i6.PageRouteInfo<void> {
  const OrdersPageRoute() : super(OrdersPageRoute.name, path: '/my_orders');

  static const String name = 'OrdersPageRoute';
}

/// generated route for
/// [_i4.AddingCustomerPage]
class AddingCustomerPageRoute extends _i6.PageRouteInfo<void> {
  const AddingCustomerPageRoute()
      : super(AddingCustomerPageRoute.name, path: '/add_new_customer');

  static const String name = 'AddingCustomerPageRoute';
}

/// generated route for
/// [_i5.OrdersForDispo]
class OrdersForDispoRoute extends _i6.PageRouteInfo<void> {
  const OrdersForDispoRoute()
      : super(OrdersForDispoRoute.name, path: '/orders_for_dispo');

  static const String name = 'OrdersForDispoRoute';
}
