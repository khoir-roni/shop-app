import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/order-screen';

//   @override
//   State<OrdersScreen> createState() => _OrdersScreenState();
// }

// class _OrdersScreenState extends State<OrdersScreen> {
//   // var _isLoading = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     // Future.delayed(Duration.zero).then((_) async {
//     // setState(() {
//     // _isLoading = true;
//     // // });
//     // // await
//     // Provider.of<Orders>(context, listen: false).fetchAndSetOrder().then((_) {
//     //   setState(() {
//     //     _isLoading = false;
//     //   });
//     // });
//     // // });

//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    // print(' build check 1 ');
    // final ordersData = Provider.of<Orders>(context);
    // print(' build check 3 ');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Orders'),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          future:
              Provider.of<Orders>(context, listen: false).fetchAndSetOrder(),
          builder: (context, snapshot) {
            // print('build check 2');
            // final ordersData = Provider.of<Orders>(context); if don't wanna use consumer
            if (snapshot.connectionState == ConnectionState.waiting) {
              // print('build check load');
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.error != null) {
                return const Center(
                  child: Text('An error Occurred!'),
                );
              } else {
                return Consumer<Orders>(
                  builder: (context, ordersData, child) {
                    // print('build check consume');
                    return ListView.builder(
                      itemCount: ordersData.orders.length,
                      itemBuilder: (context, index) =>
                          OrderItem(ordersData.orders[index]),
                    );
                  },
                );
                /* if don't  wanna use consumer just un command this code*/
                // ListView.builder(
                //   itemCount: ordersData.orders.length,
                //   itemBuilder: (context, index) =>
                //       OrderItem(ordersData.orders[index]),
                // );
              }
            }
          },
        )
        // _isLoading
        //     ? const Center(child: CircularProgressIndicator())
        //     : ListView.builder(
        //         itemCount: ordersData.orders.length,
        //         itemBuilder: (context, index) =>
        //             OrderItem(ordersData.orders[index]),
        //       ),
        );
  }
}
