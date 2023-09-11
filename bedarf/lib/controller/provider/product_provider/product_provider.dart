import 'dart:io';

import 'package:bedarf/controller/services/product_services/product_services.dart';
import 'package:bedarf/model/product_model.dart';
import 'package:flutter/material.dart';

class SellerProductProvider extends ChangeNotifier {
  List<File> productImages = [];
  List<String> productImagesURL = [];
  List<ProductModel> products = [];
  bool sellerProductsFetched = false;

  fetchProductImagesFromGallery({required BuildContext context}) async {
    productImages = await ProductServices.getImages(context: context);
    notifyListeners();
  }

  updateProductImagesURL({required List<String> imageURLs}) async {
    productImagesURL = imageURLs;
    notifyListeners();
  }

  fecthSellerProducts() async {
    products = await ProductServices.getSellersProducts();
    sellerProductsFetched = true;
    notifyListeners();
  }

  emptyProductImagesList() {
    productImages = [];
    notifyListeners();
  }
}
