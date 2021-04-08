import 'package:fetch_api_data/apimodule/api_service.dart';
import 'package:fetch_api_data/productmodule/models/product_model.dart';
import 'package:get/get.dart';
class ProductController extends GetxController
{
  var isLoading = true.obs;
  var productList = List<ProductModel>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}