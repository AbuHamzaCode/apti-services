import 'package:formz/formz.dart';

enum SurnameError { empty, invalid }

class Surname extends FormzInput<String, SurnameError> {
  const Surname.pure([String value = '']) : super.pure(value);
  const Surname.dirty([String value = '']) : super.dirty(value);

  static final RegExp _surnameRegExp = RegExp(
    r'^(?=.*[a-z])[A-Za-z ]{2,}$',
  );

  @override
  SurnameError? validator(String value) {
    if (value.isEmpty == true || value == "") {
      return SurnameError.empty;
    }
    return _surnameRegExp.hasMatch(value) && value.length < 35
        ? null
        : value.isEmpty
        ? null
        : SurnameError.invalid;
  }
}

extension Explanation on SurnameError {
  String? get name {
    switch (this) {
      case SurnameError.invalid:
        return "This is not a valid name";
      default:
        return null;
    }
  }
}