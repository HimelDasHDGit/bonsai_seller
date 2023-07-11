import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/products_screen/components/product_images.dart';
import 'package:bonsai_seller/views/widgets/loading_indicator.dart';
import 'package:bonsai_seller/views/widgets/textField.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import '../../controllers/products_controller.dart';
import 'components/dropdown.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProductsController>();

    return Obx(
      ()=> Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: boldText(text: "Add product", color: green, size: 16.0),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: green,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  controller.loading.value? loadingIndicator():ElevatedButton(
                  onPressed: ()async {
                    controller.loading(true);
                    await controller.uploadImages();
                    await controller.uploadProduct(context);
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    side: const BorderSide(width: 1, color: white),
                  ),
                  child: boldText(text: "Add product", color: white),
                ).box.rounded.make(),

            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addTextField(
                  hint: "Name of a tree",
                  lebel: "Product name",
                  controller: controller.nameController,
                ),
                10.heightBox,
                addTextField(
                  controller: controller.descriptionController,
                  hint: "Relatable to your product",
                  lebel: "Description",
                ),
                10.heightBox,
                addTextField(
                  controller: controller.priceController,
                  hint: "৳-00,00,000/-",
                  lebel: "Price",
                ),
                10.heightBox,
                addTextField(
                  controller: controller.quantityController,
                  hint: "0000",
                  lebel: "Quantity",
                  // hintColor: green,
                ),
                10.heightBox,
                dropDown('Category',controller.categoryList,controller.categoryValue, controller),
                10.heightBox,
                dropDown('Subcategory',controller.subCategoryList,controller.subCategoryValue, controller),
                10.heightBox,
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: boldText(text: "Choose product images",color: green),
                ),
                5.heightBox,
                Obx(
                  ()=> Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        3, (index) => controller.imagesList[index] !=null?
                    Image.file(controller.imagesList[index],height: 100,width: 100,fit: BoxFit.cover,).onTap(() {
                      controller.pickImage(index, context);
                    })
                        :productimages(lebel: "${index + 1}").onTap(() {
                      controller.pickImage(index, context);
                    })),
                  ),
                ),
                5.heightBox,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: normalText(
                      text: "First image will be your display image",
                      size: 1.0,
                      color: lightGrey),
                ),
                10.heightBox,
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: boldText(text: "Choose color"),
                ),
                10.heightBox,
                Obx(()=> Wrap(
                    runSpacing: 8.0,
                    spacing: 8.0,
                    children: List.generate(
                        15,
                        (index) => Stack(
                              alignment: Alignment.center,
                              children: [
                                VxBox()
                                    .color(Vx.randomPrimaryColor)
                                    .roundedFull
                                    .size(50, 50)
                                    .make().onTap(() {
                                      controller.selectedColor.value = index;
                                }),
                                controller.selectedColor.value == index?const Icon(
                                  Icons.done,
                                  color: white,
                                ) : const SizedBox(),
                              ],
                            )),
                  ),
                ),
                20.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
