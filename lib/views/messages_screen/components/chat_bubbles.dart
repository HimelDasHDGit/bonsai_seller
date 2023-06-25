import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';

Widget chatBubble(){
  return Directionality(
    // textDirection: data['uid'] == currentUser!.uid? TextDirection.ltr : TextDirection.ltr,
    textDirection: TextDirection.ltr,
    child: Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        // color: data['uid'] == currentUser!.uid? redColor : fontGrey,
        color: green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "${data['msg']}".text.white.size(16).make(),
          // 10.heightBox,
          // time.text.color(whiteColor.withOpacity(0.5)).size(5).make(),
          normalText(text: "Your messages...."),
          normalText(text: "10.30PM"),
        ],
      ),
    ),
  );
}