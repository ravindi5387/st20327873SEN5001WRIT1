import 'dart:math';
import '../models/app_user.dart';
import '../models/event.dart';
// Remove unused import: import '../models/feedback_model.dart';

class MockAPI {
  // ==================== CONFIGURATION ====================
  static const String apiVersion = '2.5.0';
  static const String apiName = 'University Event Management API';
  static const bool isProduction = false;

  // Simulate network delay
  static Future<T> _simulateDelay<T>(T data, {int minMs = 500, int maxMs = 1500}) async {
    final random = Random();
    final delay = random.nextInt(maxMs - minMs) + minMs;
    await Future.delayed(Duration(milliseconds: delay));
    return data;
  }

  // Helper method to format date without using DateFormat
  static String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  static String _formatMonth(DateTime date) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[date.month - 1];
  }

  // ==================== DATA REPOSITORIES ====================

  // Quotes Database
  static final List<Map<String, dynamic>> _quotesDatabase = [
    {"id": 1, "text": "Education is the most powerful weapon which you can use to change the world.", "author": "Nelson Mandela", "category": "education"},
    {"id": 2, "text": "The beautiful thing about learning is that no one can take it away from you.", "author": "B.B. King", "category": "learning"},
    {"id": 3, "text": "Success is not final, failure is not fatal: it is the courage to continue that counts.", "author": "Winston Churchill", "category": "success"},
    {"id": 4, "text": "The future belongs to those who believe in the beauty of their dreams.", "author": "Eleanor Roosevelt", "category": "dreams"},
    {"id": 5, "text": "Your education is a dress rehearsal for a life that is yours to lead.", "author": "Nora Ephron", "category": "education"},
    {"id": 6, "text": "The expert in anything was once a beginner.", "author": "Helen Hayes", "category": "learning"},
    {"id": 7, "text": "Don't watch the clock; do what it does. Keep going.", "author": "Sam Levenson", "category": "motivation"},
    {"id": 8, "text": "The harder you work for something, the greater you'll feel when you achieve it.", "author": "Unknown", "category": "success"},
    {"id": 9, "text": "Learning is a treasure that will follow its owner everywhere.", "author": "Chinese Proverb", "category": "learning"},
    {"id": 10, "text": "The capacity to learn is a gift; the ability to learn is a skill; the willingness to learn is a choice.", "author": "Brian Herbert", "category": "education"},
  ];

  // Jokes Database
  static final List<Map<String, dynamic>> _jokesDatabase = [
    {"id": 1, "setup": "Why do programmers prefer dark mode?", "punchline": "Because light attracts bugs!", "category": "tech"},
    {"id": 2, "setup": "Why did the student eat his homework?", "punchline": "Because the teacher said it was a piece of cake!", "category": "school"},
    {"id": 3, "setup": "What do you call a fake noodle?", "punchline": "An impasta!", "category": "food"},
    {"id": 4, "setup": "Why was the math book sad?", "punchline": "It had too many problems.", "category": "school"},
    {"id": 5, "setup": "What's the best thing about Switzerland?", "punchline": "I don't know, but the flag is a big plus.", "category": "geography"},
    {"id": 6, "setup": "Why don't scientists trust atoms?", "punchline": "Because they make up everything!", "category": "science"},
    {"id": 7, "setup": "What do you call a bear with no teeth?", "punchline": "A gummy bear!", "category": "animals"},
    {"id": 8, "setup": "Why did the scarecrow win an award?", "punchline": "Because he was outstanding in his field!", "category": "work"},
    {"id": 9, "setup": "What do you call a sleeping bull?", "punchline": "A bulldozer!", "category": "animals"},
    {"id": 10, "setup": "Why don't eggs tell jokes?", "punchline": "They'd crack each other up!", "category": "food"},
  ];

  // University Facts Database
  static final List<Map<String, dynamic>> _universityFactsDatabase = [
    {"id": 1, "fact": "Harvard University, founded in 1636, is the oldest institution of higher education in the United States.", "year": 1636, "country": "USA", "students": 21000},
    {"id": 2, "fact": "The University of Oxford is the oldest university in the English-speaking world, with teaching dating back to 1096.", "year": 1096, "country": "UK", "students": 24000},
    {"id": 3, "fact": "The first computer science department was founded at Purdue University in 1962.", "year": 1962, "country": "USA", "students": 45000},
    {"id": 4, "fact": "MIT's campus has 26 miles of hallways and corridors.", "year": 1861, "country": "USA", "students": 11500},
    {"id": 5, "fact": "Stanford University was founded by Leland Stanford in memory of his son who died of typhoid at age 15.", "year": 1885, "country": "USA", "students": 17000},
    {"id": 6, "fact": "The University of Cambridge has 114 libraries holding approximately 16 million books.", "year": 1209, "country": "UK", "students": 23000},
    {"id": 7, "fact": "Yale University's library has a collection of rare books that includes a Gutenberg Bible.", "year": 1701, "country": "USA", "students": 14000},
    {"id": 8, "fact": "Princeton University was originally founded as the College of New Jersey.", "year": 1746, "country": "USA", "students": 8200},
    {"id": 9, "fact": "Columbia University was the first college in New York City to offer a degree in engineering.", "year": 1754, "country": "USA", "students": 31000},
    {"id": 10, "fact": "The University of Chicago is known for having the most Nobel Prize winners among its alumni and faculty.", "year": 1890, "country": "USA", "students": 17000},
  ];

  // Motivational Messages Database
  static final List<Map<String, dynamic>> _motivationalDatabase = [
    {"id": 1, "message": "Believe you can and you're halfway there.", "author": "Theodore Roosevelt"},
    {"id": 2, "message": "The future belongs to those who prepare for it today.", "author": "Malcolm X"},
    {"id": 3, "message": "Success is not how high you have climbed, but how you make a positive difference to the world.", "author": "Roy Bennett"},
    {"id": 4, "message": "Your limitation—it's only your imagination.", "author": "Unknown"},
    {"id": 5, "message": "Push yourself, because no one else is going to do it for you.", "author": "Unknown"},
    {"id": 6, "message": "Great things never come from comfort zones.", "author": "Unknown"},
    {"id": 7, "message": "Dream it. Wish it. Do it.", "author": "Unknown"},
    {"id": 8, "message": "Success doesn't just find you. You have to go out and get it.", "author": "Unknown"},
    {"id": 9, "message": "The harder you work, the luckier you get.", "author": "Gary Player"},
    {"id": 10, "message": "Don't stop when you're tired. Stop when you're done.", "author": "Unknown"},
  ];

  // Event Tips Database
  static final List<Map<String, dynamic>> _eventTipsDatabase = [
    {"id": 1, "tip": "Arrive at least 10 minutes early to network with other attendees.", "category": "Networking", "importance": "high"},
    {"id": 2, "tip": "Always bring your student ID to university events for quick check-in.", "category": "Preparation", "importance": "high"},
    {"id": 3, "tip": "Take notes during guest lectures - you never know what might be useful later.", "category": "Learning", "importance": "medium"},
    {"id": 4, "tip": "Don't be afraid to ask questions during Q&A sessions.", "category": "Participation", "importance": "high"},
    {"id": 5, "tip": "Follow up with speakers or organizers on LinkedIn after the event.", "category": "Networking", "importance": "medium"},
    {"id": 6, "tip": "Share what you learned with classmates who couldn't attend.", "category": "Sharing", "importance": "low"},
    {"id": 7, "tip": "Check your email regularly for event updates and schedule changes.", "category": "Organization", "importance": "high"},
    {"id": 8, "tip": "Dress appropriately for the event type - professional for career fairs, casual for social events.", "category": "Preparation", "importance": "medium"},
    {"id": 9, "tip": "Bring business cards if you're attending career-related events.", "category": "Career", "importance": "high"},
    {"id": 10, "tip": "Take photos during events for memories and social media posts.", "category": "Social", "importance": "low"},
  ];

  // Study Tips Database
  static final List<Map<String, dynamic>> _studyTipsDatabase = [
    {"id": 1, "tip": "Study in 25-minute intervals with 5-minute breaks (Pomodoro Technique).", "effectiveness": 85, "category": "time management"},
    {"id": 2, "tip": "Review your notes within 24 hours of learning new material.", "effectiveness": 90, "category": "retention"},
    {"id": 3, "tip": "Teach what you've learned to someone else to reinforce understanding.", "effectiveness": 95, "category": "comprehension"},
    {"id": 4, "tip": "Create mind maps to visualize connections between concepts.", "effectiveness": 80, "category": "visualization"},
    {"id": 5, "tip": "Stay hydrated and take short walks to maintain focus.", "effectiveness": 75, "category": "health"},
    {"id": 6, "tip": "Use active recall instead of passive reading.", "effectiveness": 90, "category": "memory"},
    {"id": 7, "tip": "Form study groups to discuss and debate topics.", "effectiveness": 85, "category": "collaboration"},
    {"id": 8, "tip": "Get at least 7-8 hours of sleep before exams.", "effectiveness": 95, "category": "health"},
    {"id": 9, "tip": "Use flashcards for memorizing key terms and concepts.", "effectiveness": 80, "category": "memorization"},
    {"id": 10, "tip": "Practice with past exam papers to understand question patterns.", "effectiveness": 90, "category": "practice"},
  ];

  // Greetings Database
  static final List<Map<String, dynamic>> _greetingsDatabase = [
    {"id": 1, "text": "Hello there! 👋", "language": "English", "formality": "casual"},
    {"id": 2, "text": "Welcome! 🌟", "language": "English", "formality": "friendly"},
    {"id": 3, "text": "Hi, nice to see you! 😊", "language": "English", "formality": "friendly"},
    {"id": 4, "text": "Greetings! ✨", "language": "English", "formality": "formal"},
    {"id": 5, "text": "Hey there! 🎉", "language": "English", "formality": "casual"},
    {"id": 6, "text": "Welcome back! 🙌", "language": "English", "formality": "friendly"},
    {"id": 7, "text": "Good to have you here! 🌈", "language": "English", "formality": "friendly"},
    {"id": 8, "text": "Salutations! 📚", "language": "English", "formality": "formal"},
  ];

  // ==================== API ENDPOINTS ====================

  // 1. QUOTES ENDPOINTS
  static Future<Map<String, dynamic>> getRandomQuote() async {
    final random = Random();
    final quote = _quotesDatabase[random.nextInt(_quotesDatabase.length)];
    return _simulateDelay({
      'success': true,
      'data': quote,
      'endpoint': '/api/quotes/random',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  static Future<Map<String, dynamic>> getQuoteById(int id) async {
    try {
      final quote = _quotesDatabase.firstWhere((q) => q['id'] == id);
      return _simulateDelay({
        'success': true,
        'data': quote,
        'endpoint': '/api/quotes/$id',
        'timestamp': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      return _simulateDelay({
        'success': false,
        'error': 'Quote not found',
        'code': 404,
        'timestamp': DateTime.now().toIso8601String(),
      });
    }
  }

  static Future<Map<String, dynamic>> getQuotesByCategory(String category) async {
    final quotes = _quotesDatabase.where((q) => q['category'] == category).toList();
    return _simulateDelay({
      'success': true,
      'data': quotes,
      'count': quotes.length,
      'category': category,
      'endpoint': '/api/quotes/category/$category',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 2. JOKES ENDPOINTS
  static Future<Map<String, dynamic>> getRandomJoke() async {
    final random = Random();
    final joke = _jokesDatabase[random.nextInt(_jokesDatabase.length)];
    return _simulateDelay({
      'success': true,
      'data': joke,
      'endpoint': '/api/jokes/random',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 3. UNIVERSITY FACTS ENDPOINTS
  static Future<Map<String, dynamic>> getRandomUniversityFact() async {
    final random = Random();
    final fact = _universityFactsDatabase[random.nextInt(_universityFactsDatabase.length)];
    return _simulateDelay({
      'success': true,
      'data': fact,
      'endpoint': '/api/university/facts/random',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 4. MOTIVATIONAL MESSAGES ENDPOINTS
  static Future<Map<String, dynamic>> getRandomMotivationalMessage() async {
    final random = Random();
    final message = _motivationalDatabase[random.nextInt(_motivationalDatabase.length)];
    return _simulateDelay({
      'success': true,
      'data': message,
      'endpoint': '/api/motivation/random',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 5. EVENT TIPS ENDPOINTS
  static Future<Map<String, dynamic>> getRandomEventTip() async {
    final random = Random();
    final tip = _eventTipsDatabase[random.nextInt(_eventTipsDatabase.length)];
    return _simulateDelay({
      'success': true,
      'data': tip,
      'endpoint': '/api/events/tips/random',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 6. STUDY TIPS ENDPOINTS
  static Future<Map<String, dynamic>> getRandomStudyTip() async {
    final random = Random();
    final tip = _studyTipsDatabase[random.nextInt(_studyTipsDatabase.length)];
    return _simulateDelay({
      'success': true,
      'data': tip,
      'endpoint': '/api/study/tips/random',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 7. GREETINGS ENDPOINTS
  static Future<Map<String, dynamic>> getRandomGreeting() async {
    final random = Random();
    final greeting = _greetingsDatabase[random.nextInt(_greetingsDatabase.length)];
    return _simulateDelay({
      'success': true,
      'data': greeting,
      'endpoint': '/api/greetings/random',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 8. EVENT STATISTICS ENDPOINTS
  static Future<Map<String, dynamic>> getEventStatistics() async {
    final total = mockEvents.length;
    final published = mockEvents.where((e) => e.isPublished).length;
    final upcoming = mockEvents.where((e) => e.date.isAfter(DateTime.now())).length;
    final past = mockEvents.where((e) => e.date.isBefore(DateTime.now())).length;

    String mostPopular = 'None';
    int maxRegistrations = 0;
    if (mockEvents.isNotEmpty) {
      for (var event in mockEvents) {
        if (event.registeredCount > maxRegistrations) {
          maxRegistrations = event.registeredCount;
          mostPopular = event.title;
        }
      }
    }

    double averageAttendees = 0;
    if (mockEvents.isNotEmpty) {
      averageAttendees = mockEvents.map((e) => e.registeredCount).reduce((a, b) => a + b) / mockEvents.length;
    }

    // Category distribution
    final Map<String, int> categoryDist = {};
    for (var event in mockEvents) {
      categoryDist[event.category] = (categoryDist[event.category] ?? 0) + 1;
    }

    return _simulateDelay({
      'success': true,
      'data': {
        'total': total,
        'published': published,
        'upcoming': upcoming,
        'past': past,
        'mostPopular': mostPopular,
        'averageAttendees': double.parse(averageAttendees.toStringAsFixed(1)),
        'maxRegistrations': maxRegistrations,
        'categoryDistribution': categoryDist,
        'totalRegistrations': mockEvents.fold(0, (sum, e) => sum + e.registeredCount),
      },
      'endpoint': '/api/statistics/events',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 9. STUDENT STATISTICS ENDPOINTS
  static Future<Map<String, dynamic>> getStudentStatistics() async {
    final allStudents = [...mockUsers.where((u) => u.role == 'student'), ...registeredUsers];
    final totalStudents = allStudents.length;
    final studentsWithEvents = allStudents.where((s) =>
        mockEvents.any((e) => e.registeredStudents.contains(s.id))
    ).length;

    final totalRegistrations = mockEvents.fold(0, (sum, e) => sum + e.registeredCount);

    double averagePerStudent = 0;
    if (totalStudents > 0) {
      averagePerStudent = totalRegistrations / totalStudents;
    }

    // Department distribution
    final Map<String, int> deptDist = {};
    for (var student in allStudents) {
      if (student.department != null) {
        deptDist[student.department!] = (deptDist[student.department!] ?? 0) + 1;
      }
    }

    return _simulateDelay({
      'success': true,
      'data': {
        'total': totalStudents,
        'active': studentsWithEvents,
        'inactive': totalStudents - studentsWithEvents,
        'totalRegistrations': totalRegistrations,
        'averagePerStudent': double.parse(averagePerStudent.toStringAsFixed(1)),
        'departmentDistribution': deptDist,
      },
      'endpoint': '/api/statistics/students',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 10. NEXT EVENT COUNTDOWN - Fixed to not use DateFormat
  static Future<Map<String, dynamic>> getNextEventCountdown() async {
    final now = DateTime.now();
    final futureEvents = mockEvents.where((e) => e.date.isAfter(now) && e.isPublished).toList();

    if (futureEvents.isEmpty) {
      return _simulateDelay({
        'success': true,
        'data': {
          'hasEvent': false,
          'message': 'No upcoming events scheduled',
        },
        'endpoint': '/api/events/next',
        'timestamp': DateTime.now().toIso8601String(),
      });
    }

    futureEvents.sort((a, b) => a.date.compareTo(b.date));
    final nextEvent = futureEvents.first;
    final daysUntil = nextEvent.date.difference(now).inDays;
    final hoursUntil = nextEvent.date.difference(now).inHours % 24;
    final minutesUntil = nextEvent.date.difference(now).inMinutes % 60;

    return _simulateDelay({
      'success': true,
      'data': {
        'hasEvent': true,
        'title': nextEvent.title,
        'days': daysUntil,
        'hours': hoursUntil,
        'minutes': minutesUntil,
        'totalHours': nextEvent.date.difference(now).inHours,
        'totalMinutes': nextEvent.date.difference(now).inMinutes,
        'date': _formatDate(nextEvent.date),
        'time': nextEvent.time,
        'location': nextEvent.location,
        'category': nextEvent.category,
      },
      'endpoint': '/api/events/next',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 11. TODAY'S DATE INFO - Fixed method name (was TodaysDateInfo)
  static Future<Map<String, dynamic>> getTodaysDateInfo() async {
    final now = DateTime.now();
    final weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    final months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

    // Calculate days until weekend
    final daysUntilWeekend = 6 - now.weekday; // Saturday is 6
    final daysUntilMonday = (8 - now.weekday) % 7; // Monday is 1

    return _simulateDelay({
      'success': true,
      'data': {
        'day': weekdays[now.weekday - 1],
        'date': now.day,
        'month': months[now.month - 1],
        'year': now.year,
        'weekOfYear': ((now.difference(DateTime(now.year, 1, 1)).inDays / 7).ceil()),
        'dayOfYear': now.difference(DateTime(now.year, 1, 1)).inDays + 1,
        'isWeekend': now.weekday == 6 || now.weekday == 7,
        'daysUntilWeekend': daysUntilWeekend,
        'daysUntilMonday': daysUntilMonday,
        'timestamp': now.toIso8601String(),
      },
      'endpoint': '/api/date/today',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 12. API STATUS AND INFO
  static Future<Map<String, dynamic>> getAPIStatus() async {
    return _simulateDelay({
      'success': true,
      'data': {
        'name': apiName,
        'version': apiVersion,
        'environment': isProduction ? 'production' : 'development',
        'status': 'online',
        'uptime': '99.9%',
        'totalEndpoints': 12,
        'availableEndpoints': [
          '/api/quotes',
          '/api/jokes',
          '/api/university/facts',
          '/api/motivation',
          '/api/events/tips',
          '/api/study/tips',
          '/api/greetings',
          '/api/statistics',
          '/api/date',
          '/api/status',
        ],
        'lastMaintenance': '2024-01-15T00:00:00Z',
        'nextMaintenance': '2024-02-15T00:00:00Z',
      },
      'endpoint': '/api/status',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 13. RANDOM COMBINATION
  static Future<Map<String, dynamic>> getRandomEverything() async {
    final random = Random();
    return _simulateDelay({
      'success': true,
      'data': {
        'quote': _quotesDatabase[random.nextInt(_quotesDatabase.length)],
        'joke': _jokesDatabase[random.nextInt(_jokesDatabase.length)],
        'fact': _universityFactsDatabase[random.nextInt(_universityFactsDatabase.length)],
        'tip': _eventTipsDatabase[random.nextInt(_eventTipsDatabase.length)],
        'greeting': _greetingsDatabase[random.nextInt(_greetingsDatabase.length)],
      },
      'endpoint': '/api/random/all',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  // 14. WELCOME MESSAGE WITH PERSONALIZATION
  static Future<Map<String, dynamic>> getWelcomeMessage(String name) async {
    final hour = DateTime.now().hour;
    String greeting;
    String icon;

    if (hour < 12) {
      greeting = "Good Morning";
      icon = "🌅";
    } else if (hour < 17) {
      greeting = "Good Afternoon";
      icon = "☀️";
    } else if (hour < 20) {
      greeting = "Good Evening";
      icon = "🌆";
    } else {
      greeting = "Good Night";
      icon = "🌙";
    }

    final messages = [
      "$greeting $name! $icon Ready for today's events?",
      "$greeting $name! $icon Hope you're having a great day!",
      "$greeting $name! $icon Check out the latest events!",
      "Welcome back, $name! $greeting! $icon",
    ];

    final random = Random();
    return _simulateDelay({
      'success': true,
      'data': {
        'message': messages[random.nextInt(messages.length)],
        'greeting': greeting,
        'name': name,
        'hour': hour,
        'icon': icon,
      },
      'endpoint': '/api/welcome',
      'timestamp': DateTime.now().toIso8601String(),
    });
  }
}