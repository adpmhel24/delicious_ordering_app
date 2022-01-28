import 'package:badges/badges.dart';
import 'package:delicious_ordering/common_bloc/cart_bloc/bloc.dart';
import 'package:delicious_ordering/common_bloc/products_bloc/bloc.dart';
import 'package:delicious_ordering/configs/size_config.dart';
import 'package:delicious_ordering/data/repositories/repositories.dart';
import 'package:delicious_ordering/presentation/pages/add_customer/new_customer.dart';
import 'package:delicious_ordering/presentation/pages/cart_and_checkout/cart.dart';
import 'package:delicious_ordering/presentation/pages/add_order/components/customer_order_details/bloc/bloc.dart';
import 'package:delicious_ordering/presentation/pages/add_order/components/customer_order_details/customer_form.dart';
import 'package:delicious_ordering/presentation/widgets/app_drawer.dart';
import 'package:delicious_ordering/utils/navigation_handler.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'bloc/bloc.dart';
import 'components/body.dart';

class OrderingHomePage extends StatefulWidget {
  static final routeName = '/orderingHome';

  const OrderingHomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => OrderingHomePage());
  }

  @override
  State<OrderingHomePage> createState() => _OrderingHomePageState();
}

class _OrderingHomePageState extends State<OrderingHomePage> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  static const List<Widget> _widgetOptions = <Widget>[
    CustomerOrderingDetailsForm(),
    OrderingProductPage(),
  ];

  @override
  Widget build(BuildContext context) {
    CartRepo _cartRepo = AppRepo.cartRepository;
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderCustDetailsBloc>(
          create: (_) => OrderCustDetailsBloc(),
        ),
        BlocProvider<ProductSelectionBloc>(
          create: (_) => ProductSelectionBloc(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Ordering',
          ),
          actions: [
            Builder(builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Badge(
                  badgeContent:
                      BlocBuilder<ProductSelectionBloc, ProductSelectionState>(
                    builder: (_, state) {
                      return BlocBuilder<CartBloc, CartState>(
                        builder: (_, state) {
                          return Text(_cartRepo.cartItemsCount.toString());
                        },
                      );
                    },
                  ),
                  child: IconButton(
                    color: Theme.of(context).iconTheme.color,
                    onPressed: () {
                      context.read<CartBloc>().add(LoadCart());
                      Navigator.of(context).push(CartPage.route(context));
                    },
                    icon: Icon(Icons.shopping_cart_sharp),
                  ),
                ),
              );
            })
          ],
        ),
        drawer: AppDrawer(),
        floatingActionButton: _selectedIndex == 0
            ? FloatingActionButton(
                onPressed: () {
                  Go.pushNamed(context, AddingCustomerPage.routeName);
                },
                child: const Icon(Icons.add),
              )
            : null,
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
          // child: _widgetOptions.elementAt(_selectedIndex),
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
                  activeColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.lightBlue,
                  color: Colors.black,
                  tabs: [
                    GButton(
                      icon: LineIcons.userCheck,
                      text: 'Customer Details',
                      textColor: Colors.white,
                    ),
                    GButton(
                      icon: LineIcons.breadSlice,
                      text: 'Products',
                      textColor: Colors.white,
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
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
      ),
    );
  }
}

class OrderingProductPage extends StatelessWidget {
  const OrderingProductPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SearchField(),
              ),
            ],
          ),
        ),
        Flexible(child: Body()),
      ],
    );
  }
}

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: Builder(builder: (context) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  _controller.clear();
                  context.read<ProductsBloc>()..add(FetchProductFromLocal());
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  context.read<ProductsBloc>()
                    ..add(SearchByKeyword(_controller.text));
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
