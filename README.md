### How to Start Using VS Code

1. **Clone the project** to your local machine.
2. Open the project in **VS Code**.
3. Run the following command to fetch dependencies:

   ```sh
   flutter pub get
   ```

4. If you see outdated dependencies, run:

   ```sh
   flutter pub outdated
   flutter pub upgrade
   ```

5. Select a device to run the application:

   - Navigate to **View > Command Palette**.
   - Search for **Flutter: Select Device** and choose a target device.

6. Run the application using:

   ```sh
   flutter run lib/main.dart
   ```

### Features

- Enabled **Guided Access** on iOS and **Screen Pinning** on Android.
- Disabled **Screenshot** and **Screen Recording** when in Guided Access or Screen Pinning mode. (Can still record the screen but it will just be black)
- Enter **Full Screen** when in Guided Access or Screen Pinning mode.

### Upcoming Features

- Enabled **DND (Do Not Disturb)** when in Guided Access or Screen Pinning mode. This will prevent any notifications, overlay, or floating buttons to appear when taking exam.
- Trigger **Fixed Brightness** when in Guided Access or Screen Pinning mode. Still thinking about this, candidates might complain about having high brightness during exam.
