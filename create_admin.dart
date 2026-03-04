import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

void main() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final auth = FirebaseAuth.instance;
    final db = FirebaseDatabase.instance.ref();

    // Create admin user
    try {
      await auth.createUserWithEmailAndPassword(
        email: 'admin@university.edu',
        password: 'admin123',
      );
    } catch (e) {
      // Admin might already exist, try to sign in
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: 'admin@university.edu',
          password: 'admin123',
        );

        // Check if data exists in database
        final snapshot = await db.child('users').child(userCredential.user!.uid).get();
        if (!snapshot.exists) {
          await db.child('users').child(userCredential.user!.uid).set({
            'id': userCredential.user!.uid,
            'name': 'Admin User',
            'email': 'admin@university.edu',
            'role': 'admin',
            'createdAt': DateTime.now().toIso8601String(),
          });
        }
      } catch (signInError) {
        // Handle error silently
      }
    }

  } catch (e) {
    // Handle error silently
  }
}