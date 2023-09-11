import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latihan_project/app/Kelola_Produk/data/model/product_model.dart';
import 'package:lazyui/lazyui.dart';

import 'product_provider.dart';

class SearchProductNotifier extends StateNotifier<AsyncValue<List<Product>>>{
  final AutoDisposeStateNotifierProviderRef ref;
  SearchProductNotifier(this.ref) : super(const AsyncValue.data([]));

  Future searchProduct(String keword) async{
    try {
      final productNotifier = ref.read(productProvider.notifier);
      state = const AsyncLoading();

      //simulasi seolah olah kita mengambil data dari api
      await Future.delayed(1.s);

      productNotifier.state.whenData((value){
        List<Product> products = value.where((e) => e.name!.toLowerCase().contains(keword.toLowerCase())).toList();
      });

    } catch (e, s) {
      Errors.check(e, s);
    }
  }
}

final searchProductProvider = StateNotifierProvider.autoDispose<SearchProductNotifier, AsyncValue<List<Product>>>((ref){
  return SearchProductNotifier(ref);
}
);