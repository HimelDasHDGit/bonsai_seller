import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';

Widget dashboardButton(context,{title, count,icon,width,height}){

  var size = MediaQuery.of(context).size;

  return Row(
    children: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            normalText(text: title,size: 15.0),
            boldText(text: count,size: 20.0),
          ],
        ),
      ),
      Image.asset(icon,width: width,height:height,color: Colors.white,),
    ],
  ).box.color(green).roundedLg.size(size.width*0.45, 65).shadowMd.padding(const EdgeInsets.all(10)).make();
}