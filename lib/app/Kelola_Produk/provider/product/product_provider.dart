import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lazyui/lazyui.dart';

import '../../data/model/product_model.dart';


List<Map<String, dynamic>> daftarProducts = [
  {
    'id': 2,
    'name': 'Nike',
    'price': 1500000,
    'stock': 33,
    'image': 'assets/images/nike.jpg',
  },
  {
    'id': 2,
    'name': 'Havaianas',
    'price': 200000,
    'stock': 20,
    'image': 'assets/images/havaianas.jpg',
  },
  {
    'id': 3,
    'name': 'New Balance',
    'price': 2500000,
    'stock': 50,
    'image': 'assets/images/newbalance.jpeg',
  },
];

//final forms = LzForm.make(['name']);
class ProductListNotifier extends StateNotifier<AsyncValue<List<Product>>> {
   
  
  ProductListNotifier() : super(const AsyncValue.loading()) {
    getProduct();
    
  }

  List<Map<String,dynamic>> products = []; // List of Product objects
  List<Product> searchResults = [];
  List<Map<String,dynamic>> al = daftarProducts;

  bool isLoading = false;

  void create(Product item) {
    state.whenData((data) {
      data.insert(0, item);
      state = AsyncValue.data(data);
    });
    
  }

 void search(String query) {
  state.whenData((data) {
    searchResults = data.where((product) {
      return (product.name ?? '').toLowerCase().contains(query.toLowerCase()) ||
          product.id.toString() == query;
    }).toList();
  });
}
  Future getProduct() async {
    try {
      state = const AsyncValue.loading();


      // Convert daftarProducts to Product objects using fromJson()
     state = AsyncValue.data(daftarProducts.map((e) => Product.fromJson(e)).toList());
      
    } catch (e, s) {
      Errors.check(e, s);

      // Handle errors
    }
  }

  void update(int id, Product value) {
  try {
    state.whenData((data) {
      final index = data.indexWhere((e) => e.id == id);
      if (index > -1) {
        data[index] = value;
        state = AsyncValue.data(List<Product>.from(data));
      }
    });
  } catch (e, s) {
    Errors.check(e, s);
    LzToast.show('User has been Updating..');
    // Handle errors
  }
}


  //  Future<void> update(int id, Product product) async {
  //   try {
  //     final form = LzForm.validate(forms, required: ['name'], notifierType: LzFormNotifier.text);

  //     if (form.ok) {
  //       LzToast.overlay('Updating...');
  //       await Future.delayed(1.s);

  //       state.whenData((data) {
  //         final productIndex = data.indexWhere((p) => p.id == id);

  //         if (productIndex != -1) {
  //           data[productIndex] = product;
  //           state = AsyncValue.data(List<Product>.from(data));
  //         }
  //       });

  //       LzToast.show('Produk telah diperbarui');
  //     }
  //   } catch (e, s) {
  //     Errors.check(e, s);
  //   } finally {
  //     LzToast.dismiss();
  //   }
  // }

  void deleteProduct(int index) {
  state.whenData((data) {  
      daftarProducts.removeWhere((product) => product['id'] == index);
      state = AsyncValue.data(List<Product>.from(data));
    
  });
      
    LzToast.show('User has been deleted');
  }
}

final productProvider = StateNotifierProvider<ProductListNotifier, AsyncValue<List<Product>>>(
    (ref) => ProductListNotifier());