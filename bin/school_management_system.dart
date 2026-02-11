import 'dart:async';
import 'dart:io';

// ==================== SHARED FUNCTIONS ====================
Future<List<Student>> loadStudents() async {
  print('Loading students from database...');
  await Future.delayed(Duration(seconds: 2));

  return [
    Student('Emma Johnson', 16),
    Student('Noah Williams', 17),
    Student('Olivia Brown', 15),
    Student('Liam Davis', 16),
    Student('Ava Miller', 17),
  ];
}

// ==================== QUESTION 1 ====================
void welcomeMessage() {
  print('===========================================');
  print('    WELCOME TO OUR SCHOOL SYSTEM');
  print('===========================================');
  print('We are delighted to have you here.');
  print('Our mission is to provide quality education');
  print('and foster a positive learning environment.');
  print('===========================================');
}

void runQuestion1() {
  print('\n' + '=' * 50);
  print('QUESTION 1: Welcome Message Function');
  print('=' * 50);
  welcomeMessage();
}

// ==================== QUESTION 2 ====================
void createStudent({required String name, required int age}) {
  print('\n--- Student Record ---');
  print('Name: $name');
  print('Age: $age');
  print('Student ID: STU-${name.substring(0, 3).toUpperCase()}${age}');
  print('Status: Enrolled');
}

void runQuestion2() {
  print('\n' + '=' * 50);
  print('QUESTION 2: createStudent with Named Parameters');
  print('=' * 50);
  createStudent(name: 'Alice Johnson', age: 16);
  createStudent(age: 14, name: 'Bob Smith');
}

// ==================== QUESTION 3 ====================
void createTeacher(String name, [String? subject]) {
  print('\n--- Teacher Record ---');
  print('Name: $name');
  if (subject != null) {
    print('Subject: $subject');
  } else {
    print('Subject: Subject not assigned');
  }
  print(
    'Teacher ID: TCH-${name.split(' ').map((s) => s[0]).join('').toUpperCase()}',
  );
  print('Status: Active');
}

void runQuestion3() {
  print('\n' + '=' * 50);
  print('QUESTION 3: createTeacher with Optional Parameter');
  print('=' * 50);
  createTeacher('Mr. Davis', 'Mathematics');
  createTeacher('Ms. Rodriguez');
}

// ==================== QUESTION 6 ====================
class Person {
  String name;
  Person(this.name);
  void introduce() {
    print('Hello, my name is $name.');
  }
}

// ==================== QUESTION 19 ====================
mixin NotificationMixin {
  void sendCourseNotification(String studentName, String courseName) {
    print('Notification: $studentName registered for $courseName');
  }
}

// ==================== QUESTION 4,7,9,11,19 ====================
class Student extends Person
    with AttendanceMixin, NotificationMixin
    implements Registrable {
  int age;
  List<String> courses = [];

  Student(String name, this.age) : super(name);

  @override
  void registerCourse(String courseName) {
    courses.add(courseName);
    print('$name registered for: $courseName');
    sendCourseNotification(name, courseName);
  }

  void showInfo() {
    print('\n--- Student Info ---');
    print('Name: $name');
    print('Age: $age');
    print('Courses: ${courses.isNotEmpty ? courses.join(", ") : "None"}');
    print('Attendance: $attendanceCount days');
  }
}

// ==================== QUESTION 4 ====================
void runQuestion4() {
  print('\n' + '=' * 50);
  print('QUESTION 4: Student Class with Constructor');
  print('=' * 50);
  Student student1 = Student('John Smith', 17);
  print('Student created: ${student1.name}, ${student1.age} years old');
}

// ==================== QUESTION 5 ====================
void runQuestion5() {
  print('\n' + '=' * 50);
  print('QUESTION 5: Create and Print Student Object');
  print('=' * 50);
  Student student = Student('Emily Wilson', 16);
  print('Name: ${student.name}');
  print('Age: ${student.age}');
}

// ==================== QUESTION 6 ====================
void runQuestion6() {
  print('\n' + '=' * 50);
  print('QUESTION 6: Person Class with introduce() Method');
  print('=' * 50);
  Person person = Person('Michael Chen');
  person.introduce();
}

// ==================== QUESTION 7 ====================
void runQuestion7() {
  print('\n' + '=' * 50);
  print('QUESTION 7: Inheritance - Student extends Person');
  print('=' * 50);
  Student student = Student('Sarah Johnson', 15);
  student.introduce();
}

// ==================== QUESTION 8 ====================
abstract class Registrable {
  void registerCourse(String courseName);
}

void runQuestion8() {
  print('\n' + '=' * 50);
  print('QUESTION 8: Abstract Class Registrable');
  print('=' * 50);
  print('abstract class Registrable {');
  print('  void registerCourse(String courseName);');
  print('}');
}

// ==================== QUESTION 9 ====================
void runQuestion9() {
  print('\n' + '=' * 50);
  print('QUESTION 9: Student implements Registrable Interface');
  print('=' * 50);

  Student student = Student('David Lee', 17);
  student.registerCourse('Mathematics');
  student.registerCourse('Computer Science');
  print('Registered courses: ${student.courses.join(", ")}');
}

// ==================== QUESTION 10 ====================
mixin AttendanceMixin {
  int _attendanceCount = 0;
  void markAttendance() {
    _attendanceCount++;
    print('Attendance marked. Total: $_attendanceCount');
  }

  int get attendanceCount => _attendanceCount;
}

// Simple test class JUST for Q10
class AttendanceTester with AttendanceMixin {
  String name;
  AttendanceTester(this.name);
}

void runQuestion10() {
  print('\n' + '=' * 50);
  print('QUESTION 10: AttendanceMixin');
  print('=' * 50);

  print('--- Testing AttendanceMixin with temporary test class ---');
  AttendanceTester tester = AttendanceTester('Test');
  tester.markAttendance();
  tester.markAttendance();
  print('Total attendance: ${tester.attendanceCount}');
  print('\n(Note: Using separate test class, not Student yet)');
}

// ==================== QUESTION 11 ====================
void runQuestion11() {
  print('\n' + '=' * 50);
  print('QUESTION 11: Student with AttendanceMixin');
  print('=' * 50);

  Student student = Student('Olivia Brown', 16);
  print('Student: ${student.name}');
  student.markAttendance();
  student.markAttendance();
  student.markAttendance();
  print('${student.name} total attendance: ${student.attendanceCount} days');
} // ==================== QUESTION 12 ====================

void runQuestion12() {
  print('\n' + '=' * 50);
  print('QUESTION 12: List of Student Objects');
  print('=' * 50);
  List<Student> students = [
    Student('Emma Wilson', 15),
    Student('James Miller', 16),
    Student('Sophia Davis', 17),
  ];
  print('Students in list: ${students.length}');
  for (int i = 0; i < students.length; i++) {
    print('${i + 1}. ${students[i].name}, Age: ${students[i].age}');
  }
}

// ==================== QUESTION 13 ====================
void runQuestion13() {
  print('\n' + '=' * 50);
  print('QUESTION 13: Map with Student Objects');
  print('=' * 50);

  Student s1 = Student('Alex Turner', 16);
  Student s2 = Student('Maya Patel', 15);
  Student s3 = Student('Ryan Kim', 17);

  String generateId(String name, int age) {
    return 'STU-${name.substring(0, 3).toUpperCase()}${age}';
  }

  Map<String, Student> studentMap = {
    generateId(s1.name, s1.age): s1,
    generateId(s2.name, s2.age): s2,
    generateId(s3.name, s3.age): s3,
  };

  print('Student Map Entries: ${studentMap.length}');
  studentMap.forEach((id, student) {
    print('$id -> ${student.name}');
  });
}

// ==================== QUESTION 14 ====================
void runQuestion14() {
  print('\n' + '=' * 50);
  print('QUESTION 14: Anonymous Function');
  print('=' * 50);

  List<Student> students = [
    Student('Emma Wilson', 15),
    Student('James Miller', 16),
    Student('Sophia Davis', 17),
  ];

  print('Student names:');
  students.forEach((student) {
    print('  - ${student.name}');
  });
}

// ==================== QUESTION 15 ====================
void greetStudent(String name) => print('Welcome to class, $name!');

void runQuestion15() {
  print('\n' + '=' * 50);
  print('QUESTION 15: Arrow Function');
  print('=' * 50);
  greetStudent('Michael');
  greetStudent('Sarah');
  greetStudent('David');
}

// ==================== QUESTION 16 ====================
Future<void> runQuestion16() async {
  print('\n' + '=' * 50);
  print('QUESTION 16: Async Function loadStudents()');
  print('=' * 50);
  var students = await loadStudents();
  print('First student: ${students.first.name}');
  print('Total loaded: ${students.length} students');
}

// ==================== QUESTION 17 ====================
Future<void> runQuestion17() async {
  print('\n' + '=' * 50);
  print('QUESTION 17: Using await with loadStudents()');
  print('=' * 50);
  List<Student> students = await loadStudents();
  print('Total students loaded: ${students.length}');
  for (var student in students) {
    print('  - ${student.name} (Age: ${student.age})');
  }
}

// ==================== QUESTION 19 ====================
void runQuestion19() {
  print('\n' + '=' * 50);
  print('QUESTION 19: NotificationMixin');
  print('=' * 50);
  Student student = Student('Daniel White', 18);
  student.registerCourse('Advanced Mathematics');
  student.registerCourse('Data Structures');
}

// ==================== MAIN MENU ====================
void displayMenu() {
  print('\n' + '=' * 50);
  print('DART PROGRAMMING LAB - QUESTIONS 1-17 & 19');
  print('=' * 50);
  print('1.  Question 1: Welcome Message');
  print('2.  Question 2: Named Parameters');
  print('3.  Question 3: Optional Parameters');
  print('4.  Question 4: Class & Constructor');
  print('5.  Question 5: Object Creation');
  print('6.  Question 6: Person Class with Method');
  print('7.  Question 7: Inheritance');
  print('8.  Question 8: Abstract Class');
  print('9.  Question 9: Interface Implementation');
  print('10. Question 10: Mixin Creation');
  print('11. Question 11: Using Mixin');
  print('12. Question 12: List of Objects');
  print('13. Question 13: Map of Objects');
  print('14. Question 14: Anonymous Function');
  print('15. Question 15: Arrow Function');
  print('16. Question 16: Async Function');
  print('17. Question 17: Using await');
  print('19. Question 19: NotificationMixin');
  print('21. Run ALL Questions (1-17,19)');
  print('0.  Exit');
  print('=' * 50);
  stdout.write('Enter your choice: ');
}

Future<void> main() async {
  bool running = true;

  while (running) {
    displayMenu();
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        runQuestion1();
        break;
      case '2':
        runQuestion2();
        break;
      case '3':
        runQuestion3();
        break;
      case '4':
        runQuestion4();
        break;
      case '5':
        runQuestion5();
        break;
      case '6':
        runQuestion6();
        break;
      case '7':
        runQuestion7();
        break;
      case '8':
        runQuestion8();
        break;
      case '9':
        runQuestion9();
        break;
      case '10':
        runQuestion10();
        break;
      case '11':
        runQuestion11();
        break;
      case '12':
        runQuestion12();
        break;
      case '13':
        runQuestion13();
        break;
      case '14':
        runQuestion14();
        break;
      case '15':
        runQuestion15();
        break;
      case '16':
        await runQuestion16();
        break;
      case '17':
        await runQuestion17();
        break;
      case '19':
        runQuestion19();
        break;
      case '21':
        runQuestion1();
        runQuestion2();
        runQuestion3();
        runQuestion4();
        runQuestion5();
        runQuestion6();
        runQuestion7();
        runQuestion8();
        runQuestion9();
        runQuestion10();
        runQuestion11();
        runQuestion12();
        runQuestion13();
        runQuestion14();
        runQuestion15();
        await runQuestion16();
        await runQuestion17();
        runQuestion19();
        break;
      case '0':
        print('\nExiting program. Goodbye!');
        running = false;
        break;
      default:
        print('\nInvalid choice. Please try again.');
    }

    if (running && choice != '0' && choice != '21') {
      stdout.write('\nPress Enter to continue...');
      stdin.readLineSync();
    }
  }
}
