import 'package:firebase_core/firebase_core.dart';
import 'services/seed_data.dart';
import 'firebase_options.dart';

void main() async {
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Seed the database
  await SeedData.seedInitialData();

  print('Database seeding complete!');
}