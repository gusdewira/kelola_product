import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lazyui/lazyui.dart';

import '../../data/model/transaction_model.dart';



List<Transacation> daftarPay = [
   Transacation(
   id : 1,
   no_invoice: 'dk-trf12-mmm789',
   date : DateTime(2022,4,4),
   total : 2500000,
   ),
   Transacation(
   id : 2,
   no_invoice: 'dk-saf13-kkk987',
  date :DateTime(2023,5,6),
   total : 3000000,
   ),
   Transacation(
   id : 3,
   no_invoice: 'dk-gah08-yiii10',
   date : DateTime(2023,2,8),
   total : 400000,
   ),

];

class TransacationNotifier extends StateNotifier<AsyncValue<List<Transacation>>> {
   
  
  TransacationNotifier() : super(const AsyncValue.loading()) {
    getTransacation();
    
  }

  List<Transacation> transacation = [];

  

  void createT(Transacation item) {
    state.whenData((data) {
      data.insert(0, item);
      state = AsyncValue.data(data);
    });
    LzToast.show('User has been Create...');
  }


  Future getTransacation() async {
  
     try {
      state = const AsyncValue.loading();
      
      daftarPay.sort((a, b) => b.date!.compareTo(a.date ?? DateTime(0)));


      // Convert daftarProducts to Product objects using fromJson()
     state = AsyncValue.data(daftarPay.map((e) => Transacation.fromJson(e.toJson())).toList());
      
    } catch (e, s) {
      Errors.check(e, s);

      // Handle errors
    }
  }


  void updatetT(int id, Transacation value) {
  try {
    state.whenData((data) {
      final index = data.indexWhere((e) => e.id == id);
      if (index > -1) {
        data[index] = value;
        state = AsyncValue.data(List<Transacation>.from(data));
      }
    });
  } catch (e, s) {
    Errors.check(e, s);
    
    // Handle errors
  }
  LzToast.show('User has been Updating..');
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

  void deleteTransacation(int index) {
  state.whenData((data) {  
      transacation.removeWhere((e) => e.id == index);
      state = AsyncValue.data(List<Transacation>.from(data));
    
  });
      
    LzToast.show('User has been deleted');
  }
}

final transacationProvider = StateNotifierProvider<TransacationNotifier, AsyncValue<List<Transacation>>>(
    (ref) => TransacationNotifier());
