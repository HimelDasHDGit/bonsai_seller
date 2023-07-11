import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class ProductsDetails extends StatelessWidget {

  final dynamic data;

  const ProductsDetails({Key? key, this.data}) : super(key: key);

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
          text: "${data['name']}",
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
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Image.network(
                      "${data['images'][index]}",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    );
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldText(
                        text: "${data['name']}", size: 16.0, color: Colors.black),
                    10.heightBox,
                    Row(
                      children: [
                        boldText(
                            text: "${data['category']}", size: 16.0, color: Colors.black),
                        10.widthBox,
                        normalText(
                            text: "${data['subCategory']}", color: green, size: 10.0),
                      ],
                    ),
                    10.heightBox,
                    VxRating(
                      isSelectable: false,
                      value: double.parse(data['rating']),
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
                child: "${data['price']}/-".text.size(18.0).make(),
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
                         Text(
                          "${data['quantity']} items",
                          style: const TextStyle(color: green, fontSize: 16.0),
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
              normalText(
                  text: "${data['description']}",
                  color: green),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
