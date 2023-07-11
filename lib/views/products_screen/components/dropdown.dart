import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/controllers/products_controller.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';

Widget dropDown(hint,List<String>list,dropvalue, ProductsController controller){
  return Obx(
      ()=>Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButton(
        value: dropvalue.value == '' ? null : dropvalue.value,
          isExpanded: true,
          iconDisabledColor: white,
          iconSize: 30,
          underline: const Divider(height: 3,thickness: 1,color: white,),
          hint: normalText(text: "$hint",color: white),
          items: list.map((e){
            return DropdownMenuItem(child: e.toString().text.make(),value: e,);
          }).toList(),
          onChanged: (newValue){
          if (hint == "Category") {
            controller.subCategoryValue.value = '';
            controller.populateSubCategoryList(newValue.toString());
          }
          dropvalue.value = newValue.toString();
          }
      ).box.color(green).padding(const EdgeInsets.all(4)).roundedSM.make(),
    ),
  );
}