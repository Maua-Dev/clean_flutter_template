import 'package:clean_flutter_template/shared/infra/storage/secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'secure_storage_test.mocks.dart';

@GenerateMocks([SecureStorage])
void main() {
  SecureStorage storage = MockSecureStorage();

  var token = '123';

  setUpAll(() {
    when(storage.getRefreshToken()).thenAnswer((_) async => token);
  });

  test('[TEST] - secureStorage', () async {
    await storage.saveRefreshToken(token);
    expect(await storage.getRefreshToken(), token);
  });
}
