import 'dart:io';
import 'package:bonsai_seller/const/const.dart';
import 'package:bonsai_seller/controllers/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../models/category_model.dart';

class ProductsController extends GetxController{

  var loading = false.obs;


  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var priceController = TextEditingController();
  var quantityController = TextEditingController();


  var categoryList=<String>[].obs;
  var subCategoryList=<String>[].obs;
  List<Category> category=[];
  var imagesLink = [];
  var imagesList = RxList<dynamic>.generate(3, (index) => null);

  var categoryValue =''.obs;
  var subCategoryValue = ''.obs;
  var selectedColor = 0.obs;

  getCategories()async{

    var data = await rootBundle.loadString('lib/services/category_model.json');
    var cat = categoryModelFromJson(data);
    category = cat.categories;

  }

  populateCategoryList(){

    categoryList.clear();

    for(var item in category){
      categoryList.add(item.name);
    }

  }

  populateSubCategoryList(cat){

    subCategoryList.clear();

    var data = category.where((element) => element.name == cat).toList();

    for(var i = 0; i<data.first.subcategory.length; i++){
      subCategoryList.add(data.first.subcategory[i]);
    }

  }

  pickImage(index,context)async{
    try{
      final img = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 100);

      if (img == null) {
        return;
      }  else{
        imagesList[index] = File(img.path);
      }

    } catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadImages()async{
    imagesLink.clear();
    for(var item in imagesList){
      if (item !=null) {
        var filename = basename(item.path);
        var destination = "images/vendors/${currentUser!.uid}/$filename";
        Reference ref = FirebaseStorage.instance.ref().child(destination);
        await ref.putFile(item);
        var n = await ref.getDownloadURL();
        imagesLink.add(n);
      }
    }
  }

  uploadProduct(context)async{
    var store = firestore.collection(productsCollection).doc();
    await store.set({
      "category": categoryValue.value,
      "colors": FieldValue.arrayUnion([Colors.red.value,Colors.green.value,Colors.greenAccent.value]),
      "description": descriptionController.text,
      "images": FieldValue.arrayUnion(imagesLink),
      "is_featured": false,
      "name": nameController.text,
      "price": priceController.text,
      "quantity": quantityController.text,
      "rating": "5.0",
      "seller": Get.find<HomeController>().username,
      "subCategory":subCategoryValue.value,
      "vender_id": currentUser!.uid,
      "wishlist": FieldValue.arrayUnion([]),
      "featured_id": '',

    });
    loading(false);
    VxToast.show(context, msg: "New product added", textColor: green);
  }

  addFeatured(docId) async{

   await firestore.collection(productsCollection).doc(docId).set({
      'featured_id': currentUser!.uid,
      'is_featured': true,
    }, SetOptions(
      merge: true
    ));


  }

  removeFeatured(docId) async{

    await firestore.collection(productsCollection).doc(docId).set({
      'featured_id': '',
      'is_featured': false,
    }, SetOptions(
        merge: true
    ));

  }

  removeProduct(docId)async{

    await firestore.collection(productsCollection).doc(docId).delete();

  }


}