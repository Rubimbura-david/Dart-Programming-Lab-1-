import 'dart:async';
import 'dart:io';

// ==================== QUESTION 1 ====================
void welcomeMessage() {
  print('==========================================');
  print('    Welcome to Our School System!');
  print('==========================================');
  print('We are delighted to have you here.');
  print('Our mission is to provide quality education');
  print('and foster a positive learning environment.');
  print('==========================================');
}

void runQuestion1() {
  print('\n' + '=' * 50);
  print('QUESTION 1: Welcome Message Function');
  print('=' * 50);
  print('Demonstrating the welcomeMessage function:\n');
  welcomeMessage();
}

// ==================== QUESTION 2 ====================
void createStudent({required String name, required int age}) {
  print('\n--- Student Record Created ---');
  print('Student Name: $name');
  print('Student Age: $age');
  print('Student ID: STU-${name.substring(0, 3).toUpperCase()}${age}');
  print('Status: ✅ Successfully enrolled');
  print('----------------------------');
}

void runQuestion2() {
  print('\n' + '=' * 50);
  print('QUESTION 2: createStudent Function with Named Parameters');
  print('=' * 50);
  print('Demonstrating named parameters:\n');

  createStudent(name: 'Alice Johnson', age: 16);
  createStudent(age: 14, name: 'Bob Smith');

  print('\nKey Feature: Parameters can be in any order!');
}

// ==================== QUESTION 3 ====================
void createTeacher(String name, [String subject = 'General Education']) {
  print('\n--- Teacher Record Created ---');
  print('Teacher Name: $name');
  print('Subject: $subject');
  print(
    'Teacher ID: TCH-${name.split(' ').map((s) => s[0]).join('').toUpperCase()}',
  );
  print('Status: 🎯 Active');
  print('----------------------------');
}

void runQuestion3() {
  print('\n' + '=' * 50);
  print('QUESTION 3: createTeacher with Required & Optional Parameters');
  print('=' * 50);
  print('Demonstrating required and optional parameters:\n');

  createTeacher('Mr. Davis', 'Mathematics');
  createTeacher('Ms. Rodriguez'); // Uses default subject

  print('\nNote: Subject parameter is optional with default value');
}

// ==================== QUESTION 4 ====================
class Student {
  String name;
  int age;

  // Constructor for Q4
  Student(this.name, this.age);
}

void runQuestion4() {
  print('\n' + '=' * 50);
  print('QUESTION 4: Student Class with Constructor');
  print('=' * 50);

  Student student1 = Student('John Smith', 17);
  print('✓ Student class created with:');
  print('  - Properties: name, age');
  print('  - Constructor: Student(this.name, this.age)');
  print('  - First student: ${student1.name}, ${student1.age} years old');
}

// ==================== QUESTION 5 ====================
void runQuestion5() {
  print('\n' + '=' * 50);
  print('QUESTION 5: Create and Print Student Object');
  print('=' * 50);

  Student student = Student('Emily Wilson', 16);
  print('Student Object Created:');
  print('Name: ${student.name}');
  print('Age: ${student.age}');
  print('Grade Level: ${student.age - 5}');
}

// ==================== QUESTION 6 ====================
class Person {
  String name;

  Person(this.name);

  void introduce() {
    print('Hello, my name is $name.');
  }
}

void runQuestion6() {
  print('\n' + '=' * 50);
  print('QUESTION 6: Person Class with introduce() Method');
  print('=' * 50);

  Person person = Person('Michael Chen');
  person.introduce();
}

// ==================== QUESTION 7 ====================
class StudentV2 extends Person {
  int age;

  StudentV2(String name, this.age) : super(name);

  void displayStudentInfo() {
    introduce(); // Inherited from Person
    print('I am $age years old and a student.');
  }
}

void runQuestion7() {
  print('\n' + '=' * 50);
  print('QUESTION 7: Inheritance - Student extends Person');
  print('=' * 50);

  StudentV2 student = StudentV2('Sarah Johnson', 15);
  print('Calling inherited introduce() method:');
  student.introduce();
  print('\nCalling Student-specific method:');
  student.displayStudentInfo();
}

// ==================== QUESTION 8 ====================
abstract class Registrable {
  void registerCourse(String courseName);
}

void runQuestion8() {
  print('\n' + '=' * 50);
  print('QUESTION 8: Abstract Class Registrable');
  print('=' * 50);

  print('✓ Abstract class Registrable created');
  print('  - Contains abstract method: registerCourse()');
  print('  - Cannot be instantiated directly');
  print('  - Must be implemented by concrete classes');
}

// ==================== QUESTION 9 ====================
class StudentV3 extends Person implements Registrable {
  int age;
  List<String> courses = [];

  StudentV3(String name, this.age) : super(name);

  @override
  void registerCourse(String courseName) {
    courses.add(courseName);
    print('$name has registered for: $courseName');
  }
}

void runQuestion9() {
  print('\n' + '=' * 50);
  print('QUESTION 9: Student implements Registrable Interface');
  print('=' * 50);

  StudentV3 student = StudentV3('David Lee', 17);
  print('Registering courses:');
  student.registerCourse('Mathematics');
  student.registerCourse('Computer Science');
  student.registerCourse('Physics');
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

void runQuestion10() {
  print('\n' + '=' * 50);
  print('QUESTION 10: AttendanceMixin');
  print('=' * 50);

  print('✓ Mixin created: AttendanceMixin');
  print('  - Private variable: _attendanceCount');
  print('  - Method: markAttendance()');
  print('  - Getter: attendanceCount');
  print('  - Can be added to multiple classes');
}

// ==================== QUESTION 11 ====================
class StudentV4 extends Person with AttendanceMixin implements Registrable {
  int age;
  List<String> courses = [];

  StudentV4(String name, this.age) : super(name);

  @override
  void registerCourse(String courseName) {
    courses.add(courseName);
    print('$name registered for: $courseName');
  }

  void showInfo() {
    introduce();
    print('Age: $age');
    print('Courses: ${courses.join(", ")}');
    print('Attendance: $attendanceCount days');
  }
}

void runQuestion11() {
  print('\n' + '=' * 50);
  print('QUESTION 11: Student with AttendanceMixin');
  print('=' * 50);

  StudentV4 student = StudentV4('Olivia Brown', 16);

  print('Marking attendance 3 times:');
  for (int i = 0; i < 3; i++) {
    student.markAttendance();
  }

  print('\nFinal attendance count: ${student.attendanceCount}');
}

// ==================== QUESTION 12 ====================
void runQuestion12() {
  print('\n' + '=' * 50);
  print('QUESTION 12: List of Student Objects');
  print('=' * 50);

  List<Student> students = [
    Student('Emma Wilson', 15),
    Student('James Miller', 16),
    Student('Sophia Davis', 17),
  ];

  print('Created list with ${students.length} students:');
  for (int i = 0; i < students.length; i++) {
    print('${i + 1}. ${students[i].name}, Age: ${students[i].age}');
  }
}

// ==================== QUESTION 13 ====================
void runQuestion13() {
  print('\n' + '=' * 50);
  print('QUESTION 13: Map with Student Objects');
  print('=' * 50);

  Map<String, Student> studentMap = {
    'S001': Student('Alex Turner', 16),
    'S002': Student('Maya Patel', 15),
    'S003': Student('Ryan Kim', 17),
    'S004': Student('Lily Chen', 16),
  };

  print('Student Map (ID → Student):');
  print('Total students: ${studentMap.length}');
  print('\nStudent Names:');

  studentMap.forEach((id, student) {
    print('  $id: ${student.name}');
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

  print('Printing names using anonymous function:');

  // Anonymous function
  students.forEach((student) {
    print('  - ${student.name}');
  });

  // Another example with map
  print('\nTransforming list with anonymous function:');
  List<String> names = students
      .map((student) => student.name.toUpperCase())
      .toList();
  print('Uppercase names: $names');
}

// ==================== QUESTION 15 ====================
// Arrow function
void greetStudent(String name) => print('🎓 Welcome to class, $name!');

void runQuestion15() {
  print('\n' + '=' * 50);
  print('QUESTION 15: Arrow Function');
  print('=' * 50);

  print('Using arrow function to greet students:');
  greetStudent('Michael');
  greetStudent('Sarah');
  greetStudent('David');
}

// ==================== QUESTION 16 ====================
// Async function - CHANGED: Now returns Future<void>
Future<void> runQuestion16() async {
  print('\n' + '=' * 50);
  print('QUESTION 16: Async Function loadStudents()');
  print('=' * 50);

  print('Starting to load students...');

  // Define the async function here
  Future<List<Student>> loadStudents() async {
    print('Loading students...');
    await Future.delayed(Duration(seconds: 2));

    return [
      Student('Emma Johnson', 16),
      Student('Noah Williams', 17),
      Student('Olivia Brown', 15),
      Student('Liam Davis', 16),
      Student('Ava Miller', 17),
    ];
  }

  var students = await loadStudents();
  print('✓ Students loaded successfully!');
  print('Sample student: ${students.first.name}');
}

// ==================== QUESTION 17 ====================
// Async function - CHANGED: Now returns Future<void>
Future<void> runQuestion17() async {
  print('\n' + '=' * 50);
  print('QUESTION 17: Using await with loadStudents()');
  print('=' * 50);

  print('Loading students with await...');

  // Define the async function here
  Future<List<Student>> loadStudents() async {
    print('Loading students...');
    await Future.delayed(Duration(seconds: 2));

    return [
      Student('Emma Johnson', 16),
      Student('Noah Williams', 17),
      Student('Olivia Brown', 15),
      Student('Liam Davis', 16),
      Student('Ava Miller', 17),
    ];
  }

  List<Student> students = await loadStudents();
  print('Total students loaded: ${students.length}');

  print('\nStudent Roster:');
  for (var student in students) {
    print('  • ${student.name} (Age: ${student.age})');
  }
}

// ==================== QUESTION 18 ====================
void runQuestion18() {
  print('\n' + '=' * 50);
  print('QUESTION 18: Mixins vs Inheritance Explanation');
  print('=' * 50);

  print('WHY MIXINS ARE USEFUL:');
  print('1. Code Reuse: Share functionality across unrelated classes');
  print('2. Avoid Diamond Problem: No issues with multiple inheritance');
  print('3. Flexibility: Add behaviors without creating deep hierarchies');
  print('4. Composition over Inheritance: Combine behaviors as needed');

  print('\nDIFFERENCES:');
  print('───────────────────────────────────────');
  print('| INHERITANCE         | MIXINS        |');
  print('|─────────────────────|───────────────|');
  print('| "is-a" relationship | "has-a" trait |');
  print('| Single parent       | Multiple mixins|');
  print('| Deep hierarchy      | Flat structure|');
  print('| Tight coupling      | Loose coupling|');
  print('───────────────────────────────────────');

  print('\nEXAMPLE:');
  print('• Inheritance: Student IS-A Person');
  print('• Mixin: Student HAS Attendance tracking');
}

// ==================== QUESTION 19 ====================
mixin NotificationMixin {
  void sendCourseNotification(String studentName, String courseName) {
    print('📧 Notification sent to $studentName:');
    print('   "You have been registered for $courseName"');
  }
}

class StudentV5 extends Person
    with AttendanceMixin, NotificationMixin
    implements Registrable {
  int age;
  List<String> courses = [];

  StudentV5(String name, this.age) : super(name);

  @override
  void registerCourse(String courseName) {
    courses.add(courseName);
    sendCourseNotification(name, courseName);
  }
}

void runQuestion19() {
  print('\n' + '=' * 50);
  print('QUESTION 19: NotificationMixin');
  print('=' * 50);

  StudentV5 student = StudentV5('Daniel White', 18);

  print('Registering courses with notifications:');
  student.registerCourse('Advanced Mathematics');
  student.registerCourse('Data Structures');

  print('\nStudent now has 2 mixins:');
  print('1. AttendanceMixin');
  print('2. NotificationMixin');
}

// ==================== QUESTION 20 ====================
void runQuestion20() {
  print('\n' + '=' * 50);
  print('QUESTION 20: Dart & Flutter Connection');
  print('=' * 50);

  print('HOW LEARNING DART HELPS UNDERSTAND FLUTTER:\n');

  print(
    '''Dart is the foundation of Flutter development. By learning Dart, we gain:

1. WIDGET UNDERSTANDING: 
   • Flutter widgets are Dart classes
   • State management uses Dart's reactive programming

2. ASYNC OPERATIONS:
   • Flutter apps heavily use async/await for API calls
   • Future and Stream are core Dart concepts

3. OBJECT-ORIENTED STRUCTURE:
   • Flutter's widget tree is built using Dart OOP
   • Inheritance and mixins create reusable UI components

4. TYPE SAFETY:
   • Dart's strong typing prevents runtime errors in Flutter
   • Null safety ensures robust mobile applications

5. HOT RELOAD:
   • Dart's JIT compiler enables Flutter's fast development cycle
   • Quick iteration is possible because of Dart's architecture

Learning Dart first makes Flutter development intuitive because every Flutter app is essentially a well-structured Dart program with a UI layer.''',
  );
}

// ==================== MAIN MENU SYSTEM ====================
void displayMainMenu() {
  print('\n' + '=' * 70);
  print('DART PROGRAMMING LABORATORY ASSIGNMENT - ALL QUESTIONS (1-20)');
  print('=' * 70);

  print('\nSELECT QUESTION TO RUN:');
  print('┌─────────────────────────────────────────────────┐');
  for (int i = 1; i <= 20; i++) {
    String description = '';
    if (i == 1)
      description = 'Welcome Message';
    else if (i == 2)
      description = 'Named Parameters';
    else if (i == 3)
      description = 'Optional Parameters';
    else if (i == 4)
      description = 'Class & Constructor';
    else if (i == 5)
      description = 'Object Creation';
    else if (i == 6)
      description = 'Class with Method';
    else if (i == 7)
      description = 'Inheritance';
    else if (i == 8)
      description = 'Abstract Class';
    else if (i == 9)
      description = 'Interface Implementation';
    else if (i == 10)
      description = 'Mixin Creation';
    else if (i == 11)
      description = 'Using Mixin';
    else if (i == 12)
      description = 'List of Objects';
    else if (i == 13)
      description = 'Map of Objects';
    else if (i == 14)
      description = 'Anonymous Function';
    else if (i == 15)
      description = 'Arrow Function';
    else if (i == 16)
      description = 'Async Function';
    else if (i == 17)
      description = 'Using await';
    else if (i == 18)
      description = 'Mixins vs Inheritance';
    else if (i == 19)
      description = 'Another Mixin';
    else if (i == 20)
      description = 'Dart & Flutter';

    print(
      '│ ${i.toString().padLeft(2)}. Question $i: ${description.padRight(25)}│',
    );
  }
  print('├─────────────────────────────────────────────────┤');
  print('│ A.  Run ALL Questions (1-20)                    │');
  print('│ G.  Run Group 1-5 (Basics)                      │');
  print('│ M.  Run Group 6-10 (OOP)                        │');
  print('│ D.  Run Group 11-15 (Collections & Functions)   │');
  print('│ F.  Run Group 16-20 (Advanced Topics)           │');
  print('│ X.  Exit Program                                │');
  print('└─────────────────────────────────────────────────┘');
}

void main() async {
  bool continueRunning = true;

  print('\n🎓 DART LABORATORY ASSIGNMENT 🎓');
  print('Group Members: [Your Name] & [Partner\'s Name]');
  print('Date: ${DateTime.now().toLocal()}');

  while (continueRunning) {
    displayMainMenu();

    stdout.write('\nEnter your choice (1-20, A, G, M, D, F, X): ');
    String? choice = stdin.readLineSync()?.toUpperCase();

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
      case '18':
        runQuestion18();
        break;
      case '19':
        runQuestion19();
        break;
      case '20':
        runQuestion20();
        break;
      case 'A':
        await runAllQuestions();
        break;
      case 'G':
        await runGroup([1, 2, 3, 4, 5]);
        break;
      case 'M':
        await runGroup([6, 7, 8, 9, 10]);
        break;
      case 'D':
        await runGroup([11, 12, 13, 14, 15]);
        break;
      case 'F':
        await runGroup([16, 17, 18, 19, 20]);
        break;
      case 'X':
        print('\nThank you for using the Dart Laboratory Program!');
        print('Goodbye! 👋\n');
        continueRunning = false;
        break;
      default:
        print('\n❌ Invalid choice. Please select a valid option.\n');
    }

    if (continueRunning && choice != 'X') {
      stdout.write('\nPress Enter to continue...');
      stdin.readLineSync();
    }
  }
}

Future<void> runAllQuestions() async {
  print('\n' + '=' * 60);
  print('RUNNING ALL 20 QUESTIONS');
  print('=' * 60);

  // Run sync questions
  runQuestion1();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion2();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion3();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion4();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion5();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion6();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion7();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion8();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion9();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion10();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion11();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion12();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion13();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion14();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion15();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion18();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion19();
  await Future.delayed(Duration(milliseconds: 300));
  runQuestion20();
  await Future.delayed(Duration(milliseconds: 300));

  // Run async questions
  await runQuestion16();
  await runQuestion17();

  print('\n' + '=' * 60);
  print('✓ ALL 20 QUESTIONS COMPLETED SUCCESSFULLY!');
  print('=' * 60);
}

Future<void> runGroup(List<int> questions) async {
  print('\n' + '=' * 50);
  print('RUNNING QUESTIONS: ${questions.join(", ")}');
  print('=' * 50);

  for (int q in questions) {
    switch (q) {
      case 1:
        runQuestion1();
        break;
      case 2:
        runQuestion2();
        break;
      case 3:
        runQuestion3();
        break;
      case 4:
        runQuestion4();
        break;
      case 5:
        runQuestion5();
        break;
      case 6:
        runQuestion6();
        break;
      case 7:
        runQuestion7();
        break;
      case 8:
        runQuestion8();
        break;
      case 9:
        runQuestion9();
        break;
      case 10:
        runQuestion10();
        break;
      case 11:
        runQuestion11();
        break;
      case 12:
        runQuestion12();
        break;
      case 13:
        runQuestion13();
        break;
      case 14:
        runQuestion14();
        break;
      case 15:
        runQuestion15();
        break;
      case 16:
        await runQuestion16();
        break;
      case 17:
        await runQuestion17();
        break;
      case 18:
        runQuestion18();
        break;
      case 19:
        runQuestion19();
        break;
      case 20:
        runQuestion20();
        break;
    }
    await Future.delayed(Duration(milliseconds: 300));
  }
}
