abstract class DataBaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId});

  Future<dynamic> getData(
      {required String path, String? uId, Map<String, dynamic>? query});

  Future<bool> isDataExist({required String path, required String uId});
}
