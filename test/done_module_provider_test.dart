import 'package:flutter_test/flutter_test.dart';
import 'package:lat_set_state/provider/done_module_provider.dart';

void main() {
  group('Provider Test', () {
    // arrange
    final testModuleName = 'Test Module';
    var doneModuleProvider = DoneModuleProvider();

    test('should contain new item when module completed', () {
      // act
      doneModuleProvider.complete(testModuleName);

      // assert
      var result = doneModuleProvider.doneModuleList.contains(testModuleName);
      expect(result, true);
    });

    test('remove item', () {
      // act
      doneModuleProvider.remove(testModuleName);

      var remove = doneModuleProvider.doneModuleList.contains(testModuleName);
      expect(remove, false);
    });
  });
}
