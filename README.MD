# Swifty Companion

## Description
Swifty Companion is a mobile project at 42 that introduces students to mobile development and API integration. The app allows users to search for any 42 student via their login and retrieve their profile information, including their level, skills, and project results.

## Features
- **OAuth2 Authentication**: Securely connects to the 42 API.
- **User Search**: Fetch real-time data for any student in the network.
- **Profile Visualization**: Displays profile picture, contact details, and "Intra" stats (Wallet/Correction points).
- **Academic Tracking**: View a detailed list of skills and projects (status and grades).
- **Responsive Design**: UI adapts to various screen sizes.

## Technical Stack (Example: Flutter/Swift)
- **Language**: [e.g., Dart / Swift]
- **Framework**: [e.g., Flutter / SwiftUI]
- **API**: 42 API v2 (REST)
- **Auth**: OAuth2 Client Credentials Flow

## Setup
1. Clone the repository.
2. Register an application on the [42 Intra](https://profile.intra.42.fr/oauth/applications).
3. Create a `.env` file in the root directory:
   ```env
   UID=your_uid_here
   SECRET=your_secret_here
4. Run the app:

# Example for Flutter
```flutter run```

## Error Handling

- Handles "User Not Found" errors.

- Handles connectivity issues.

- Token auto-refresh logic (Bonus implemented).


### Pro-Tips for a Junior Dev at 42:
1.  **Parsing JSON:** The 42 API returns a *huge* JSON object for a user. Don't try to map every single field. Only create data models for the fields you actually need (login, email, projects, skills).
2.  **Image Loading:** Mobile apps can crash if you try to load a high-res image on a slow thread. Always use a dedicated component for "Asynchronous Images" so the UI doesn't freeze while downloading the profile picture.
3.  **The "Level" Calculation:** Remember that in the JSON, the level is a float (e.g., `12.42`). The "percentage" is usually the decimal part (`42%`).
