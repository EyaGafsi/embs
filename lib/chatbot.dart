import 'package:flutter/material.dart';
import 'package:tounsicare/menu.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final List<Map<String, String>> _messages = [
    {
      "sender": "bot",
      "text":
          "Hi, I am here to help you. Our conversations are private and anonymous."
    },
    {"sender": "bot", "text": "To start, tell me what brings you here?"},
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String userMessage) {
    if (userMessage.trim().isEmpty) return;

    setState(() {
      _messages.add({"sender": "user", "text": userMessage});
    });

    Future.delayed(const Duration(seconds: 1), () {
      String botResponse = _generateBotResponse(userMessage);
      setState(() {
        _messages.add({"sender": "bot", "text": botResponse});
      });
    });

    _controller.clear();
  }

  String _generateBotResponse(String message) {
    if (message.toLowerCase().contains("hello")) {
      return "Hello! How can I help you today?";
    } else if (message.toLowerCase().contains("help")) {
      return "Sure, I am here to assist you. What do you need help with?";
    } else if (message.toLowerCase().contains("thank you")) {
      return "You're welcome! Let me know if there's anything else.";
    } else {
      return "I'm sorry, I didn't quite understand. Could you rephrase that?";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFADCEE5), Color(0xFF5BACAD)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const MenuPage(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 90),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    final isUser = message["sender"] == "user";

                    if (index == 0 && message["sender"] == "bot") {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 30, bottom: 5, right: 20),
                            padding: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 116, 170, 204),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: const Text(
                              "Hi, I am here to help you. Our conversations are private and anonymous.",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Positioned(
                            top: -20,
                            left: 5,
                            child: Opacity(
                              opacity: 0.95,
                              child: Image.asset(
                                "images/bot.png",
                                width: 65,
                                height: 65,
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    return Align(
                      alignment:
                          isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: isUser
                              ? const Color.fromARGB(255, 173, 209, 225)
                              : const Color.fromARGB(255, 116, 170, 204),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(20),
                            topRight: const Radius.circular(20),
                            bottomLeft: Radius.circular(isUser ? 20 : 0.0),
                            bottomRight: Radius.circular(isUser ? 0.0 : 20),
                          ),
                        ),
                        child: Text(
                          message["text"]!,
                          style: TextStyle(
                            color: isUser ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 173, 209, 225),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: "Type a message...",
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(color: Colors.black),
                        onSubmitted: _sendMessage,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send,
                          color: Color.fromARGB(170, 0, 0, 0)),
                      onPressed: () => _sendMessage(_controller.text),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
