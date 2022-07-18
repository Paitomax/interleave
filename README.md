# [Interleave](https://pub.dev/packages/interleave)

Interleave your items easily.

## How to Use

```yaml
# add this line to your dependencies
interleave: ^0.0.1
```

```dart
import 'package:interleave/interleave.dart';
```

You can create a instance of `Interleave` with the following parameters:

| property                  | description                                                                | type                              | default        |
| --------------------------|----------------------------------------------------------------------------|-----------------------------------|----------------|
| `step`                    | Steps to interleave your items.                                            | `int`                             | required       |
| `offset`                  | Offset to begin interleaving, if not set, it will be equal `step`.         | `int?`                            | same as `step` |
| `itemLength`              | Quantity of items                                                          | `int`                             | required       |
| `interleavingItemLength`  | Quantity of items to interleave                                            | `int`                             | required       |
| `itemBuilder`             | Item builder method                                                        | `Widget (BuildContext, int, int)` | required       |
| `interleavingItemBuilder` | Interleaving item builder method                                           | `Widget (BuildContext, int, int)` | required       |

<br>

| method                    | description                                                                |
| --------------------------|----------------------------------------------------------------------------|
| `T item(int index)`       | Get item at index from a interleaved list                                  |
| `List<T> generate()`      | Generate a interleaved list                                                |

<br>

Its also possible to get item and interleaved list with `Interleave` static methods:

| method                           | description                                                         |
| ---------------------------------|---------------------------------------------------------------------|
| `List<T> Interleave.generateFromList`    | Generate a interleaved list passing two lists as param              |
| `List<T> Interleave.generateFromBuilder` | Generate a interleaved list passing item builders as param          |
| `T Interleave.itemFromList`              | Get item at index passing two lists as param                        |
| `T Interleave.itemFromBuilder`           | Get item at index passing item builders as param                    |


## Usage Examples

Generate a interleaved `List<T>` calling `generate` method:

```dart

final list = List.generate(10, (index) => index);
final anotherList = List.generate(3, (index) => index);

final interleavedList = Interleave(
  step: 2,
  offset: 3,
  itemLength: list.length,
  interleavingItemLength: anotherList.length,
  itemBuilder: (interleaveIndex, listIndex) {
    return 'a${list[interleaveIndex]}';
  },
  interleavingItemBuilder: (interleaveIndex, listIndex) {
    return 'b${anotherList[interleaveIndex]}';
  },
).generate();
print('list: $interleavedList'); // list: [a0, a1, a2, b0, a3, a4, b1, a5, a6, b2, a7, a8, a9]

```
<br>

Get item from index, calling `item` method:

```dart

final list = List.generate(10, (index) => index);
final anotherList = List.generate(3, (index) => index);

final item = Interleave(
  step: 2,
  offset: 3,
  itemLength: list.length,
  interleavingItemLength: anotherList.length,
  itemBuilder: (interleaveIndex, listIndex) {
    return 'a${list[interleaveIndex]}';
  },
  interleavingItemBuilder: (interleaveIndex, listIndex) {
    return 'b${anotherList[interleaveIndex]}';
  },
).item(3);
print('item: $item'); // item: b0

```
<br>

`Interleave.generateFromList`:

```dart

final list = List.generate(10, (index) => index);
final anotherList = List.generate(3, (index) => index);

final interleavedList = Interleave.generateFromList(
  step: 2,
  offset: 3,
  itemList: list,
  interleavingList: anotherList,
);
print('list: $interleavedList'); // list: [0, 1, 2, 0, 3, 4, 1, 5, 6, 2, 7, 8, 9]

```
<br>

`Interleave.generateFromBuilder`:

```dart

final list = List.generate(10, (index) => index);
final anotherList = List.generate(3, (index) => index);

final interleavedList = Interleave.generateFromBuilder(
  step: 2,
  offset: 3,
  itemLength: list.length,
  interleavingItemLength: anotherList.length,
  itemBuilder: (interleaveIndex, listIndex) {
    return 'a${list[interleaveIndex]}';
  },
  interleavingItemBuilder: (interleaveIndex, listIndex) {
    return 'b${anotherList[interleaveIndex]}';
  },
);
print('list: $interleavedList'); // list: [a0, a1, a2, b0, a3, a4, b1, a5, a6, b2, a7, a8, a9]

```
<br>

`Interleave.itemFromList`:

```dart

final list = List.generate(10, (index) => index);
final anotherList = List.generate(3, (index) => index);

final item = Interleave.itemFromList(
  step: 2,
  offset: 3,
  itemList: list,
  interleavingList: anotherList,
  index: 3,
);
print('item: $item'); // 0

```
<br>

`Interleave.itemFromBuilder`:

```dart

final list = List.generate(10, (index) => index);
final anotherList = List.generate(3, (index) => index);

final item = Interleave.itemFromBuilder(
  step: 2,
  offset: 3,
  itemLength: list.length,
  interleavingItemLength: anotherList.length,
  itemBuilder: (interleaveIndex, listIndex) {
    return 'a${list[interleaveIndex]}';
  },
  interleavingItemBuilder: (interleaveIndex, listIndex) {
    return 'b${anotherList[interleaveIndex]}';
  },
  index: 3,
);
print('item: $item'); // b0

```