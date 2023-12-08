import 'package:flutter/material.dart';

class ExpertConsultationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expert Consultation'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Consult with Our Experts:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildExpertItem(
                    context,
                    'Thamizh Vendan',
                    'Agricultural Scientist',
                    'assets/profile.jpg',
                  ),
                  _buildExpertItem(
                    context,
                    'P.P. Mahendran',
                    'Horticulturist',
                    'assets/profile.jpg',
                  ),
                  // Add more expert items as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpertItem(
      BuildContext context, String name, String expertise, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(name),
        subtitle: Text(expertise),
        onTap: () {
          // Navigate to the chat page for the selected expert
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(name), // Pass the expert's name to the chat page
            ),
          );
        },
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  final String expertName;

  ChatPage(this.expertName);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  void _sendMessage(String message) {
    setState(() {
      _messages.add(message);
      _messageController.clear();
    });

    // Simulate sending the message to the expert after a delay
    Future.delayed(Duration(seconds: 1), () {
      // Replace this with your logic to send the message to the expert
      // Example: ExpertService.sendMessage(widget.expertName, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.expertName}'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                GestureDetector(
                  onTap: () {
                    if (_messageController.text.isNotEmpty) {
                      _sendMessage(_messageController.text);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.send, color: Colors.white),
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




