🎓 University Event Management System

A Cross-Platform Event Management Application developed using Flutter and Firebase.

The University Event Management System is designed to help students and administrators efficiently manage university events through a centralized digital platform. The system provides real-time event updates, secure authentication, role-based access control, and interactive features such as feedback and event registration.

📌 Project Overview

This project was developed as part of the Interactive Mobile Application Development module. The main objective is to create a cross-platform solution that allows students to:

View university events

Register for events

Provide feedback and ratings

Receive real-time updates

Administrators can:

Add, update, and delete events

View event analytics

Manage user data

Monitor feedback

The system is built using a single Flutter codebase and integrates Firebase services for backend functionality.

🚀 Features
👤 User Features

User Registration & Login

Secure Firebase Authentication

View All Events

Register for Events

Submit Feedback & Star Ratings

Real-Time Event Updates

🛠️ Admin Features

Admin Dashboard

Add / Edit / Delete Events

View Registered Users

Analyze Feedback Data

Monitor System Activity

🏗️ System Architecture
🔹 Frontend

Flutter (Cross-platform: Android & Web)

Responsive UI

Clean Navigation Structure

🔹 Backend

Firebase Authentication

Cloud Firestore Database

Firebase Hosting (Web Deployment)

🔹 External API Integration

JSONPlaceholder (Mock API)

Used for system analysis and dashboard data simulation

📊 Data Models

The system includes three main model classes:

1️⃣ AppUser

Stores user details:

id

name

email

role (admin/student)

2️⃣ Event

Stores event information:

id

title

description

date

location

3️⃣ Feedback

Stores feedback details:

eventId

userId

starRating

comment

Relationship:

One Event ➝ Many Feedback entries (1:M relationship)

All models include:

fromJson() method

toJson() method

🔐 Authentication & Security

Security is implemented using Firebase Authentication:

Passwords are hashed automatically

No plain-text password storage

Secure login validation

Role-based access control

Firestore security rules applied

🧪 Testing

The system was tested using:

Unit Testing

Functional Testing

User Acceptance Testing

Validation Testing

Test scenarios include:

Login validation

Event creation

Registration process

Feedback submission

Admin role verification

📦 Installation Guide
Prerequisites

Flutter SDK installed

Firebase project created

Android Studio / VS Code

Git installed

Steps
# Clone the repository
git clone https://github.com/your-username/university-event-management-system.git

# Navigate into the project folder
cd university-event-management-system

# Get dependencies
flutter pub get

# Run the application
flutter run
🌍 Deployment

Web version deployed using:

Firebase Hosting

To deploy:

flutter build web
firebase deploy
📈 Future Enhancements

Push Notifications

Event Image Upload

QR Code Event Check-In

Advanced Analytics Dashboard

Payment Integration for Paid Events

🎯 Achievements

✔ Cross-platform functionality
✔ Secure authentication system
✔ Real-time database integration
✔ Admin analytics dashboard
✔ Mock API integration
✔ Clean UI/UX design

📚 Technologies Used

Flutter

Dart

Firebase Authentication

Cloud Firestore

Firebase Hosting

JSONPlaceholder API

Git & GitHub

👩‍💻 Author

Ravindi
Software Engineering Undergraduate
Cardiff Metropolitan University (via ICBT Colombo Campus)

📄 License

This project is developed for academic purposes.
