import 'package:interleave/interleave.dart';
import 'package:test/test.dart';

void main() {
  group('generate', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('should interleave by 1 step', () {
      final interleavedList = Interleave(
        step: 1,
        itemLength: 3,
        interleavingItemLength: 3,
        itemBuilder: (interleaveIndex, listIndex) => 'a$interleaveIndex',
        interleavingItemBuilder: (interleaveIndex, listIndex) =>
            'b$interleaveIndex',
      ).generate();
      expect(interleavedList, ['a0', 'b0', 'a1', 'b1', 'a2', 'b2']);
    });

    test('should interleave by 1 step and offset equal step', () {
      final interleavedList = Interleave(
        step: 1,
        itemLength: 3,
        interleavingItemLength: 3,
        itemBuilder: (interleaveIndex, listIndex) => 'a$interleaveIndex',
        interleavingItemBuilder: (interleaveIndex, listIndex) =>
            'b$interleaveIndex',
      ).generate();
      expect(interleavedList, ['a0', 'b0', 'a1', 'b1', 'a2', 'b2']);
    });

    test('should interleave by 1 step and offset equal 0', () {
      final interleavedList = Interleave(
        step: 1,
        offset: 0,
        itemLength: 3,
        interleavingItemLength: 3,
        itemBuilder: (interleaveIndex, listIndex) => 'a$interleaveIndex',
        interleavingItemBuilder: (interleaveIndex, listIndex) =>
            'b$interleaveIndex',
      ).generate();
      expect(interleavedList, ['b0', 'a0', 'b1', 'a1', 'b2', 'a2']);
    });

    test('should interleave by 2 step', () {
      final interleavedList = Interleave(
        step: 2,
        itemLength: 6,
        interleavingItemLength: 3,
        itemBuilder: (interleaveIndex, listIndex) => 'a$interleaveIndex',
        interleavingItemBuilder: (interleaveIndex, listIndex) =>
            'b$interleaveIndex',
      ).generate();
      expect(interleavedList,
          ['a0', 'a1', 'b0', 'a2', 'a3', 'b1', 'a4', 'a5', 'b2']);
    });

    test('should interleave by 2 step and offset equal 1', () {
      final interleavedList = Interleave(
        step: 2,
        offset: 1,
        itemLength: 6,
        interleavingItemLength: 3,
        itemBuilder: (interleaveIndex, listIndex) => 'a$interleaveIndex',
        interleavingItemBuilder: (interleaveIndex, listIndex) =>
            'b$interleaveIndex',
      ).generate();
      expect(interleavedList,
          ['a0', 'b0', 'a1', 'a2', 'b1', 'a3', 'a4', 'b2', 'a5']);
    });

    test(
        'should interleave by 1 step and has consecutive interleavingItems on final positions when interleavingItemLength > itemLength',
        () {
      final interleavedList = Interleave(
        step: 1,
        itemLength: 3,
        interleavingItemLength: 6,
        itemBuilder: (interleaveIndex, listIndex) => 'a$interleaveIndex',
        interleavingItemBuilder: (interleaveIndex, listIndex) =>
            'b$interleaveIndex',
      ).generate();
      expect(interleavedList,
          ['a0', 'b0', 'a1', 'b1', 'a2', 'b2', 'b3', 'b4', 'b5']);
    });

    test(
        'should interleave by 1 step and has consecutive Items on final positions when itemLength > interleavingItemLength',
        () {
      final interleavedList = Interleave(
        step: 1,
        itemLength: 6,
        interleavingItemLength: 3,
        itemBuilder: (interleaveIndex, listIndex) => 'a$interleaveIndex',
        interleavingItemBuilder: (interleaveIndex, listIndex) =>
            'b$interleaveIndex',
      ).generate();
      expect(interleavedList,
          ['a0', 'b0', 'a1', 'b1', 'a2', 'b2', 'a3', 'a4', 'a5']);
    });

    test(
        'should has consecutive items then consecutive interleavingItems when offset is equal than itemsLength',
        () {
      final interleavedList = Interleave(
        step: 1,
        offset: 3,
        itemLength: 3,
        interleavingItemLength: 3,
        itemBuilder: (interleaveIndex, listIndex) => 'a$interleaveIndex',
        interleavingItemBuilder: (interleaveIndex, listIndex) =>
            'b$interleaveIndex',
      ).generate();
      expect(interleavedList, ['a0', 'a1', 'a2', 'b0', 'b1', 'b2']);
    });

    test(
        'should has consecutive items then consecutive interleavingItems when offset is greater than itemsLength',
        () {
      final interleavedList = Interleave(
        step: 1,
        offset: 4,
        itemLength: 3,
        interleavingItemLength: 3,
        itemBuilder: (interleaveIndex, listIndex) => 'a$interleaveIndex',
        interleavingItemBuilder: (interleaveIndex, listIndex) =>
            'b$interleaveIndex',
      ).generate();
      expect(interleavedList, ['a0', 'a1', 'a2', 'b0', 'b1', 'b2']);
    });

    test(
        'should has consecutive items then consecutive interleavingItems when step is equal itemsLength',
        () {
      final interleavedList = Interleave(
        step: 3,
        itemLength: 3,
        interleavingItemLength: 3,
        itemBuilder: (interleaveIndex, listIndex) => 'a$interleaveIndex',
        interleavingItemBuilder: (interleaveIndex, listIndex) =>
            'b$interleaveIndex',
      ).generate();
      expect(interleavedList, ['a0', 'a1', 'a2', 'b0', 'b1', 'b2']);
    });

    test('should throw AssertionError when step is less than 1', () {
      expect(
          () => Interleave(
                step: 0,
                itemLength: 3,
                interleavingItemLength: 3,
                itemBuilder: (interleaveIndex, listIndex) =>
                    'a$interleaveIndex',
                interleavingItemBuilder: (interleaveIndex, listIndex) =>
                    'b$interleaveIndex',
              ).generate(),
          throwsA(isA<AssertionError>()));
    });

    test('should throw AssertionError when offset is negative', () {
      expect(
          () => Interleave(
                step: 1,
                offset: -1,
                itemLength: 3,
                interleavingItemLength: 3,
                itemBuilder: (interleaveIndex, listIndex) =>
                    'a$interleaveIndex',
                interleavingItemBuilder: (interleaveIndex, listIndex) =>
                    'b$interleaveIndex',
              ).generate(),
          throwsA(isA<AssertionError>()));
    });

    test('should throw AssertionError when itemLength is negative', () {
      expect(
          () => Interleave(
                step: 1,
                itemLength: -3,
                interleavingItemLength: 3,
                itemBuilder: (interleaveIndex, listIndex) =>
                    'a$interleaveIndex',
                interleavingItemBuilder: (interleaveIndex, listIndex) =>
                    'b$interleaveIndex',
              ).generate(),
          throwsA(isA<AssertionError>()));
    });

    test('should throw AssertionError when interleavingItemLength is negative',
        () {
      expect(
          () => Interleave(
                step: 1,
                itemLength: 3,
                interleavingItemLength: -3,
                itemBuilder: (interleaveIndex, listIndex) =>
                    'a$interleaveIndex',
                interleavingItemBuilder: (interleaveIndex, listIndex) =>
                    'b$interleaveIndex',
              ).generate(),
          throwsA(isA<AssertionError>()));
    });

    test(
        'should throw AssertionError when itemLength and interleavingItemLength is zero or less',
        () {
      expect(
          () => Interleave(
                step: 1,
                itemLength: 0,
                interleavingItemLength: 0,
                itemBuilder: (interleaveIndex, listIndex) =>
                    'a$interleaveIndex',
                interleavingItemBuilder: (interleaveIndex, listIndex) =>
                    'b$interleaveIndex',
              ).generate(),
          throwsA(isA<AssertionError>()));
    });
  });

  group('item', () {
    test('should throw RangeError when index is less than zero', () {
      expect(
          () => Interleave(
                step: 1,
                itemLength: 3,
                interleavingItemLength: 3,
                itemBuilder: (interleaveIndex, listIndex) =>
                    'a$interleaveIndex',
                interleavingItemBuilder: (interleaveIndex, listIndex) =>
                    'b$interleaveIndex',
              ).item(-1),
          throwsA(isA<RangeError>()));
    });

    test('should throw RangeError when index is greater than length', () {
      final interleave = Interleave(
        step: 1,
        itemLength: 3,
        interleavingItemLength: 3,
        itemBuilder: (interleaveIndex, listIndex) => 'a$interleaveIndex',
        interleavingItemBuilder: (interleaveIndex, listIndex) =>
            'b$interleaveIndex',
      );
      expect(
          () => interleave.item(interleave.length), throwsA(isA<RangeError>()));
    });
  });
}
