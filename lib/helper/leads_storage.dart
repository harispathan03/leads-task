import 'package:get_storage/get_storage.dart';

import '../model/lead.dart';
import 'storage_helper.dart';

class LeadsStorage {
  final GetStorage _storage = GetStorage();

  /// Save new invoice
  Future<void> saveLead(Lead lead) async {
    List<dynamic> invoices = _storage.read(StorageKeys.leads) ?? [];

    invoices.add(lead.toJson());

    await _storage.write(StorageKeys.leads, invoices);
  }

  /// Get all invoices
  List<Lead> getLeads() {
    List invoices = _storage.read(StorageKeys.leads) ?? [];

    return invoices
        .map((json) => Lead.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  /// Update invoice by id
  // Future<void> updateInvoice(Lead lead) async {
  //   List invoices = _storage.read(StorageKeys.leads) ?? [];

  //   int index = invoices.indexWhere((e) => e['id'] == lead.id);

  //   if (index != -1) {
  //     invoices[index] = lead.toJson();
  //     await _storage.write(StorageKeys.leads, invoices);
  //   }
  // }

  /// Delete invoice by id
  // Future<void> deleteInvoice(String id) async {
  //   List invoices = _storage.read(StorageKeys.leads) ?? [];

  //   invoices.removeWhere((e) => e['id'] == id);

  //   await _storage.write(StorageKeys.leads, invoices);
  // }
}
