// such as the repo
abstract class DataBaseService {
  Future<void> addDtata({
    required String path,
    required Map<String, dynamic> data,
    String? uId,
  });

  Future<Map<String, dynamic>> getData({
    required String path,
    required String uId,
  });

  Future<bool> checkIfDataExist({required String path, required String uId});
}
