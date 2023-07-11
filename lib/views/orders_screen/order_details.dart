import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/orders_screen/components/orderplaced.dart';
import 'package:bonsai_seller/views/widgets/button.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

import '../../controllers/orders_controller.dart';

class OrderDetails extends StatefulWidget {
  final dynamic data;
  const OrderDetails({Key? key, this.data}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  var controller = Get.find<OrdersController>();

  @override
  void initState() {
    super.initState();
    controller.getOrders(widget.data);
    controller.confirmed.value = widget.data['order_confirmed'];
    controller.onDelivery.value = widget.data['order_on_delivery'];
    controller.delivered.value = widget.data['order_delevered'];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=>Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: green,
              )),
          title: boldText(text: "Order details", color: green, size: 16.0),
        ),
        bottomNavigationBar: Obx(
          ()=> Visibility(
            visible: !controller.confirmed.value,
            child: SizedBox(
              height: 60,
              width: context.screenWidth,
              child: button(
                color: green,
                onPress: () {
                  controller.confirmed(true);
                  controller.changeOrderStatus(title: "order_confirmed", status: true,docId: widget.data.id);
                },
                title: "Confirm Order",
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  8.heightBox,
                  //order status
                  Visibility(
                    visible: controller.confirmed.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 8),
                          child: boldText(
                              text: "Order Status", color: fontGrey, size: 16.0),
                        ),
                        SwitchListTile(
                          value: true,
                          onChanged: (value) {},
                          activeColor: green,
                          title: boldText(text: "Placed", color: green),
                        ),
                        SwitchListTile(
                          value: controller.confirmed.value,
                          onChanged: (value) {
                            controller.confirmed.value = value;
                          },
                          activeColor: green,
                          title: boldText(text: "Confirmed", color: green),
                        ),
                        SwitchListTile(
                          value: controller.onDelivery.value,
                          onChanged: (value) {
                            controller.onDelivery.value = value;
                            controller.changeOrderStatus(title: "order_on_delivery", status: value,docId: widget.data.id);
                          },
                          activeColor: green,
                          title: boldText(text: "On delivery", color: green),
                        ),
                        SwitchListTile(
                          value: controller.delivered.value,
                          onChanged: (value) {
                            controller.delivered.value = value;
                            controller.changeOrderStatus(title: "order_delevered", status: value,docId: widget.data.id);
                          },
                          activeColor: green,
                          title: boldText(text: "Delivered", color: green),
                        ),
                      ],
                    ).box.outerShadow3Xl.white.make(),
                  ),
                  5.heightBox,
                  //order details
                  Column(
                    children: [
                      orderPlaceddetails(
                        title1: "Order Code",
                        title2: "Shipping method",
                        d1: "${widget.data['order_code']}",
                        d2: "${widget.data['shipping_method']}",
                      ),
                      orderPlaceddetails(
                          title1: "Order date",
                          title2: "Payment method",
                          d1: intl.DateFormat()
                              .add_yMMMMEEEEd()
                              .format(widget.data['order_date'].toDate()),
                          d2: "${widget.data['payment_method']}"),
                      orderPlaceddetails(
                          title1: "Payment status",
                          title2: "Delivery status",
                          d1: "Unpaid",
                          d2: "Order placed",
                          color: red),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Shipping Address".text.bold.make(),
                                "${widget.data['order_by_name']}"
                                    .text
                                    .color(green)
                                    .make(),
                                SizedBox(
                                  width: 200,
                                  child:
                                      Flex(direction: Axis.horizontal, children: [
                                    Expanded(
                                        flex: 2,
                                        child: "${widget.data['order_by_email']}"
                                            .text
                                            .color(green)
                                            .make()),
                                  ]),
                                ),
                                "${widget.data['order_by_phone']}"
                                    .text
                                    .color(green)
                                    .make(),
                                SizedBox(
                                  width: 200,
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child:
                                            "${widget.data['order_by_address']}"
                                                .text
                                                .color(green)
                                                .make(),
                                      ),
                                    ],
                                  ),
                                ),
                                "P/O-${widget.data['order_by_po']}"
                                    .text
                                    .color(green)
                                    .make(),
                                "City-${widget.data['order_by_city']}"
                                    .text
                                    .color(green)
                                    .make(),
                                "${widget.data['order_by_state']},Bangladesh"
                                    .text
                                    .color(green)
                                    .make(),
                              ],
                            ),
                            SizedBox(
                              width: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Total Amount".text.make(),
                                  "৳-${widget.data['total_amount']}.00/-"
                                      .text
                                      .color(Colors.red)
                                      .make(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).box.outerShadow3Xl.white.make(),
                  //const Divider(color: redColor, thickness: 1,indent: 10,endIndent: 10,),
                  10.heightBox,
                  "Ordered prodcut".text.size(16).color(green).makeCentered(),
                  10.heightBox,
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(controller.orders.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          orderPlaceddetails(
                            d1: "${controller.orders[index]['qty']}",
                            d2: "Refundable",
                            title1: "${controller.orders[index]['title']}",
                            title2: "৳-${controller.orders[index]['price']}/-",
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            child: Container(
                              width: 30,
                              height: 10,
                              color: Color(controller.orders[index]['color']),
                            ),
                          ),
                          const Divider(),
                        ],
                      );
                    }).toList(),
                  ).box.outerShadow3Xl.white.make(),
                  20.heightBox,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
