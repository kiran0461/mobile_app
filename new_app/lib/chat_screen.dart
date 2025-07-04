import 'package:flutter/material.dart';

// This is the chat screen UI
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  // List of messages for the chat
  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'me',
      'text': 'Hello! Jhon abraham',
      'time': '09:25 AM',
      'isAudio': false,
      'isFirstFromSender': false,
    },
    {
      'sender': 'other',
      'text': 'Hello ! Kiran, How are you?',
      'time': '09:25 AM',
      'isAudio': false,
      'isFirstFromSender': true,
    },
    {
      'sender': 'me',
      'text': 'You did your job well!',
      'time': '09:25 AM',
      'isAudio': false,
      'isFirstFromSender': false,
    },
    {
      'sender': 'other',
      'text': 'Have a great working week!!',
      'time': '09:25 AM',
      'isAudio': false,
      'isFirstFromSender': true,
    },
    {
      'sender': 'other',
      'text': 'Hope you like it',
      'time': '09:25 AM',
      'isAudio': false,
      'isFirstFromSender': false,
    },
    {
      'sender': 'me',
      'text': '',
      'time': '09:25 AM',
      'isAudio': true,
      'audioDuration': '00:16',
      'isFirstFromSender': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Column(
        children: [
          buildDateChip(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                if (msg['isAudio'] == true) {
                  return buildAudioMessage(msg['audioDuration'], msg['time']);
                }
                if (msg['sender'] == 'me') {
                  return buildMyBubble(msg['text'], msg['time']);
                } else {
                  return buildOtherBubble(
                    msg['text'],
                    msg['time'],
                    msg['isFirstFromSender'] ?? false,
                  );
                }
              },
            ),
          ),
          buildInputBar(),
        ],
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black, size: 26),
        onPressed: () {},
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('image/9.jpg'), 
            radius: 24, 
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Jhon Abraham',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              Text(
                'Active now',
                style: TextStyle(color: Colors.green, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.call, color: Colors.black, size: 28),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.videocam, color: Colors.black, size: 28),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
      centerTitle: false,
    );
  }

  Widget buildDateChip() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            'Today',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  // Outgoing bubble (right, green)
  Widget buildMyBubble(String text, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        constraints: const BoxConstraints(maxWidth: 300),
        decoration: const BoxDecoration(
          color: Color(0xFF1DBF73),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(6),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              time,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  // Incoming bubble (left, grey, with avatar and name for first in group)
  Widget buildOtherBubble(String text, String time, bool showAvatarAndName) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showAvatarAndName
            ? const Padding(
                padding: EdgeInsets.only(right: 10.0, top: 2),
                child: CircleAvatar(
                  backgroundImage: AssetImage('image/9.jpg'),
                  radius: 22,
                ),
              )
            : const SizedBox(width: 52), 
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showAvatarAndName
                  ? const Padding(
                      padding: EdgeInsets.only(bottom: 2.0),
                      child: Text(
                        'Jhon Abraham',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 3),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 13,
                ),
                constraints: const BoxConstraints(maxWidth: 300),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F7FC),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(18),
                    topRight: const Radius.circular(18),
                    bottomLeft: const Radius.circular(6),
                    bottomRight: const Radius.circular(18),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 18),
      ],
    );
  }

  // Audio message bubble (right, green, with play button and waveform)
  Widget buildAudioMessage(String duration, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        constraints: const BoxConstraints(maxWidth: 300),
        decoration: const BoxDecoration(
          color: Color(0xFF1DBF73),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(6),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 30,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 28,
                    alignment: Alignment.centerLeft,
                    child: CustomPaint(
                      size: const Size(120, 28),
                      painter: WaveformPainter(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  duration,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 7),
            Text(
              time,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  // message input bar at the bottom
  Widget buildInputBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          Icon(Icons.attach_file, color: Colors.grey[700], size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F7FC),
                borderRadius: BorderRadius.circular(26),
              ),
              child: const TextField(
                style: TextStyle(fontSize: 17),
                decoration: InputDecoration(
                  hintText: 'Write your message',
                  hintStyle: TextStyle(fontSize: 17),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Icon(Icons.image, color: Colors.grey[700], size: 28),
          const SizedBox(width: 10),
          Icon(Icons.camera_alt, color: Colors.grey[700], size: 28),
          const SizedBox(width: 10),
          Icon(Icons.mic, color: Colors.grey[700], size: 28),
        ],
      ),
    );
  }
}

// waveform for the audio message bubble
class WaveformPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    // heights for the bars
    final barHeights = [12, 22, 16, 26, 10, 18, 23, 14, 22, 12, 16, 20, 10, 18];
    final barWidth = size.width / barHeights.length;
    for (int i = 0; i < barHeights.length; i++) {
      final x = i * barWidth + barWidth / 2;
      final y1 = size.height / 2 - barHeights[i] / 2;
      final y2 = size.height / 2 + barHeights[i] / 2;
      canvas.drawLine(Offset(x, y1), Offset(x, y2), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
