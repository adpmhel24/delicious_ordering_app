import 'package:delicious_ordering/presentation/widgets/app_drawer.dart';
import 'package:delicious_ordering/presentation/widgets/responsive.dart';
import 'package:flutter/material.dart';

import 'desktop/desktop_body.dart';

class OrdersForDispo extends StatelessWidget {
  static final routeName = '/ordersForDispo';
  const OrdersForDispo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Orders For Disposition'),
            bottom: TabBar(
              indicatorColor: Colors.green,
              indicatorWeight: 10,
              tabs: [
                Tab(
                  icon: Icon(Icons.list_alt),
                ),
                Tab(icon: Icon(Icons.delivery_dining_rounded)),
                Tab(
                  icon: Icon(Icons.check),
                )
              ],
            ),
          ),
          drawer: AppDrawer(),
          body: TabBarView(
            children: [
              Responsive(
                mobile: Container(
                  child: Center(
                    child: Text('Mobile sized under development'),
                  ),
                ),
                tablet: Container(
                  child: Center(
                    child: Text('Tablet sized under development'),
                  ),
                ),
                desktop: OrdersForDispoDesktop(),
              ),
              Responsive(
                mobile: Container(
                  child: Center(
                    child: Text('Mobile sized under development'),
                  ),
                ),
                tablet: Container(
                  child: Center(
                    child: Text('Tablet sized under development'),
                  ),
                ),
                desktop: OrdersForDispoDesktop(),
              ),
              Responsive(
                mobile: Container(
                  child: Center(
                    child: Text('Mobile sized under development'),
                  ),
                ),
                tablet: Container(
                  child: Center(
                    child: Text('Tablet sized under development'),
                  ),
                ),
                desktop: OrdersForDispoDesktop(),
              ),
            ],
          )),
    );
  }
}
