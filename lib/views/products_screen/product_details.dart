import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/const/images.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: green,
            )),
        title: boldText(
          text: "Product details",
          color: green,
          size: 16.0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VxSwiper.builder(
                  autoPlay: true,
                  aspectRatio: 9 / 16,
                  height: 300,
                  viewportFraction: 1.0,
                  pauseAutoPlayOnTouch: const Duration(seconds: 15),
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  autoPlayCurve: Curves.linear,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      product,
                      // data['images'][index],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldText(
                        text: "Product title", size: 16.0, color: Colors.black),
                    10.heightBox,
                    Row(
                      children: [
                        boldText(
                            text: "Category", size: 16.0, color: Colors.black),
                        10.widthBox,
                        normalText(
                            text: "Subcategory", color: green, size: 10.0),
                      ],
                    ),
                    10.heightBox,
                    VxRating(
                      isSelectable: false,
                      // value: double.parse(data['rating']),
                      value: 3.0,
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      size: 25,
                      count: 5,
                      maxRating: 5,
                    ),
                  ],
                ),
              ),
              10.heightBox,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: "৳5200/-".text.size(18.0).make(),
              ),
              10.heightBox,
              20.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //color
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Color:".text.color(green).bold.make(),
                        ),
                        Row(
                          children: List.generate(
                            3,
                            (index) => VxBox()
                                .size(40, 40)
                                .roundedFull
                                .color(Vx.randomPrimaryColor)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 4))
                                .make()
                                .onTap(() {}),
                          ),
                        ),
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),
                  ),
                  //quantity
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Quantity:".text.color(green).bold.make(),
                        ),
                        const Text(
                          "10 items",
                          style: TextStyle(color: green, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  //Total
                ],
              ).box.white.shadowSm.make(),
              //description
              10.heightBox,
              boldText(text: "Description", color: green),
              const Divider(),
              10.heightBox,
              // "${data['description']}".text.color(darkFontGrey).make(),
              normalText(
                  text:
                      "500 miles 500 miles 500 miles 500 miles 500 miles 500 miles 500 miles 500 miles 500 miles 500 miles 500 miles 500 miles 500 miles 500 miles 500 miles 500 miles 500 miles 500 miles"
                      "500 miles 500 miles 500 miles 500 miles 500 miles 500 miles500 miles 500 miles 500 miles 500 miles 500 miles 500 miles",
                  color: green),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
