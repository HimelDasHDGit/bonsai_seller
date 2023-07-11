import 'package:bonsai_seller/const/const.dart';

Widget loadingIndicator({color = green}) {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(color),
    ),
  );
}
