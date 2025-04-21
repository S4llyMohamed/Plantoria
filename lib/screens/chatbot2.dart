import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(home: ChatScreen(), debugShowCheckedModeBanner: false),
  );
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = [
    // {
    //   "text": "Hi! My plants look weak, and some leaves are turning yellow.",
    //   "isUser": true,
    // },
    // {
    //   "text":
    //       "Hello! Make sure you’re not overwatering them and use a fertilizer rich in nutrients.",
    //   "isUser": false,
    // },
    // {"text": "Got it! Anything else I should do?", "isUser": true},
    // {
    //   "text":
    //       "Yes! Ensure they get enough sunlight and check for pests regularly. 🌱🌞",
    //   "isUser": false,
    // },
  ];

  final TextEditingController controller = TextEditingController();

  void sendMessage() {
    final text = controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      messages.add({"text": text, "isUser": true});
    });
    controller.clear();
  }

  @override
  void dispose() {
    messages.clear(); // Clear messages when leaving the screen
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text('GrowBot', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.only(right: 30, top: 8),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  // color: const Color(0xff9AE66E),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset("assets/p.png", fit: BoxFit.contain),
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Chat messages list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isUser = msg['isUser'];
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 7),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:
                          isUser
                              ? const Color(0xff9AE66E)
                              : Colors.grey.shade200,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: Radius.circular(isUser ? 16 : 0),
                        bottomRight: Radius.circular(isUser ? 0 : 16),
                      ),
                    ),
                    child: Text(
                      msg['text'],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),

          // Message input area
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      controller: controller,
                      onSubmitted:
                          (_) => sendMessage(), // Pressing Enter submits
                      textInputAction:
                          TextInputAction
                              .send, // Changes keyboard button to 'Send'
                      decoration: const InputDecoration(
                        hintText: 'Type a message to GrowBot',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: sendMessage,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff9AE66E),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
