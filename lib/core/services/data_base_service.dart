// such as the repo
abstract class DataBaseService {
  Future<void> addDtata({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  });

  Future<dynamic> getData({required String path, String? docId});

  Future<bool> checkIfDataExist({required String path, required String docId});
}
