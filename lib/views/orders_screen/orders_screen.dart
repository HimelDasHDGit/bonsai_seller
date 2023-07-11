import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/controllers/orders_controller.dart';
import 'package:bonsai_seller/services/bonsai_server.dart';
import 'package:bonsai_seller/views/orders_screen/order_details.dart';
import 'package:bonsai_seller/views/widgets/appbar.dart';
import 'package:bonsai_seller/views/widgets/loading_indicator.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrdersController());

    return Scaffold(
      appBar: appBar(title: orders),
      body: StreamBuilder(
        stream: BonsaiServer.getOrders(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          } else {
            var data = snapshot.data!.docs;

            return Padding(
              padding:  EdgeInsets.all(4.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(data.length, (index) {
                    var t = data[index]['order_date'].toDate();

                    return ListTile(
                      onTap: () {
                        Get.to(() => OrderDetails(
                              data: data[index],
                            ));
                      },
                      tileColor: green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: white,
                              ),
                              5.widthBox,
                              normalText(
                                  text: intl.DateFormat().add_MMMEd().format(t),
                                  color: white),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time_sharp,
                                color: white,
                              ),
                              5.widthBox,
                              normalText(
                                  text: intl.DateFormat("jms")
                                      .format(DateTime.now()),
                                  color: white),
                            ],
                          ),
                        ],
                      ),
                      leading: SizedBox(
                        width: MediaQuery.of(context).size.width / 2.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: green.withOpacity(.8),
                                  radius: 15,
                                  child: Text(
                                    "$index",
                                    style: TextStyle(color: white),
                                  ),
                                ),
                                5.widthBox,
                                boldText(
                                  text: "${data[index]['order_code']}",
                                  color: white,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                normalText(
                                    text: data[index]['payment_method'],
                                    color: white),
                                5.widthBox,
                                boldText(text: unpaid, color: Colors.red)
                                    .box
                                    .color(white)
                                    .roundedSM
                                    .padding(EdgeInsets.all(4))
                                    .make(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                        .box
                        .margin(const EdgeInsets.all(4.0))
                        .outerShadow2Xl
                        .make();
                  }),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
