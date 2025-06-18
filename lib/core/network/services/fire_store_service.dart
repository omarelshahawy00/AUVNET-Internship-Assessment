import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nawel/core/errors/firebase_exp.dart';
import 'package:nawel/core/network/services/data_base_service.dart';

class FireStoreService implements DataBaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    try {
      if (docId != null) {
        await _firestore.collection(path).doc(docId).set(data);
      } else {
        await _firestore.collection(path).add(data);
      }
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? uId,
    Map<String, dynamic>? query,
  }) async {
    try {
      if (uId != null) {
        var data = await _firestore.collection(path).doc(uId).get();
        return data.data();
      } else {
        Query<Map<String, dynamic>> data = _firestore.collection(path);

        if (query != null) {
          if (query['orderBy'] != null) {
            var orderByField = query['orderBy'];
            var descending = query['descending'] ?? false;
            data = data.orderBy(orderByField, descending: descending);
          }
          if (query['limit'] != null) {
            data = data.limit(query['limit']);
          }
          if (query['where'] != null) {
            final whereClause = query['where'] as Map<String, dynamic>;
            data = data.where(
              whereClause['field'],
              isEqualTo: whereClause['value'],
            );
          }
        }

        var result = await data.get();
        return result.docs.map((e) => e.data()).toList();
      }
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  @override
  Future<bool> isDataExist({required String path, required String uId}) async {
    try {
      var data = await _firestore.collection(path).doc(uId).get();
      return data.exists;
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  // Additional useful methods
}
