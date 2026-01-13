import 'package:student_exercise/models/student.dart';

void main(List<String> arguments) {
  var student1 = Student(lName: 'Maurer', fName: 'Tom');
  student1.firstName = '   ';

  print(student1);

  var empty = Student.emptyStudent();
}
