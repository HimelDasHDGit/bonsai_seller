import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';

Widget orderPlaceddetails({title1, title2, d1, d2,color=green}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldText(text: title1,color: green),
            boldText(text: d1,color: color),
          ],
        ),
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText(text: title2,color: green),
              boldText(text: d2,color: fontGrey),
            ],
          ),
        ),
      ],
    ),
  );
}