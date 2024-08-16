import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // List to store messages
  final List<Message> _messages = [];
  // Controller for the text input field
  final TextEditingController _controller = TextEditingController();
  // FocusNode to manage focus state of the input field
  final FocusNode _focusNode = FocusNode();
  // ScrollController to control scrolling of the ListView
  final ScrollController _scrollController = ScrollController();

  // Function to handle sending a message
  void _sendMessage() {
    // Return if the input field is empty
    if (_controller.text.isEmpty) return;

    // Create a new message with initial state
    final newMessage = Message(
      text: _controller.text,
      isSent: false,
      isSending: true,
      isReceived: false,
    );

    // Update the state to add the new message and clear the input field
    setState(() {
      _messages.add(newMessage);
      _controller.clear();
    });

    // Scroll to the bottom of the ListView immediately after adding the message
    _scrollToBottom();

    // Request focus back to the input field
    _focusNode.requestFocus();

    // Simulate message sending and receiving after a delay
    Future.delayed(Duration(seconds: 2), () {
      // Simulate success or failure of sending
      final success = true;

      setState(() {
        if (success) {
          newMessage.isSending = false;
          newMessage.isSent = true;
          _scrollToBottom(); // Scroll to bottom after sending
        } else {
          newMessage.isSending = false;
          newMessage.isSent = false;
          _scrollToBottom(); // Scroll to bottom even on failure
        }
      });

      // Simulate receiving a response if the message was sent successfully
      if (success) {
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _messages.add(
              Message(
                  text: 'What do you mean?', isSent: true, isReceived: true),
            );
            _scrollToBottom(); // Scroll to bottom after receiving a new message
          });
        });
      }
    });
  }

  // Function to scroll the ListView to the bottom
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Stack(
          children: [
            Positioned(
              left: 24.0,
              child: Image.asset(
                'assets/images/vector.png',
                color: Color.fromRGBO(74, 63, 105, 1),
              ),
            ),
            Center(
              child: Text(
                'Cameron',
                style: TextStyle(
                  color: Color.fromRGBO(74, 63, 105, 1),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            // ListView to display messages
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          // Input field and send button
          _buildInput(),
        ],
      ),
    );
  }

  // Function to build the UI for a message
  Widget _buildMessage(Message message) {
    // Determine alignment and color based on message state
    final alignment =
        message.isReceived ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final color = message.isReceived
        ? Color.fromRGBO(151, 71, 255, 1)
        : message.isSending
            ? Color.fromARGB(255, 111, 174, 245)
            : Color.fromRGBO(235, 234, 234, 1);
    final textColor = message.isReceived ? Colors.white : Colors.black;
    final statusText = message.isSending
        ? 'Sending...'
        : message.isSent
            ? ''
            : 'Failed to Send';

    return Padding(
      padding: message.isReceived
          ? const EdgeInsets.only(
              left: 24.0,
              right: 69.0,
              top: 8.0,
              bottom: 8.0,
            )
          : const EdgeInsets.only(
              left: 69.0,
              right: 24.0,
              top: 8.0,
              bottom: 8.0,
            ),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: message.isReceived
                  ? BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.text,
                  style: TextStyle(fontSize: 16.0, color: textColor),
                ),
                if (statusText.isNotEmpty)
                  Text(
                    statusText,
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromARGB(255, 109, 106, 106)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build the input field and send button
  Widget _buildInput() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 24.0, bottom: 24.0, top: 5, right: 24.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding:
                  EdgeInsets.only(left: 16.0, bottom: 6.0, top: 6.0, right: 16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 234, 234, 1),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(right: 16.0),
                  hintText: 'Type a message',
                ),
                //maxLines: null,
                //minLines: 1,
                //
                //keyboardType: TextInputType.multiline,
                textDirection: TextDirection.ltr,
                onSubmitted: (value) => _sendMessage(),
              ),
            ),
          ),
          SizedBox(width: 16.0),
          CircleAvatar(
            backgroundColor: Color.fromRGBO(74, 63, 105, 1),
            child: IconButton(
              icon: Icon(
                Icons.mic,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {
                // _sendMessage();
                _focusNode.requestFocus();
              },
            ),
            radius: 30,
          ),
        ],
      ),
    );
  }
}

// Class to represent a message
class Message {
  final String text;
  bool isSent;
  bool isSending;
  final bool isReceived;

  Message({
    required this.text,
    required this.isSent,
    this.isSending = false,
    required this.isReceived,
  });
}
