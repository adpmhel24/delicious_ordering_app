import 'package:flutter/material.dart';

import 'ordersModel.dart';

class OrdersForDispoDesktop extends StatelessWidget {
  const OrdersForDispoDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ForDispoOrderModel> data = [
      ForDispoOrderModel.fromJson({
        "id": 1,
        "transdate": "2022-01-25T08:30:15.182507",
        "delivery_date": "2022-01-25",
        "cust_code": "C_Betty Lee",
        "details": "JAPANESE LOAF BREAD(1.00 x 75.00)",
        "delfee": 0.0,
        "doctotal": 75.0,
        "delivery_method": null,
        "payment_method": "COD",
        "order_status": "For Confirmation",
        "payment_status": "Unpaid",
        "user": "admin"
      }),
      ForDispoOrderModel.fromJson({
        "id": 2,
        "transdate": "2022-01-25T08:30:15.182507",
        "delivery_date": "2022-01-25",
        "cust_code": "C_Betty Lee",
        "details": "JAPANESE LOAF BREAD(1.00 x 75.00)",
        "delfee": 0.0,
        "doctotal": 75.0,
        "delivery_method": null,
        "payment_method": "COD",
        "order_status": "For Confirmation",
        "payment_status": "Unpaid",
        "user": "admin"
      }),
    ];

    List<DataRow> _rows = data
        .map((e) => DataRow(onSelectChanged: (value) {}, cells: [
              DataCell(FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('${e.id}'),
              )),
              DataCell(FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('${e.transdate}'),
              )),
              DataCell(
                FittedBox(
                    fit: BoxFit.fitWidth, child: Text('${e.deliveryDate}')),
              ),
              DataCell(FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('${e.custCode}'),
              )),
              DataCell(FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('${e.details}'),
              )),
              DataCell(FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('${e.delfee}'),
              )),
              DataCell(FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('${e.doctotal}'),
              )),
              DataCell(
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text('${e.deliveryMethod}'),
                ),
              ),
              DataCell(
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text('${e.paymentMethod}'),
                ),
              ),
              DataCell(
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text('${e.orderStatus}'),
                ),
              ),
              DataCell(FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('User'),
              )),
            ]))
        .toList();

    List<DataColumn> _headers = [
      DataColumn(
        label: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Order Id',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Transaction Date',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Delivery Date',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Customer Code',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Details',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Delivery Fee',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Doctotal',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Delivery Method',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Payment Method',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'Order Status',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
      DataColumn(
        label: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'User',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    ];
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: DataTable(
            showCheckboxColumn: false,
            columnSpacing: (MediaQuery.of(context).size.width / 10) * 0.03,
            dataRowHeight: 80,
            columns: _headers,
            rows: _rows,
          ),
        ),
      ),
    );
  }
}

// class OrdersForDispoDesktop extends StatelessWidget {
//   const OrdersForDispoDesktop({Key? key}) : super(key: key);

//   static final double defaultTableSize =
//       (SizeConfig.screenWidth > 1500) ? SizeConfig.screenWidth : 1500;

//   @override
//   Widget build(BuildContext context) {
//     print(SizeConfig.screenWidth);
//     Widget _getTitleItemWidget(String label, double width) {
//       return Container(
//         child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
//         width: width,
//         height: 56,
//         padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//         alignment: Alignment.centerLeft,
//       );
//     }

//     List<Widget> _headers = [
//       _getTitleItemWidget('Order Id', (defaultTableSize - 100) / 12),
//       _getTitleItemWidget('Transaction Date', (defaultTableSize - 100) / 12),
//       _getTitleItemWidget('Delivery Date', (defaultTableSize - 100) / 12),
//       _getTitleItemWidget('Customer Code', (defaultTableSize - 100) / 12),
//       _getTitleItemWidget('Details', (defaultTableSize - 100) / 12),
//       _getTitleItemWidget('Delivery Fee', (defaultTableSize - 100) / 12),
//       _getTitleItemWidget('Doctotal', (defaultTableSize - 100) / 12),
//       _getTitleItemWidget('Delivery Method', (defaultTableSize - 100) / 12),
//       _getTitleItemWidget('Payment Method', (defaultTableSize - 100) / 12),
//       _getTitleItemWidget('Payment Method', (defaultTableSize - 100) / 12),
//       _getTitleItemWidget('Order Status', (defaultTableSize - 100) / 12),
//       _getTitleItemWidget('User', (defaultTableSize - 100) / 12),
//     ];

//     List<ForDispoOrderModel> data = [
//       ForDispoOrderModel.fromJson({
//         "id": 1,
//         "transdate": "2022-01-25T08:30:15.182507",
//         "delivery_date": "2022-01-25",
//         "cust_code": "C_Betty Lee",
//         "details": "JAPANESE LOAF BREAD(1.00 x 75.00)",
//         "delfee": 0.0,
//         "doctotal": 75.0,
//         "delivery_method": null,
//         "payment_method": "COD",
//         "order_status": "For Confirmation",
//         "payment_status": "Unpaid",
//         "user": "admin"
//       }),
//       ForDispoOrderModel.fromJson({
//         "id": 2,
//         "transdate": "2022-01-25T08:30:15.182507",
//         "delivery_date": "2022-01-25",
//         "cust_code": "C_Betty Lee",
//         "details": "JAPANESE LOAF BREAD(1.00 x 75.00)",
//         "delfee": 0.0,
//         "doctotal": 75.0,
//         "delivery_method": null,
//         "payment_method": "COD",
//         "order_status": "For Confirmation",
//         "payment_status": "Unpaid",
//         "user": "admin"
//       }),
//     ];

//     Widget _generateFirstColumnRow(BuildContext context, int index) {
//       return Container(
//         child: Text(data[index].id.toString()),
//         width: 100,
//         height: 52,
//         padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//         alignment: Alignment.centerLeft,
//       );
//     }

//     Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
//       return Row(
//         children: <Widget>[
//           Container(
//             child: Text('${data[index].transdate}'),
//             width: (defaultTableSize - 100) / 12,
//             height: 52,
//             padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//             alignment: Alignment.centerLeft,
//           ),
//           Container(
//             child: Text('${data[index].deliveryDate}'),
//             width: (defaultTableSize - 100) / 12,
//             height: 52,
//             padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//             alignment: Alignment.centerLeft,
//           ),
//           Container(
//             child: Text('${data[index].custCode}'),
//             width: (defaultTableSize - 100) / 12,
//             height: 52,
//             padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//             alignment: Alignment.centerLeft,
//           ),
//           Container(
//             child: Text('${data[index].custCode}'),
//             width: (defaultTableSize - 100) / 12,
//             height: 52,
//             padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//             alignment: Alignment.centerLeft,
//           ),
//           Container(
//             child: Text('${data[index].details}'),
//             width: (defaultTableSize - 100) / 12,
//             height: 52,
//             padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//             alignment: Alignment.centerLeft,
//           ),
//           Container(
//             child: Text('${data[index].delfee}'),
//             width: (defaultTableSize - 100) / 12,
//             height: 52,
//             padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//             alignment: Alignment.centerLeft,
//           ),
//           Container(
//             child: Text('${data[index].doctotal}'),
//             width: (defaultTableSize - 100) / 12,
//             height: 52,
//             padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//             alignment: Alignment.centerLeft,
//           ),
//           Container(
//             child: Text('${data[index].deliveryMethod}'),
//             width: (defaultTableSize - 100) / 12,
//             height: 52,
//             padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//             alignment: Alignment.centerLeft,
//           ),
//           Container(
//             child: Text('${data[index].paymentMethod}'),
//             width: (defaultTableSize - 100) / 12,
//             height: 52,
//             padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//             alignment: Alignment.centerLeft,
//           ),
//           Container(
//             child: Text('${data[index].orderStatus}'),
//             width: (defaultTableSize - 100) / 12,
//             height: 52,
//             padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//             alignment: Alignment.centerLeft,
//           ),
//           Container(
//             child: Text('${data[index].user}'),
//             width: (defaultTableSize - 100) / 12,
//             height: 52,
//             padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//             alignment: Alignment.centerLeft,
//           ),
//         ],
//       );
//     }

//     return Container(
//       child: HorizontalDataTable(
//         leftHandSideColumnWidth: 100,
//         rightHandSideColumnWidth: defaultTableSize,
//         isFixedHeader: true,
//         headerWidgets: _headers,
//         leftSideItemBuilder: _generateFirstColumnRow,
//         rightSideItemBuilder: _generateRightHandSideColumnRow,
//         itemCount: data.length,
//         rowSeparatorWidget: const Divider(
//           color: Colors.black54,
//           height: 1.0,
//           thickness: 0.0,
//         ),
//         leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
//         rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
//         verticalScrollbarStyle: const ScrollbarStyle(
//           thumbColor: Colors.yellow,
//           isAlwaysShown: true,
//           thickness: 4.0,
//           radius: Radius.circular(5.0),
//         ),
//         horizontalScrollbarStyle: const ScrollbarStyle(
//           thumbColor: Colors.red,
//           isAlwaysShown: true,
//           thickness: 4.0,
//           radius: Radius.circular(5.0),
//         ),
//         // enablePullToRefresh: true,
//         // refreshIndicator: const WaterDropHeader(),
//         // refreshIndicatorHeight: 60,
//         // onRefresh: () async {
//         //   //Do sth
//         //   await Future.delayed(const Duration(milliseconds: 500));
//         //   // _hdtRefreshController.refreshCompleted();
//         // },
//         // enablePullToLoadNewData: true,
//         // loadIndicator: const ClassicFooter(),
//         // onLoad: () async {
//         //   //Do sth
//         //   await Future.delayed(const Duration(milliseconds: 500));
//         //   // _hdtRefreshController.loadComplete();
//         // },
//         // htdRefreshController: _hdtRefreshController,
//       ),
//       height: MediaQuery.of(context).size.height,
//     );
//   }
// }
