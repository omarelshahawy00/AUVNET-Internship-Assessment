import 'package:nawel/core/network/constants/api_constant.dart';
import 'package:nawel/core/network/services/data_base_service.dart';
import 'package:nawel/features/home/data/models/user_model.dart';

class HomeRemoteDataSource {
  final DataBaseService firestore;

  HomeRemoteDataSource({required this.firestore});

  Future<UserModel> getUserData(String userId) async {
    final userData = await firestore.getData(
      path: ApiConstant.getUserData,
      uId: userId,
    );

    if (userData != null) {
      try {
        final userModel = UserModel.fromJson(userData);

        return userModel;
      } catch (e) {
        throw Exception('Failed to parse user data: $e');
      }
    } else {
      throw Exception('User not found');
    }
  }
}
