import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';

Widget productimages({required lebel, onTap}) {
  return boldText(text: lebel, color: white, size: 16.0)
      .box
      .color(golden)
      .padding(const EdgeInsets.all(8))
      .size(100, 100)
      .roundedSM
      .make();
}
