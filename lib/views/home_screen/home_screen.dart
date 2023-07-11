import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/const/images.dart';
import 'package:bonsai_seller/services/bonsai_server.dart';
import 'package:bonsai_seller/views/products_screen/product_details.dart';
import 'package:bonsai_seller/views/widgets/appbar.dart';
import 'package:bonsai_seller/views/widgets/dashboard.dart';
import 'package:bonsai_seller/views/widgets/loading_indicator.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: dashboard),
      body: StreamBuilder(
        stream: BonsaiServer.getProducts(currentUser!.uid),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          }  else{

            var data = snapshot.data!.docs;

            data = data.sortedBy((b, a) => a['wishlist'].length.compareTo(b['wishlist'].length) );

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashboardButton(context,title: products,count: data.length,icon: iCproducts,height: 30.0,width: 30.0),
                      dashboardButton(context,title: orders,count: "15",icon: iCorders,height: 30.0,width: 30.0),
                    ],
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashboardButton(context,title: rating,count: "5",icon: star,height: 30.0,width: 30.0),
                      dashboardButton(context,title: totalSales,count: "15",icon: total,height: 30.0,width: 30.0),
                    ],
                  ),
                  10.heightBox,
                  const Divider(),
                  10.heightBox,
                  boldText(text: popular_products,color: green,size: 16.0),
                  20.heightBox,
                  ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      data.length,
                          (index) => ListTile(
                        onTap:(){
                          Get.to(()=> ProductsDetails(data: data[index],));
                        },
                        leading: Image.network(data[index]['images'][0],width: 100,height: 100,fit: BoxFit.cover,),
                        title: boldText(text: "${data[index]['name']}",color: green,),
                        subtitle: normalText(text: "${data[index]['price']}",color: golden),
                      ),
                    ),
                  ).box.size(context.screenWidth-10, context.screenHeight/2.0).make(),
                ],
              ),
            );
          }
        }
      ),
    );
  }
}
