import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lazyui/lazyui.dart';

import '../../data/model/transaction_model.dart';
import '../../provider/transaction/transaction_provider.dart';


class TransactionView extends ConsumerWidget {
  const TransactionView({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transcationku = ref.read(transacationProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: const Text('Transaction'),
        actions: [
          const Icon(Icons.add).onPressed(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormTransacation(notifier2: transcationku),
              ),
            );
          }),
        ],
      ),
      backgroundColor: Colors.blue[100],
      body: Consumer(builder: (context, ref, _) {
        final trans = ref.watch(transacationProvider);

        return trans.when(
          data: (bayar) {
            if (bayar.isEmpty) {
              return LzNoData(
                message: 'Opps! No data found',
                onTap: () => transcationku.getTransacation(),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: Refreshtor(
                    onRefresh: () async {
                      await transcationku.getTransacation();
                    },
                    child: LzListView(
                      children: bayar.generate((item, i) {
                        final key = GlobalKey();
                        return Container(
                          margin: Ei.only(b: 15),
                          height: 100,
                          width: context.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)
                          ),
                          child: ListTile(
                            title: Text(item.no_invoice ?? ''),
                            subtitle: Column(
                              crossAxisAlignment: Caa.start,
                              children: [
                                Text('Date: ${item.date}'),
                                Text('Total: ${item.total}')
                              ],
                            ),
                            key: key,
                            onTap: () {
                              DropX.show(key, options: ['Edit', 'Delete'].options(icons: [Icons.edit, Icons.delete], dangers: [1]), onSelect: (value) {
                                if (value.option == 'Edit') {
                                  context.push(FormTransacation(
                                    notifier2: transcationku,
                                    data: item,
                                  ));
                                } else {
                                  LzConfirm(
                                    title: 'Delete Data',
                                    type: LzConfirmType.bottomSheet,
                                    message: 'Are you sure you want to delete this data?',
                                    onConfirm: () => transcationku.deleteTransacation(item.id ?? 0),
                                  ).show(context);
                                }
                              });
                            },
                            trailing: Icon(Icons.more_vert),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            );
          },
          loading: () => LzLoader.bar(message: 'Loading...'),
          error: (error, _) => LzNoData(message: 'Opps! $error'),
        );
      }),
    );
  }
}

class FormTransacation extends StatelessWidget {
  final TransacationNotifier notifier2;
  final Transacation? data;

  const FormTransacation({Key? key, required this.notifier2, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forms = GlobalKey<FormState>();

    final TextEditingController invoiceController = TextEditingController(text: data?.no_invoice);
    final TextEditingController dateController = TextEditingController(text: data?.date.toString());
    final TextEditingController totalController = TextEditingController(text: data?.total?.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(data == null ? 'Add Transaction' : 'Edit Transaction'),
      ),
      body: Form(
        key: forms,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: invoiceController,
              decoration: InputDecoration(labelText: 'Invoice No', hintText: '...............'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Invoice No must be filled';
                }
                return null;
              },
            ),
            TextFormField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date', hintText: 'dd-mm-yy'),
            ),
            TextFormField(
              controller: totalController,
              decoration: InputDecoration(labelText: 'Total', hintText: '.........'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          if (forms.currentState?.validate() ?? false) {
            if (data != null) {
              notifier2.updatetT(data!.id ?? 0, Transacation(
                id: data!.id ?? 0,
                no_invoice: invoiceController.text,
                date: dateController.text.toDate(),
                total: int.tryParse(totalController.text) ?? 0,
              ));
            } else {
              notifier2.createT(Transacation(
                id: DateTime.now().millisecondsSinceEpoch,
                no_invoice: invoiceController.text,
                date: dateController.text.toDate(),
                total: int.tryParse(totalController.text) ?? 0,
              ));
            }
            Navigator.pop(context);
          }
        },
        child: Text('Submit'),
      ),
    );
  }
}
