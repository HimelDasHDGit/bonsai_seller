import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/orders_screen/order_details.dart';
import 'package:bonsai_seller/views/widgets/appbar.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;


class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: orders),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children:List.generate(20, (index) => ListTile(
              onTap:(){
                Get.to(()=> const OrderDetails());
              },
              tileColor: Vx.green200,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_month,color: green,),
                      5.widthBox,
                      normalText(text: intl.DateFormat("yMMMMd").format(DateTime.now()),color: green),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time_sharp,color: green,),
                      5.widthBox,
                      normalText(text: intl.DateFormat("jms").format(DateTime.now()),color: green),
                    ],
                  ),
                ],
              ),
              leading: SizedBox(
                width: MediaQuery.of(context).size.width/3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: green,radius: 15,child: Text("$index"),),
                        5.widthBox,
                        boldText(text: "46B-41",color: green,),
                      ],
                    ),
                    Row(
                      children: [
                        normalText(text: "\$699.00",color: golden),
                        5.widthBox,
                        boldText(text: unpaid,color: red),
                      ],
                    ),
                  ],
                ),
              ),
            ).box.margin(const EdgeInsets.all(4.0)).outerShadowSm.make(),),
          ),
        ),
      ),
    );
  }
}
