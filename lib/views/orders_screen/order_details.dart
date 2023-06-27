import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/orders_screen/components/orderplaced.dart';
import 'package:bonsai_seller/views/widgets/button.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back,color: green,)),
        title: boldText(
          text: "Order details",
          color: green,size: 16.0
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: button(
          color: green,
          onPress: (){},
          title: "Confirm Order",
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
                  visible: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 8),
                        child: boldText(text: "Order Status",color: fontGrey,size: 16.0),
                      ),
                      SwitchListTile(
                          value: true,
                          onChanged: (value){},
                        activeColor: green,
                        title: boldText(text: "Placed",color: green),
                      ),
                      SwitchListTile(
                        value: true,
                        onChanged: (value){},
                        activeColor: green,
                        title: boldText(text: "Confirmed",color: green),
                      ),
                      SwitchListTile(
                        value: false,
                        onChanged: (value){},
                        activeColor: green,
                        title: boldText(text: "On delivery",color: green),
                      ),
                      SwitchListTile(
                        value: false,
                        onChanged: (value){},
                        activeColor: green,
                        title: boldText(text: "Delivered",color: green),
                      ),
                    ],
                  ).box.outerShadow3Xl.white.make(),
                ),
                5.heightBox,
                //order details
                Column(
                  children: [
                    orderPlaceddetails(title1: "Order code",title2: "Shipping method",d1: "data['order_code']",d2: "data['shipping_method']",),
                    orderPlaceddetails(title1: "Order date",title2: "Payment method",
                      // d1: intl.DateFormat().add_yMMMMEEEEd().format(data['order_date'].toDate()),
                      d2: "data['payment_method'],"),
                    orderPlaceddetails(title1: "Payment status",title2: "Delivery status",d1: "Unpaid",d2: "Order placed",),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              "Shipping Address".text.make(),
                              "{data['order_by_name']}".text.color(green).make(),
                              SizedBox(
                                width: 200,
                                child: Flex(
                                    direction: Axis.horizontal,
                                    children: [Expanded(
                                        flex: 2,
                                        child: "{data['order_by_email']}".text.color(green).make()),]
                                ),
                              ),
                              "{data['order_by_phone']}".text.color(green).make(),
                              SizedBox(
                                width: 200,
                                child: Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: "{data['order_by_address']}".text.color(green).make(),
                                    ),
                                  ],
                                ),
                              ),
                              "{data['order_by_po']}".text.color(green).make(),
                              "{data['order_by_city']}".text.color(green).make(),
                              "{data['order_by_state']}".text.color(green).make(),
                            ],
                          ),
                          SizedBox(
                            width: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Total Amount".text.make(),
                                "{data['total_amount']}".text.color(Colors.red).make(),
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
                  children: List.generate(
                      20,
                          (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            orderPlaceddetails(
                              d1: "{data['orders'][index]['qty']} x",
                              d2: "Refundable",
                              title1: "data['orders'][index]['title']",
                              title2: "{data['orders'][index]['price']}",
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                              child: Container(
                                width: 30,
                                height: 10,
                                color: green,
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
    );
  }
}
