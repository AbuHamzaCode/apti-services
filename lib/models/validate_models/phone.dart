import 'package:formz/formz.dart';

enum PhoneError { empty, invalid }

class Phone extends FormzInput<String, PhoneError> {
  const Phone.pure([String value = '']) : super.pure(value);
  const Phone.dirty([String value = '']) : super.dirty(value);

  static final RegExp _phoneRegExp = RegExp(
    r'^[0-9]{10}$',
  );

  @override
  PhoneError? validator(String value) {
    if (value.isEmpty == true || value == "") {
      return PhoneError.empty;
    }
    return _phoneRegExp.hasMatch(value) && value.length <= 10
        ? null
        : value.isEmpty
        ? null
        : PhoneError.invalid;
  }
}

extension Explanation on PhoneError {
  String? get name {
    switch (this) {
      case PhoneError.invalid:
        return "This is not a valid name";
      default:
        return null;
    }
  }
}