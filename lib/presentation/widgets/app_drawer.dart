import 'package:delicious_ordering/common_bloc/auth_bloc/bloc.dart';
import 'package:delicious_ordering/data/repositories/repositories.dart';
import 'package:delicious_ordering/presentation/pages/login/login.dart';
import 'package:delicious_ordering/presentation/pages/ordering/ordering_home.dart';
import 'package:delicious_ordering/presentation/pages/orders/orders.dart';
import 'package:delicious_ordering/utils/navigation_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  AuthRepository _authRepo = AppRepo.authRepository;
  @override
  Widget build(BuildContext context) {
    AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _createHeader(_authRepo),
          _createDrawerItem(
            icon: Icons.list_alt,
            text: 'Ordering',
            onTap: () {
              Go.offAll(context, OrderingHomePage());
            },
          ),
          _createDrawerItem(
            icon: Icons.list_alt,
            text: 'My Orders',
            onTap: () {
              Go.popAndPushNamed(context, OrdersPage.routeName);
            },
          ),
          // _createDrawerItem(
          //   icon: Icons.sell,
          //   text: 'Orders',
          //   onTap: () {
          //     Get.offAllNamed(OrdersPage.routeName);
          //   },
          // ),
          // ExpansionTile(
          //   title: Text("Orders"),
          //   children: <Widget>[
          //     _createDrawerItem(
          //       icon: Icons.menu_open,
          //       text: 'Orders',
          //       onTap: () {
          //         // Get.offAndToNamed(SalesOrderPage.routeName);
          //       },
          //     ),
          //     _createDrawerItem(
          //       icon: Icons.pending,
          //       text: 'Orders',
          //       onTap: () {
          //         // Get.offAndToNamed(SalesOrderPage.routeName);
          //       },
          //     ),
          //   ],
          // ),
          _createDrawerItem(
            icon: Icons.logout,
            text: 'Logout',
            onTap: () {
              Go.offAll(context, LoginPage());
              _authBloc.add(LoggedOut());
            },
          ),
        ],
      ),
    );
  }
}

Widget _createHeader(AuthRepository _authRepo) {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      color: Colors.green[200],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/empty_user.png'),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${_authRepo.currentUser.username}'),
                  Text('${_authRepo.currentUser.fullname}'),
                ],
              ),
            ],
          ),
          Text(
            'Main Menu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 20.0,
            ),
          )
        ],
      ),
    ),
  );
}

Widget _createDrawerItem(
    {required IconData icon, required String text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
