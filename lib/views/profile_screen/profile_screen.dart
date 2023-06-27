import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/controllers/auth_controller.dart';
import 'package:bonsai_seller/controllers/profile_controller.dart';
import 'package:bonsai_seller/services/bonsai_server.dart';
import 'package:bonsai_seller/views/auth_screen/login_screen.dart';
import 'package:bonsai_seller/views/messages_screen/messages_screen.dart';
import 'package:bonsai_seller/views/profile_screen/edit_profile.dart';
import 'package:bonsai_seller/views/shop_screen/shop_setting.dart';
import 'package:bonsai_seller/views/widgets/loading_indicator.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings, size: 16.0, color: green),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const EditProfileScreen());
            },
            icon: const Icon(
              Icons.edit,
              color: green,
            ),
          ),
          TextButton(
            onPressed: () async {
              await Get.find<AuthController>().signout(context);
              Get.offAll(() => const LoginScreen());
            },
            child: normalText(text: logout, color: red),
          ),
        ],
      ),
      body: FutureBuilder(
          future: BonsaiServer.sellerProfile(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator();
            } else {
              controller.sellerData = snapshot.data!.docs[0];

              return Column(
                children: [
                  ListTile(
                    leading: Image.network(
                      "${controller.sellerData['imageUrl']}",
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
                    title: boldText(
                        text: "${controller.sellerData['name']}", color: green),
                    subtitle: normalText(
                        text: "${controller.sellerData['email']}",
                        color: green),
                  ),
                  const Divider(),
                  10.heightBox,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: List.generate(
                        profileButtonTitles.length,
                        (index) => ListTile(
                          onTap: () {
                            switch (index) {
                              case 0:
                                Get.to(() => const ShopSettings());
                                break;
                              case 1:
                                Get.to(() => const MessagesScreen());
                                break;
                            }
                          },
                          leading: Icon(
                            profileButtonIcons[index],
                            color: green,
                          ),
                          title: normalText(
                              text: profileButtonTitles[index], color: green),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
