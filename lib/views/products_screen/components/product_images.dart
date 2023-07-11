import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';

Widget productimages({required lebel, onTap}) {
  return Stack(children: [
    boldText(text: lebel, color: white, size: 16.0),
    const Positioned(
      bottom: 30,
      left: 25,
      child: Icon(Icons.add_a_photo),
    ),
  ],)
      .box
      .color(green)
      .padding(const EdgeInsets.all(8))
      .size(100, 100)
      .roundedSM
      .make();
}
