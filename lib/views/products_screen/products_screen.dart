import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/controllers/products_controller.dart';
import 'package:bonsai_seller/services/bonsai_server.dart';
import 'package:bonsai_seller/views/products_screen/add_product.dart';
import 'package:bonsai_seller/views/products_screen/product_details.dart';
import 'package:bonsai_seller/views/widgets/appbar.dart';
import 'package:bonsai_seller/views/widgets/loading_indicator.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(ProductsController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          await controller.getCategories();
          controller.populateCategoryList();
          Get.to(() => const AddProduct());
        },
        backgroundColor: green,
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: appBar(title: products),
      body: StreamBuilder(
        stream: BonsaiServer.getProducts(currentUser!.uid),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          }  else{

            var data = snapshot.data!.docs;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    data.length,
                        (index) => Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(() =>  ProductsDetails(data: data[index],));
                        },
                        leading: Image.network(
                          data[index]['images'][0],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        title: boldText(
                          text: data[index]['name'],
                          color: green,
                        ),
                        subtitle: Row(
                          children: [
                            normalText(text: data[index]['price'], color: golden),
                            10.widthBox,
                            boldText(
                                text: data[index]['is_featured'] == true?"Fet...":"",
                                color: const Color.fromARGB(255, 34, 254, 42)),
                          ],
                        ),
                        trailing: VxPopupMenu(
                          menuBuilder: () {
                            return Column(
                              children: List.generate(popupMenuItems.length, (i) {
                                return Column(
                                  children: [
                                    const Divider(
                                      color: green,
                                      thickness: 1,
                                      endIndent: 10,
                                      indent: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            popupMenuIcons[i],
                                            color: data[index]['featured_id'] == currentUser!.uid && i == 0 ? green : Colors.black,
                                          ),
                                          5.widthBox,
                                          normalText(
                                              text: data[index]['featured_id'] == currentUser!.uid && i == 0 ? "Remove featued" : popupMenuItems[i],
                                              color: green),
                                        ],
                                      ).onTap(
                                              () {
                                                switch(i) {
                                                  case 0:if (data[index]['is_featured']==true) {
                                                    controller.removeFeatured(data[index].id);
                                                    VxToast.show(context, msg: 'Removed');
                                                    Get.back();
                                                  }  else{
                                                    controller.addFeatured(data[index].id);
                                                    VxToast.show(context, msg: 'Added');
                                                    Get.back();
                                                  }

                                                    break;

                                                  case 1:

                                                  break;

                                                  case 2: controller.removeProduct(data[index].id);
                                                  VxToast.show(context, msg: "Product removed");

                                                    break;

                                                  default:
                                                }

                                      }),
                                    ),
                                  ],
                                );
                              }),
                            ).box.white.width(200).rounded.make();
                          },
                          clickType: VxClickType.singleClick,
                          child: const Icon(
                            Icons.more_vert_rounded,
                            size: 25,
                            color: green,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        }
      ),
    );
  }
}
