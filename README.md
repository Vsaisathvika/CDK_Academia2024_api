# Flutter CRUD with JSONPlaceholder API

## Description

A Flutter application that performs complete CRUD (Create, Read, Update, Delete) operations using the [JSONPlaceholder API](https://jsonplaceholder.typicode.com/users).  
It allows users to:
- View a list of users
- Add a new user
- Edit existing user details
- Delete a user with confirmation
This is a beginner-friendly project ideal for understanding API integration, local state, and UI component breakdown in Flutter.
The app uses **local state management** (`setState`) and displays user data in a clean, intuitive UI.

---

## Getting Started / Installation

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (Recommended: 3.10.0 or higher)
- Dart SDK
- Any code editor (like VS Code or Android Studio)
- An emulator or a physical device for testing

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/flutter-crud-users.git
   cd flutter-crud-users

2. Install dependencies
flutter pub get

3. Make sure http package is added in pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.5

4. Run the app
flutter run

## Tech Stack

- Flutter	- Mobile UI framework used for building cross-platform apps
- Dart	- Programming language used in Flutter
- HTTP	- For making API requests to JSONPlaceholder
- Stateful Widgets	- To manage UI updates using setState()
- JSONPlaceholder	- A fake online REST API for testing and prototyping



##  Key Features / Use Cases

-  **Fetch & Display Users**  
  Retrieves user data from the JSONPlaceholder API and displays it in a scrollable list.

-  **Add New User**  
  Users can add new entries using a form. Newly created users appear at the top of the list.

-  **Edit User Details**  
  Users can tap the edit icon (pencil) to update existing user details with a pre-filled form.

-  **Delete User with Confirmation**  
  Each user has a delete icon. On clicking it, a confirmation dialog appears to prevent accidental deletion.

-  **Local State Management**  
  All updates (add/edit/delete) are handled using Flutter’s built-in `setState` for simplicity and clarity.

-  **Form Validation**  
  Both email and name fields are validated before submission for better user input quality.

-  **Responsive UI**  
  UI is simple, minimal and works well across devices.

-  **Componentized Architecture**  
  Code is broken down into components: user list, user edit, user create, and service layer for scalability.
