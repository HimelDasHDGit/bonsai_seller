import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/const/images.dart';
import 'package:bonsai_seller/controllers/profile_controller.dart';
import 'package:bonsai_seller/views/widgets/loading_indicator.dart';
import 'package:bonsai_seller/views/widgets/textField.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class ShopSettings extends StatelessWidget {
  const ShopSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return Obx(
      () => Scaffold(
        backgroundColor: green,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: white,
              )),
          title: boldText(text: shopSettings, size: 16.0, color: green),
          actions: [
            controller.isLoading.value
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: loadingIndicator(color: white),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: OutlinedButton.styleFrom(backgroundColor: white),
                      onPressed: () async {
                        controller.isLoading(true);
                        if (controller.shopNameController.text.isEmptyOrNull ||
                            controller
                                .shopAddressController.text.isEmptyOrNull ||
                            controller
                                .shopDescriptionController.text.isEmptyOrNull ||
                            controller
                                .shopMobileController.text.isEmptyOrNull ||
                            controller
                                .shopWebsiteController.text.isEmptyOrNull) {
                          controller.isLoading(false);
                          return VxToast.show(context,
                              msg: "Field can not be empty");
                        } else {
                          await controller.shopSettingSave(
                            shopaddress: controller.shopAddressController.text,
                            shopdescription:
                                controller.shopDescriptionController.text,
                            shopname: controller.shopNameController.text,
                            shopponumber: controller.shopMobileController.text,
                            shopweb: controller.shopWebsiteController.text,
                          );
                          controller.isLoading(false);
                        }

                        VxToast.show(context,
                            msg: "Shop setting compleated 😊",
                            textColor: white,
                            bgColor: green);
                      },
                      child: normalText(text: save, color: green),
                    ),
                  ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Image.asset(
                logo,
                height: 100,
                width: 100,
              ),
              30.heightBox,
              shopTextField(
                controller: controller.shopNameController,
                hint: shopName,
                lebel: name,
              ),
              10.heightBox,
              shopTextField(
                controller: controller.shopAddressController,
                hint: shopAddress,
                lebel: shopAddress,
              ),
              10.heightBox,
              shopTextField(
                controller: controller.shopMobileController,
                hint: shopMobileNumber,
                lebel: shopMobileNumber,
              ),
              10.heightBox,
              shopTextField(
                controller: controller.shopWebsiteController,
                hint: shopWebsite,
                lebel: shopWebsite,
              ),
              10.heightBox,
              shopTextField(
                  controller: controller.shopDescriptionController,
                  hint: description,
                  lebel: description,
                  maxline: 3),
              10.heightBox,
            ]),
          ),
        ),
      ),
    );
  }
}
