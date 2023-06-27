import 'package:bonsai_seller/const/const.dart';

Widget loadingIndicator(){
  return Center(
    child: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(green),
    ),
  );
}