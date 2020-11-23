import 'package:dartz/dartz.dart';
import 'package:notes_app/domain/core/errors.dart';
import 'failures.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  bool isValid() => value.isRight();

  T getOrCrash() {
    // id = identify -> same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError, id);
  }

  @override
  String toString() => 'Value($value)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
