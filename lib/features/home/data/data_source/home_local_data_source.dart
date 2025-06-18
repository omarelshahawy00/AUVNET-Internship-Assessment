import 'package:hive/hive.dart';
import 'package:nawel/features/home/data/models/user_model.dart';

abstract class HomeLocalDataSource {
  Future<void> cacheUserData(UserModel user);
  Future<UserModel?> getCachedUserData(String userId);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  static const String userBoxName = 'user_box';

  @override
  Future<void> cacheUserData(UserModel user) async {
    final box = await Hive.openBox<UserModel>(userBoxName);
    await box.put(user.uid, user);
  }

  @override
  Future<UserModel?> getCachedUserData(String userId) async {
    final box = await Hive.openBox<UserModel>(userBoxName);
    return box.get(userId);
  }
}
