abstract class ISecureStorage {
  Future<void> saveRefreshToken(String token);
  Future<String> getRefreshToken();
}
