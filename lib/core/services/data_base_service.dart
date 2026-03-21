// such as the repo
abstract class DataBaseService {
  Future<void> addDtata({
    required String path,
    required Map<String, dynamic> data,
  });
}
