import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/const/images.dart';
import 'package:bonsai_seller/views/widgets/appbar.dart';
import 'package:bonsai_seller/views/widgets/dashboard.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: dashboard),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context,title: products,count: "60",icon: iCproducts,height: 30.0,width: 30.0),
                dashboardButton(context,title: orders,count: "15",icon: iCorders,height: 30.0,width: 30.0),
              ],
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context,title: rating,count: "60",icon: star,height: 30.0,width: 30.0),
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
                  10,
                      (index) => ListTile(
                        onTap:(){},
                        leading: Image.asset(product,width: 100,height: 100,fit: BoxFit.cover,),
                        title: boldText(text: "Product name",color: green,),
                        subtitle: normalText(text: "\$699.00",color: golden),
                      ),
              ),
            ).box.size(context.screenWidth-10, context.screenHeight/2.0).make(),
          ],
        ),
      ),
    );
  }
}
