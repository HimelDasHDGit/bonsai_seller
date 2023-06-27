import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/products_screen/components/product_images.dart';
import 'package:bonsai_seller/views/widgets/textField.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'components/dropdown.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        title: boldText(text: "Add product", color: white, size: 16.0),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
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
              ),
              10.heightBox,
              addTextField(
                hint: "Relatable to your product",
                lebel: "Description",
              ),
              10.heightBox,
              addTextField(
                hint: "৳-00,00,000/-",
                lebel: "Price",
              ),
              10.heightBox,
              addTextField(
                hint: "0000",
                lebel: "Quantity",
              ),
              10.heightBox,
              dropDown(),
              10.heightBox,
              dropDown(),
              10.heightBox,
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  thickness: 5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: boldText(text: "Choose product images"),
              ),
              5.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    3, (index) => productimages(lebel: "${index + 1}")),
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
              Wrap(
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
                                .make(),
                            const Icon(
                              Icons.done,
                              color: white,
                            ),
                          ],
                        )),
              ),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
