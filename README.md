# Code94Test

## Overview

This README provides instructions for setting up and running a Flutter application that demonstrates a currency converter. The app utilizes MVVM architecture with Provider for state management. Below are the detailed steps for installation, app architecture, and features.

---

## 1. Flutter Installation and Running the Application

### Prerequisites

Ensure you have the following installed:
- Flutter SDK (version 3.0 or later)
- Dart SDK
- A compatible IDE (Visual Studio Code, Android Studio, etc.)
- Android or iOS emulator/device

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/SCJ2798/code94test
   cd code94test
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the application**:
   ```bash
   flutter run
   ```

---

## 2. App Architecture

### MVVM Architecture

The app follows the Model-View-ViewModel (MVVM) architecture pattern to separate concerns and improve maintainability.

- **Model**: Represents the data structure. In this app, it includes classes related to currency data and conversion.
- **View**: Contains the UI components that display data and interact with the user.
- **ViewModel**: Manages the business logic and communicates between the Model and the View. It handles the state of the app and performs currency conversions.

### Provider State Management

Provider is used for state management to manage the app's state efficiently.

- **Provider**: A package for state management that provides a way to expose and consume data within the app.
- **ChangeNotifierProvider**: Used to notify listeners about changes in the state.
- **Consumer**: Allows widgets to listen to and rebuild based on the state changes.

---

## 3. App Features Details

### 3.1. Select Base Currency

1. **Navigate to Insert Amount Section**:
   - Find the section where you can enter the amount.

2. **Select Currency**:
   - On the right side of the text field, there is a dropdown menu.
   - Tap on the dropdown and select the desired base currency.

### 3.2. Insert Base Amount

1. **Navigate to Insert Amount Section**:
   - Go to the section where you enter the amount.

2. **Enter Amount**:
   - In the text field on the left side, type the amount you want to convert.

### 3.3. Add Target Currency

1. **Click Floating Button**:
   - At the bottom right side of the screen, there is a floating action button (FAB).

2. **Select Currency**:
   - After clicking the FAB, a dialog or a new screen will appear where you can select the target currency from a dropdown list.

3. **Save Target Currency**:
   - After selecting the desired currency, click the save button to add it to the list of target currencies.

### 3.4. Delete Target Currency

1. **Click on Currency List Tile**:
   - Find the currency you want to delete in the list of target currencies.

2. **Drag to Delete**:
   - Swipe or drag the currency list tile from the end to the start of the list to delete it.

---

## Additional Information

- **Folder Structure**: The app follows a structured folder layout to maintain clarity and separation of concerns.
  - `lib/models/` - Contains data models
  - `lib/views/` - Contains UI components
  - `lib/viewmodels/` - Contains the ViewModel classes
  - `lib/repository/` - Contains the Repository classes
  - `lib/data/local` - Contains the Local data service classes
  - `lib/data/remote` - Contains the Remote (API) data service classes
  - `lib/data/error` - Contains the error classes
  

