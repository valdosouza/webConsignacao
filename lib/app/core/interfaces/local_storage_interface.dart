abstract class LocalStorage {
  Future<dynamic> get({required String key, dynamic defaultValue});
  Future<void> delete({required String key});
  bool hasKey({required String key});
  Future<void> saveItem({required String key, required dynamic value});
}
