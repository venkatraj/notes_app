import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/domain/core/value_objects.dart';
import 'package:notes_app/domain/core/value_validators.dart';

import '../core/failures.dart';

@immutable
class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}
