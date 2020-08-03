import 'package:cloud_firestore_mocks/src/util.dart';
import 'package:test/test.dart';

void main() {
  test('buildSubpathForCollectionGroup', () {
    final root = <String, dynamic>{
      'foo': {
        'foo_1': {
          'bar': {
            'bar_1': {'value': '1'}
          }
        },
        'foo_2': {
          'bar': {
            'bar_2': {'value': '2'}
          }
        }
      },
      'bar': {
        'bar_3': {'value': '3'}
      },
      'baz': {
        'baz_1': {'hello': 'world'}
      }
    };
    const collectionId = 'bar';
    final result = <String, dynamic>{};
    buildSubpathForCollectionGroup(root, root, collectionId, result);
    // result has only paths which contain "bar"
    expect(result, root..remove('baz'));
  });
}
