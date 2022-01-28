import 'package:delicious_ordering/presentation/widgets/app_drawer.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'components/completed.dart';
import 'components/for_delivery.dart';
import 'components/for_confirm.dart';

class OrdersPage extends StatefulWidget {
  static final routeName = '/ordersPage';
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  // int _currentIndex = 0;
  late PageController _pageController;
  int _selectedIndex = 0;

  var appBarTitles = [
    'For Confirmation',
    'For Delivery/Pickup',
    'Completed',
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    OrdersForConfirm(),
    OrdersForDelivery(),
    OrdersCompleted(),
  ];

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          appBarTitles[_selectedIndex],
        ),
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Builder(
          builder: (context) {
            return SizedBox.expand(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                children: _widgetOptions,
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Builder(builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                // gap: 8,
                activeColor: Colors.black,
                // iconSize: 30,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.lightBlue,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: LineIcons.list,
                    text: 'For Confirmation',
                    textColor: Colors.white,
                  ),
                  GButton(
                    icon: LineIcons.truck,
                    gap: 5,
                    text: 'Delivery/Pickup',
                    textColor: Colors.white,
                  ),
                  GButton(
                    icon: LineIcons.check,
                    text: 'Completed',
                    textColor: Colors.white,
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                  // _pageController.jumpToPage(index);
                  _pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOutSine,
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
