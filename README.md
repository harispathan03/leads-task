# Leads Management App

A simple Flutter application that demonstrates lead capture and management with local persistence.
The app includes login, lead creation, listing, and search functionality.

## Stack Used

Framework: Flutter

Language: Dart

State Management: GetX

Navigation: GetX Routes

Storage: Local storage (JSON serialization)

Architecture: Feature-based structure (Screens / Controllers / Models / Services)

## App Flow

1. Login

User enters dummy credentials.

On success → navigates to Leads List screen.

Authentication is mocked (no API/Firebase).

2. Leads List

Displays all saved leads.

Provides search/filter capability.

Floating Action Button (FAB) opens Create Lead screen.

3. Create Lead

User fills:

Name

Email

Phone

Service

Form validation is applied.

On submit:

Lead is stored.

Screen closes.

List refreshes.

Success message is shown.

4. Search / Filter

User can search leads by name (can be extended to phone/service).
