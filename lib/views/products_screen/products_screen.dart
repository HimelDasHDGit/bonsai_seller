import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/const/images.dart';
import 'package:bonsai_seller/views/products_screen/add_product.dart';
import 'package:bonsai_seller/views/products_screen/product_details.dart';
import 'package:bonsai_seller/views/widgets/appbar.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddProduct());
        },
        backgroundColor: green,
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: appBar(title: products),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
              (index) => Card(
                child: ListTile(
                  onTap: () {
                    Get.to(() => const ProductsDetails());
                  },
                  leading: Image.asset(
                    product,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  title: boldText(
                    text: "Product name",
                    color: green,
                  ),
                  subtitle: Row(
                    children: [
                      normalText(text: "\$699.00", color: golden),
                      10.widthBox,
                      boldText(
                          text: "Featured",
                          color: const Color.fromARGB(255, 34, 254, 42)),
                    ],
                  ),
                  trailing: VxPopupMenu(
                    menuBuilder: () {
                      return Column(
                        children: List.generate(popupMenuItems.length, (index) {
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
                                      popupMenuIcons[index],
                                      color: green,
                                    ),
                                    5.widthBox,
                                    normalText(
                                        text: popupMenuItems[index],
                                        color: green),
                                  ],
                                ).onTap(() {}),
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
      ),
    );
  }
}
