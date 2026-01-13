class Student {
  // Properties
  late String _firstName;
  late String _lastName;
  late int _idNumber;

  // Constructors
  Student({required String fName, required String lName, int id = 0}) {
    firstName = fName;
    lastName = lName;
    idNumber = id;
  }

  Student.emptyStudent() {
    _firstName = '';
    _lastName = '';
    _idNumber = -1;
  }

  // String get firstName => _firstName; SAME AS BELOW
  String get firstName {
    return _firstName;
  }

  set firstName(String value) {
    if (value.trim().isEmpty) {
      throw Exception('First Name must not be empty');
    }

    _firstName = value;
  }

  String get lastName {
    return _lastName;
  }

  set lastName(String value) {
    if (value.trim().isEmpty) {
      throw Exception('Last Name must not be empty');
    }

    _lastName = value;
  }

  int get idNumber {
    return _idNumber;
  }

  set idNumber(int value) {
    if (value < 0) {
      throw Exception('Id number must not be negative');
    }

    _idNumber = value;
  }

  @override
  String toString() {
    return '$firstName $_lastName';
  }
}
