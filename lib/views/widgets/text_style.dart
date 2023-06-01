import 'package:bonsai_seller/const/const.dart';

Widget normalText({text,color = Colors.white,size = 14.0}){
  return "$text".text.color(color).fontFamily('sans_semibold').size(size).make();
}

Widget boldText({text,color = Colors.white,size = 14.0}){
  return "$text".text.semiBold.color(color).fontFamily('sans_bold').size(size).make();
}