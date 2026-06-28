// such as the repo
abstract class DataBaseService {
  Future<void> addDtata({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  });

  Future<dynamic> getData({
    required String path,
    String? docId,
    Map<String, dynamic> query,
  });

  Future<bool> checkIfDataExist({required String path, required String docId});

  Future<void> updateDtata({
    required String path,
    required Map<String, dynamic> data,
    required String docId,
  });
}
