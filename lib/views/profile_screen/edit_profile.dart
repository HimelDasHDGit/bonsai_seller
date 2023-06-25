import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/const/images.dart';
import 'package:bonsai_seller/views/widgets/textField.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,color: green,)),
        title: boldText(text: editProfile,size: 16.0,color: green),
        actions: [
          TextButton(
            onPressed: (){},
            child: normalText(text: save,color: red),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.asset(product,width: 150,).box.roundedFull.clip(Clip.antiAlias).make(),
            20.heightBox,
            ElevatedButton(
                onPressed: (){},
                child: normalText(
                    text: changeImage,color: white,
                ),
              style: OutlinedButton.styleFrom(
                backgroundColor: green
              ),
            ),
            10.heightBox,
            Divider(color: green,),
            10.heightBox,
            textField(lebel: name,hint: shopName),
            10.heightBox,
            textField(lebel: password,hint: passwordHint),
            10.heightBox,
            textField(lebel: confirmPassword, hint: passwordHint),
            10.heightBox,
          ],
        ),
      ),
    );
  }
}
