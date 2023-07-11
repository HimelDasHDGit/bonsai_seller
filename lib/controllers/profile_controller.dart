import 'dart:io';

import 'package:bonsai_seller/const/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  late QueryDocumentSnapshot sellerData;

  var isLoading = false.obs;

  //profile image
  var profileImagePath = "".obs;
  var profileImageLink = "";

  //textfield controller
  final nameController = TextEditingController();
  final oldpasswordController = TextEditingController();
  final newpasswordController = TextEditingController();

  //shopSettingController
  final shopNameController = TextEditingController();
  final shopAddressController = TextEditingController();
  final shopMobileController = TextEditingController();
  final shopWebsiteController = TextEditingController();
  final shopDescriptionController = TextEditingController();

  changeImage(context) async {
    try {
      final img = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );
      if (img == null) return;
      profileImagePath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    var filename = basename(profileImagePath.value);
    var destination = "images/${currentUser!.uid}/$filename";
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImagePath.value));
    profileImageLink = await ref.getDownloadURL();
  }

  updateProfile({name, password, imageUrl}) async {
    var store = firestore.collection(usersCollection).doc(currentUser!.uid);
    await store.set({
      'name': name,
      'password': password,
      'imageUrl': imageUrl,
    }, SetOptions(merge: true));
    isLoading(false);
  }

  changeAuthPassword({email, password, newpassword}) async {
    final cred = EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newpassword);
    }).catchError((error) {
      print(error.toString());
    });
  }

  shopSettingSave(
      {shopname, shopaddress, shopponumber, shopweb, shopdescription}) async {
    var store = firestore.collection(usersCollection).doc(currentUser!.uid);

    await store.set({
      "storename": shopname,
      "storeaddress": shopaddress,
      "storenumber": shopponumber,
      "storeweb": shopweb,
      "storedescription": shopdescription,
    }, SetOptions(merge: true));
  }
}
