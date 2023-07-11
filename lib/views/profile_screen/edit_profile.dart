import 'dart:io';

import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/const/images.dart';
import 'package:bonsai_seller/controllers/profile_controller.dart';
import 'package:bonsai_seller/views/widgets/loading_indicator.dart';
import 'package:bonsai_seller/views/widgets/textField.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  final String? username;

  const EditProfileScreen({Key? key, this.username}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.find<ProfileController>();

  @override
  void initState() {
    controller.nameController.text = widget.username!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: green,
              )),
          title: boldText(text: editProfile, size: 16.0, color: green),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: controller.isLoading.value
                  ? loadingIndicator()
                  : ElevatedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: green,
                      ),
                      onPressed: () async {
                        controller.isLoading(true);
                        //if image is not selected
                        if (controller.profileImagePath.value.isNotEmpty) {
                          await controller.uploadProfileImage();
                        } else {
                          controller.profileImageLink =
                              controller.sellerData['imageUrl'];
                        }
                        //if old pass matches database
                        if (controller.sellerData['password'] ==
                                controller.oldpasswordController.text ||
                            controller.sellerData['name'] ==
                                controller.nameController.text) {
                          await controller.changeAuthPassword(
                            email: controller.sellerData['email'],
                            password: controller.oldpasswordController.text,
                            newpassword: controller.newpasswordController.text,
                          );

                          await controller.updateProfile(
                            imageUrl: controller.profileImageLink,
                            name: controller.nameController.text,
                            password: controller.newpasswordController.text,
                          );
                          VxToast.show(context,
                              msg: "Updated", textColor: green);
                        } else if (controller
                                .oldpasswordController.text.isEmptyOrNull &&
                            controller
                                .newpasswordController.text.isEmptyOrNull) {
                          await controller.updateProfile(
                            imageUrl: controller.profileImageLink,
                            name: controller.nameController.text,
                            password: controller.sellerData['password'],
                          );
                        } else {
                          VxToast.show(context,
                              msg: "An error occured", textColor: red);
                          controller.isLoading(false);
                        }
                      },
                      child: normalText(text: save, color: white),
                    ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              controller.sellerData['imageUrl'] == "" &&
                      controller.profileImagePath.isEmpty
                  ? Image.asset(
                      product,
                      width: 150,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : controller.sellerData['imageUrl'] != "" &&
                          controller.profileImagePath.isEmpty
                      ? Image.network(
                          controller.sellerData['imageUrl'],
                          fit: BoxFit.cover,
                          width: 150,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      : Image.file(
                          File(controller.profileImagePath.value),
                          fit: BoxFit.cover,
                          width: 150,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
              20.heightBox,
              ElevatedButton(
                onPressed: () {
                  controller.changeImage(context);
                },
                style: OutlinedButton.styleFrom(backgroundColor: green),
                child: normalText(
                  text: changeImage,
                  color: white,
                ),
              ),
              10.heightBox,
              const Divider(
                color: green,
              ),
              10.heightBox,

              //name

              textField(
                  lebel: name,
                  hint: shopName,
                  controller: controller.nameController),
              30.heightBox,
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: boldText(text: "Change password", color: green)),
              ),
              20.heightBox,

              //password

              textField(
                  lebel: oldPassword,
                  hint: passwordHint,
                  controller: controller.oldpasswordController),
              20.heightBox,
              textField(
                  lebel: newPassword,
                  hint: passwordHint,
                  controller: controller.newpasswordController),
              50.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
