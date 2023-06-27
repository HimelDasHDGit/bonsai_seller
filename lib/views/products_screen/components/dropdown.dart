import 'package:bonsai_seller/const/colors.dart';
import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';

Widget dropDown(){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: DropdownButton(
      value: null,
        isExpanded: true,
        iconDisabledColor: white,
        iconSize: 30,
        underline: const Divider(height: 3,thickness: 1,color: white,),
        hint: normalText(text: "Choose category",color: white),
        items: const [],
        onChanged: (value){}
    ).box.color(green).padding(EdgeInsets.all(4)).roundedSM.make(),
  );
}