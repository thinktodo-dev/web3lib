import 'package:test/test.dart';
import 'package:web3lib/web3lib.dart';

import '../mock_client.dart';

void main() {
  test('getClientVersion', () async {
    final client = MockClient(expectAsync2((method, data) {
      expect(method, 'web3_clientVersion');
      return 'dart-web3lib-test';
    }));
    final web3 = Web3Client('', client);
    addTearDown(web3.dispose);

    expect(web3.getClientVersion(), completion('dart-web3lib-test'));
  });
}
