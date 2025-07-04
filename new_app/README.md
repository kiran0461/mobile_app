

# Flutter Chat UI Assignment

This project is a simple chat application UI built with Flutter. The goal was to **replicate the chat screen design** shown in the provided reference image as closely as possible, focusing on layout, styling, and user interface components.

![Screenshot](image.png)

- **Custom App Bar:**  
  - Back arrow, user avatar, user name ("Jhon Abraham"), "Active now" status, call and video icons.
- **Date Separator:**  
  - "Today" chip centered above the chat messages.
- **Chat Bubbles:**  
  - Outgoing (right, green) and incoming (left, light grey) with correct shapes and timestamps.
  - Incoming messages grouped with avatar and name shown only for the first message in a group.
- **Audio Message Bubble:**  
  - Outgoing audio message with play button, waveform, duration, and timestamp.
- **Message Input Area:**  
  - Attachment, image, camera, and microphone icons with a rounded input field.

## 📂 Project Structure

```
lib/
├── main.dart
└── chat_screen.dart
```

- **main.dart:** Entry point of the app.
- **chat_screen.dart:** Contains all UI code for the chat screen.

## 🖼️ Assets

- Place your avatar image at:  
  `assets/images/avatar21.jpg`
- Make sure to add this path to your `pubspec.yaml` under `assets:`.

## 🚀 Getting Started

1. **Clone this repository** or download the ZIP.
2. **Install dependencies:**
    ```bash
    flutter pub get
    ```
3. **Run the app:**
    ```bash
    flutter run
    ```
4. **Check the UI:**  
   The chat screen should closely match the reference image.

## 📋 Widget Tree Diagram

```
Scaffold
│
├── AppBar
│   ├── Leading: IconButton (Back)
│   ├── Title: Row (Avatar, Name, Status)
│   └── Actions: [Call, Video]
│
├── Column
│   ├── Date Separator ("Today" Chip)
│   ├── Expanded
│   │   └── ListView.builder
│   │       └── [ChatBubble | AudioMessage]
│   └── Message Input Area (Row)
│       ├── Icon (Attach)
│       ├── Expanded (TextField)
│       ├── Icon (Image)
│       ├── Icon (Camera)
│       └── Icon (Mic)
```

## 💡 Notes

- This project is **UI only** (no backend, no real messaging).
- The code is intentionally simple and beginner-friendly.
- All colors, paddings, and font sizes are chosen to match the sample image as closely as possible.

**Happy Fluttering! 🚀**
