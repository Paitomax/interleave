import 'package:interleave/interleave.dart';

final list = List.generate(10, (index) => index);
final anotherList = List.generate(3, (index) => index);

void main() {
  item();

  generate();

  generateFromList();

  generateFromBuilder();

  itemFromList();

  itemFromBuilder();
}

void item() {
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
  print('item() -> $item');
}

void generate() {
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
  print('generate() -> $interleavedList');
}

void generateFromList() {
  final interleavedList = Interleave.generateFromList(
    step: 2,
    offset: 3,
    itemList: list,
    interleavingList: anotherList,
  );
  print('Interleave.generateFromList() -> $interleavedList');
}

void generateFromBuilder() {
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
  print('Interleave.generateFromBuilder() -> $interleavedList');
}

void itemFromList() {
  final item = Interleave.itemFromList(
    step: 2,
    offset: 3,
    itemList: list,
    interleavingList: anotherList,
    index: 3,
  );
  print('Interleave.itemFromList() -> $item');
}

void itemFromBuilder() {
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
  print('Interleave.itemFromBuilder() -> $item');
}
