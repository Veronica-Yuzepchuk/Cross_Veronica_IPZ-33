import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Preview App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  final TextEditingController _textController = TextEditingController();
  double _textSize = 20.0;

  // ф-ція для діалогового вікна
  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090',
                width: 60,
                height: 60,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // ф-ція для попереднього перегляду тексту
  void _navigateToPreview() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(
          text: _textController.text,
          textSize: _textSize,
        ),
      ),
    );

    if (result == 'ok') {
      _showDialog('Cool!');
    } else if (result == 'cancel') {
      _showDialog('Let’s try something else');
    } else {
      _showDialog("Don't know what to say");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Text previewer',
            style: TextStyle(
            ),
          ),
        ),
        backgroundColor: Colors.purple[100],
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Text',
                  labelStyle: TextStyle(color: Colors.grey),
                ),
              ),

              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter some text',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Text Size: ${_textSize.round()}'),
                  Expanded(
                    child: Slider(
                      min: 0.0,
                      max: 100.0,
                      value: _textSize,
                      onChanged: (value) {
                        setState(() {
                          _textSize = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _navigateToPreview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Preview'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String text;
  final double textSize;

  const SecondScreen({super.key, required this.text, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Previewer',
            style: TextStyle(
            ),
          ),
        ),
        backgroundColor: Colors.purple[100],
        elevation: 0,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: textSize),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'ok');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("OK"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'cancel');
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
