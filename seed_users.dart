import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final auth = FirebaseAuth.instance;
  final db = FirebaseDatabase.instance.ref();

  print('Seeding users...');

  try {
    // Create admin user
    try {
      UserCredential adminCredential = await auth.createUserWithEmailAndPassword(
        email: 'admin@university.edu',
        password: 'admin123',
      );

      await db.child('users').child(adminCredential.user!.uid).set({
        'id': adminCredential.user!.uid,
        'name': 'Admin User',
        'email': 'admin@university.edu',
        'role': 'admin',
        'createdAt': DateTime.now().toIso8601String(),
      });
      print('Admin user created');
    } catch (e) {
      print('Admin user may already exist: $e');
    }

    // Create student user
    try {
      UserCredential studentCredential = await auth.createUserWithEmailAndPassword(
        email: 'john@student.edu',
        password: 'student123',
      );

      await db.child('users').child(studentCredential.user!.uid).set({
        'id': studentCredential.user!.uid,
        'name': 'John Student',
        'email': 'john@student.edu',
        'role': 'student',
        'studentId': 'STU001',
        'department': 'Computer Science',
        'year': 3,
        'createdAt': DateTime.now().toIso8601String(),
        'registeredEvents': [],
        'notAttendingEvents': [],
      });
      print('Student user created');
    } catch (e) {
      print('Student user may already exist: $e');
    }

    // Create another student
    try {
      UserCredential studentCredential = await auth.createUserWithEmailAndPassword(
        email: 'sarah@student.edu',
        password: 'student123',
      );

      await db.child('users').child(studentCredential.user!.uid).set({
        'id': studentCredential.user!.uid,
        'name': 'Sarah Student',
        'email': 'sarah@student.edu',
        'role': 'student',
        'studentId': 'STU002',
        'department': 'Engineering',
        'year': 2,
        'createdAt': DateTime.now().toIso8601String(),
        'registeredEvents': [],
        'notAttendingEvents': [],
      });
      print('Second student user created');
    } catch (e) {
      print('Second student user may already exist: $e');
    }

    print('Seeding complete!');
  } catch (e) {
    print('Error seeding users: $e');
  }
}