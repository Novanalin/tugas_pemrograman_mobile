import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis Tebak Kata',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TebakKataPilihan(),
    );
  }
}

class TebakKataPilihan extends StatefulWidget {
  @override
  _TebakKataPilihanState createState() => _TebakKataPilihanState();
}

class _TebakKataPilihanState extends State<TebakKataPilihan> {
  // List of words to guess
  final List<String> _wordList = ['Android', 'IOS', 'Java', 'Website', 'Kotlin', 'Linux', 'Windows', 'Dart', 'GitHub', 'Flutter' ];
  String _selectedWord = '';
  String _message = 'Tebak Kata yang Benar!';
  bool _isCorrect = false;

  @override
  void initState() {
    super.initState();
    _generateNewWord();
  }

  void _generateNewWord() {
    final random = Random();
    setState(() {
      _selectedWord = _wordList[random.nextInt(_wordList.length)];
      _message = 'Tebak Kata yang Benar!';
      _isCorrect = false;
    });
  }

  void _checkGuess(String guess) {
    setState(() {
      if (guess == _selectedWord) {
        _message = 'Benar! Kata tersebut adalah $_selectedWord.';
        _isCorrect = true;
      } else {
        _message = 'Salah! Coba lagi.';
        _isCorrect = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis Tebak Kata'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Tambahkan gambar
              Image.asset('assets/images/Layer-6332.png'),
              SizedBox(height: 20),

              // Display message
              Text(
                _message,
                style: TextStyle(
                  fontSize: 20,
                  color: _message == 'Tebak Kata yang Benar!' ? Colors.blue : (_isCorrect ? Colors.green : Colors.red),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Display choices
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10.0,
                runSpacing: 10.0,
                children: _wordList.map((word) {
                  return ElevatedButton(
                    onPressed: () => _checkGuess(word),
                    child: Text(word),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),

              // New word button
              ElevatedButton(
                onPressed: _generateNewWord,
                child: Text('Tebak Kata Baru'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
