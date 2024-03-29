import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/views/widgets/text_style.dart';

Widget textField({lebel, hint, controller}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: TextFormField(
      controller: controller,
      cursorColor: green,
      decoration: InputDecoration(
        isDense: true,
        label: normalText(text: lebel, color: green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: green,
          ),
        ),
        hintText: hint,
      ),
    ),
  );
}

Widget addTextField({lebel, hint, controller}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: TextFormField(
      controller: controller,
      cursorColor: green,
      decoration: InputDecoration(
        isDense: true,
        label: normalText(text: lebel, color: green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: green,
          ),
        ),
        hintText: hint,
        hintStyle: TextStyle(color: green),
      ),
    ),
  );
}

Widget shopTextField({lebel, hint, controller, maxline}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: TextFormField(
      controller: controller,
      maxLines: maxline,
      cursorColor: white,
      decoration: InputDecoration(
        isDense: true,
        label: normalText(text: lebel, color: white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: white,
          ),
        ),
        hintText: hint,
        hintStyle: TextStyle(color: white),
      ),
    ),
  );
}
