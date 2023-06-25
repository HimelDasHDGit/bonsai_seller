import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/const/images.dart';
import 'package:bonsai_seller/views/messages_screen/messages_screen.dart';
import 'package:bonsai_seller/views/profile_screen/edit_profile.dart';
import 'package:bonsai_seller/views/shop_screen/shop_setting.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings,size: 16.0,color: green),
        actions: [
          IconButton(
              onPressed: (){
                Get.to(()=> EditProfileScreen());
              },
              icon: const Icon(Icons.edit,color: green,),
          ),
          TextButton(
              onPressed: (){},
              child: normalText(text: logout,color: red),
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image.asset(product).box.roundedFull.clip(Clip.antiAlias).make(),
            title: boldText(text: "Vender name",color: green),
            subtitle: normalText(text: "himeldas12345@gmil.com",color: green),
          ),
          const Divider(),
          10.heightBox,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: List.generate(profileButtonTitles.length,
                      (index) => ListTile(
                        onTap: (){
                          switch(index){
                            case 0: Get.to(()=> ShopSettings());
                            break;
                            case 1: Get.to(()=> MessagesScreen());
                            break;
                          }
                        },
                        leading: Icon(profileButtonIcons[index],color: green,),
                        title: normalText(text: profileButtonTitles[index],color: green),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
