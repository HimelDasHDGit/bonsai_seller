import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class ShopSettings extends StatelessWidget {
  const ShopSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
    );
  }
}
