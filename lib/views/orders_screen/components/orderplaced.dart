import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';

Widget orderPlaceddetails({title1, title2, d1, d2}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldText(text: "title-1",color: green),
            boldText(text: "d1",color: green),
          ],
        ),
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText(text: "title-2",color: green),
              boldText(text: "d2",color: fontGrey),
            ],
          ),
        ),
      ],
    ),
  );
}