import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';
import 'package:intl/intl.dart'as intl;

AppBar appBar({title}){
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    title: boldText(
        text: title,
        color: green,
        size: 16.0
    ),
    actions: [
      Center(
          child: boldText(
              text: intl.DateFormat(
                  "EEE, MMM d, ''yyyy"
              ).format(DateTime.now()),
              color: green
          ),
      ),
      10.widthBox,
    ],
  );
}