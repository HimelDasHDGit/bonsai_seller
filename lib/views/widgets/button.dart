import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';

Widget button({title,color = green,onPress,size}){
  return ElevatedButton(
      onPressed: onPress,
    style: ElevatedButton.styleFrom(
     backgroundColor: color,
      padding: const EdgeInsets.all(12),
    ),
      child: boldText(text: title,size: size),
  );
}