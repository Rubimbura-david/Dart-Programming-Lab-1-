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
void createTeacher(String name, [String? subject]) {
  print('\n--- Teacher Record Created ---');
  print('Teacher Name: $name');
  print('Subject: ${subject ?? 'Subject not assigned'}');
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
  createTeacher('Ms. Rodriguez'); // Shows 'Subject not assigned'

  print(
    '\nNote: When subject is not provided, it prints "Subject not assigned"',
  );
}

// ==================== QUESTION 6 ====================
class Person {
  String name;

  Person(this.name);

  void introduce() {
    print('Hello, my name is $name.');
  }
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

// ==================== QUESTION 8 ====================
abstract class Registrable {
  void registerCourse(String courseName);
}

// ==================== QUESTION 19 ====================
mixin NotificationMixin {
  void sendCourseNotification(String studentName, String courseName) {
    print('📧 Notification sent to $studentName:');
    print('   "You have been registered for $courseName"');
  }
}

// ==================== QUESTION 4 ====================
// Main Student class that incorporates all features
class Student extends Person
    with AttendanceMixin, NotificationMixin
    implements Registrable {
  int age;
  List<String> courses = [];

  // Constructor for Q4
  Student(String name, this.age) : super(name);

  // Method for Q9
  @override
  void registerCourse(String courseName) {
    courses.add(courseName);
    print('$name has registered for: $courseName');
    sendCourseNotification(name, courseName); // From NotificationMixin
  }

  // Additional method to show all info
  void showInfo() {
    introduce();
    print('Age: $age');
    print('Courses: ${courses.isNotEmpty ? courses.join(", ") : "None"}');
    print('Attendance: $attendanceCount days');
  }
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
  print('Calling inherited introduce() method from Student object:');
  student.introduce();

  print('\nCalling Student-specific method:');
  student.showInfo();
}

// ==================== QUESTION 8 ====================
void runQuestion8() {
  print('\n' + '=' * 50);
  print('QUESTION 8: Abstract Class Registrable');
  print('=' * 50);

  print('✓ Abstract class Registrable created');
  print('  - Contains abstract method: registerCourse()');
  print('  - Cannot be instantiated directly');
  print('  - Must be implemented by concrete classes');
  print('  - Acts as an interface contract');
}

// ==================== QUESTION 9 ====================
void runQuestion9() {
  print('\n' + '=' * 50);
  print('QUESTION 9: Student implements Registrable Interface');
  print('=' * 50);

  Student student = Student('David Lee', 17);
  print('Registering courses (implements Registrable interface):');
  student.registerCourse('Mathematics');
  student.registerCourse('Computer Science');
  student.registerCourse('Physics');

  print('\nCurrent courses: ${student.courses.join(", ")}');
}

// ==================== QUESTION 10 ====================
void runQuestion10() {
  print('\n' + '=' * 50);
  print('QUESTION 10: AttendanceMixin');
  print('=' * 50);

  print('✓ Mixin created: AttendanceMixin');
  print('  - Private variable: _attendanceCount');
  print('  - Method: markAttendance()');
  print('  - Getter: attendanceCount');
  print('  - Can be added to multiple classes using "with" keyword');
  print('  - Provides reusable attendance tracking behavior');
}

// ==================== QUESTION 11 ====================
void runQuestion11() {
  print('\n' + '=' * 50);
  print('QUESTION 11: Student with AttendanceMixin');
  print('=' * 50);

  Student student = Student('Olivia Brown', 16);

  print('Marking attendance 3 times (using AttendanceMixin):');
  for (int i = 0; i < 3; i++) {
    student.markAttendance();
  }

  print('\nFinal attendance count: ${student.attendanceCount}');
  print('Mixins allow adding behavior without inheritance hierarchy!');
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

  print('\nList characteristics:');
  print('  - Ordered collection (maintains insertion order)');
  print('  - Allows duplicate elements');
  print('  - Access elements by index (0-based)');
  print('  - Perfect for storing multiple similar objects');
}

// ==================== QUESTION 13 ====================
void runQuestion13() {
  print('\n' + '=' * 50);
  print('QUESTION 13: Map with Student Objects (ID as Key)');
  print('=' * 50);

  // Create students first
  Student s1 = Student('Alex Turner', 16);
  Student s2 = Student('Maya Patel', 15);
  Student s3 = Student('Ryan Kim', 17);
  Student s4 = Student('Lily Chen', 16);

  // Generate student IDs using the same logic as createStudent function
  String generateStudentId(String name, int age) {
    return 'STU-${name.substring(0, 3).toUpperCase()}${age}';
  }

  // Create map with student ID as key and Student object as value
  Map<String, Student> studentMap = {
    generateStudentId(s1.name, s1.age): s1,
    generateStudentId(s2.name, s2.age): s2,
    generateStudentId(s3.name, s3.age): s3,
    generateStudentId(s4.name, s4.age): s4,
  };

  print('Student Map (Student ID → Student Object):');
  print('Total students in map: ${studentMap.length}');

  print('\nAll Student Names (accessed via map):');
  studentMap.forEach((id, student) {
    print('  • ID: $id → Name: ${student.name} (Age: ${student.age})');
  });

  print('\nMap characteristics:');
  print('  - Key-value pairs (Student ID → Student Object)');
  print('  - Keys must be unique (student IDs are unique)');
  print('  - Fast lookup by key (O(1) access time)');
  print('  - Perfect for database-like lookups');
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

  print('Printing names using anonymous function with forEach:');

  // Anonymous function (no name, defined inline)
  students.forEach((student) {
    print('  - ${student.name}');
  });

  print('\nTransforming list with anonymous function using map:');
  List<String> names = students
      .map((student) => student.name.toUpperCase())
      .toList();
  print('Uppercase names: $names');

  print('\nAnonymous function characteristics:');
  print('  - No name (defined inline where used)');
  print('  - Can capture variables from surrounding scope');
  print('  - Often used as callbacks or for simple operations');
  print('  - Makes code more concise for one-time use functions');
}

// ==================== QUESTION 15 ====================
// Arrow function (single expression function)
void greetStudent(String name) => print('🎓 Welcome to class, $name!');

void runQuestion15() {
  print('\n' + '=' * 50);
  print('QUESTION 15: Arrow Function');
  print('=' * 50);

  print('Using arrow function to greet students:');
  greetStudent('Michael');
  greetStudent('Sarah');
  greetStudent('David');

  print('\nArrow function characteristics:');
  print('  - Uses => syntax for single expression functions');
  print('  - No braces or return statement needed');
  print('  - Automatically returns the expression value');
  print('  - More concise than traditional function syntax');
  print('  - Ideal for simple one-liner functions');
}

// ==================== QUESTION 16 ====================
Future<void> runQuestion16() async {
  print('\n' + '=' * 50);
  print('QUESTION 16: Async Function loadStudents()');
  print('=' * 50);

  print('Starting to load students (simulating network request)...');

  // Using the shared loadStudents() function
  var students = await loadStudents();
  print('✓ Students loaded successfully!');
  print('First student: ${students.first.name}');
  print('Total loaded: ${students.length} students');

  print('\nAsync function characteristics:');
  print('  - Returns Future<T> (promise of future value)');
  print('  - Uses async keyword in declaration');
  print('  - Can use await to wait for Future completion');
  print('  - Non-blocking (allows other code to run while waiting)');
  print('  - Essential for I/O operations (network, files, databases)');
}

// ==================== QUESTION 17 ====================
Future<void> runQuestion17() async {
  print('\n' + '=' * 50);
  print('QUESTION 17: Using await with loadStudents()');
  print('=' * 50);

  print('Calling loadStudents() with await in main-like context...');

  // Using the shared loadStudents() function
  List<Student> students = await loadStudents();
  print('Total students loaded: ${students.length}');

  print('\nStudent Roster:');
  for (var student in students) {
    print('  • ${student.name} (Age: ${student.age})');
  }

  print('\nUsing await:');
  print('  - await pauses execution until Future completes');
  print('  - Makes async code look like synchronous code');
  print('  - Must be used inside async function');
  print('  - Error handling with try-catch blocks');
  print('  - Essential for sequential async operations');
}

// ==================== QUESTION 18 ====================
void runQuestion18() {
  print('\n' + '=' * 50);
  print('QUESTION 18: Mixins vs Inheritance Explanation');
  print('=' * 50);

  print('WHY MIXINS ARE USEFUL:');
  print(
    '1. Code Reuse Across Hierarchies: Share functionality between unrelated classes',
  );
  print(
    '2. Avoid Diamond Problem: No ambiguity when same method exists in multiple parents',
  );
  print(
    '3. Flexible Composition: Add behaviors like building blocks, not rigid hierarchies',
  );
  print(
    '4. Single Responsibility: Keep classes focused, mixins handle cross-cutting concerns',
  );
  print('5. Testability: Mixins can be tested independently');

  print('\nDIFFERENCES BETWEEN INHERITANCE AND MIXINS:');
  print('┌─────────────────────────────────────────────────┐');
  print('│     INHERITANCE                MIXINS           │');
  print('├─────────────────────────────────────────────────┤');
  print('│ "is-a" relationship         "has-a" capability  │');
  print('│ Single parent only          Multiple mixins     │');
  print('│ Deep class hierarchy        Flat composition    │');
  print('│ Tight coupling              Loose coupling      │');
  print('│ Compile-time resolution     Linearized order    │');
  print('│ Hard to change later        Easy to add/remove  │');
  print('└─────────────────────────────────────────────────┘');

  print('\nPRACTICAL EXAMPLE IN OUR CODE:');
  print('• Inheritance: Student IS-A Person (gets basic identity)');
  print('• Mixin 1: Student HAS Attendance tracking capability');
  print('• Mixin 2: Student HAS Notification capability');
  print('• Result: Flexible, reusable behaviors without complex hierarchy');
}

// ==================== QUESTION 19 ====================
void runQuestion19() {
  print('\n' + '=' * 50);
  print('QUESTION 19: NotificationMixin');
  print('=' * 50);

  Student student = Student('Daniel White', 18);

  print('Registering courses with automatic notifications:');
  student.registerCourse('Advanced Mathematics');
  student.registerCourse('Data Structures');

  print('\nDemonstrating all capabilities of the enhanced Student:');
  print('1. Inherited from Person:');
  student.introduce();

  print('\n2. Using AttendanceMixin:');
  student.markAttendance();
  student.markAttendance();
  print('   Total attendance: ${student.attendanceCount}');

  print('\n3. Using NotificationMixin:');
  print('   (Already demonstrated during course registration)');

  print('\n4. Implementing Registrable interface:');
  print('   Course registration method is required by interface');

  print('\nStudent now combines:');
  print('  • Inheritance (Person)');
  print('  • 2 Mixins (Attendance, Notification)');
  print('  • 1 Interface (Registrable)');
  print('  • All working together seamlessly!');
}

// ==================== MAIN MENU SYSTEM ====================
void displayMainMenu() {
  print('\n' + '=' * 70);
  print('DART PROGRAMMING LABORATORY ASSIGNMENT - QUESTIONS 1-19');
  print('=' * 70);

  print('\nSELECT QUESTION TO RUN:');
  print('┌─────────────────────────────────────────────────┐');
  print('│  1. Question 1: Welcome Message                 │');
  print('│  2. Question 2: Named Parameters                │');
  print('│  3. Question 3: Optional Parameters             │');
  print('│  4. Question 4: Class & Constructor             │');
  print('│  5. Question 5: Object Creation                 │');
  print('│  6. Question 6: Class with Method               │');
  print('│  7. Question 7: Inheritance                     │');
  print('│  8. Question 8: Abstract Class                  │');
  print('│  9. Question 9: Interface Implementation        │');
  print('│ 10. Question 10: Mixin Creation                 │');
  print('│ 11. Question 11: Using Mixin                    │');
  print('│ 12. Question 12: List of Objects                │');
  print('│ 13. Question 13: Map of Objects                 │');
  print('│ 14. Question 14: Anonymous Function             │');
  print('│ 15. Question 15: Arrow Function                 │');
  print('│ 16. Question 16: Async Function                 │');
  print('│ 17. Question 17: Using await                    │');
  print('│ 18. Question 18: Mixins vs Inheritance          │');
  print('│ 19. Question 19: Another Mixin                  │');
  print('├─────────────────────────────────────────────────┤');
  print('│ A.  Run ALL Questions (1-19)                    │');
  print('│ G.  Run Group 1-5 (Basics)                      │');
  print('│ M.  Run Group 6-10 (OOP)                        │');
  print('│ D.  Run Group 11-15 (Collections & Functions)   │');
  print('│ F.  Run Group 16-19 (Advanced Topics)           │');
  print('│ X.  Exit Program                                │');
  print('└─────────────────────────────────────────────────┘');
}

Future<void> runAllQuestions() async {
  print('\n' + '=' * 60);
  print('RUNNING ALL 19 QUESTIONS');
  print('=' * 60);

  // Run in logical order
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

  // Run async questions at the end
  await runQuestion16();
  await runQuestion17();

  print('\n' + '=' * 60);
  print('✓ ALL 19 QUESTIONS COMPLETED SUCCESSFULLY!');
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
    }
    await Future.delayed(Duration(milliseconds: 300));
  }
}

void main() async {
  bool continueRunning = true;

  print('\n🎓 DART LABORATORY ASSIGNMENT - QUESTIONS 1-19 🎓');
  print('Group Members: [Your Name] & [Partner\'s Name]');
  print('Date: ${DateTime.now().toLocal()}');

  while (continueRunning) {
    displayMainMenu();

    stdout.write('\nEnter your choice (1-19, A, G, M, D, F, X): ');
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
        await runGroup([16, 17, 18, 19]);
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
