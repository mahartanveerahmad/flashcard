import 'package:flash_card/models/flash_card_model.dart';
import 'package:flash_card/views/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<FlashCard> _flashcards = [
    FlashCard(
        question: "What programming language does flutter use?",
        answer: "dart"),
    FlashCard(question: "who you gona call?", answer: "Ghostbusterd"),
    FlashCard(
        question: "Who Teaches you how to write sexy code?",
        answer: "Maher Tanveer"),
  ];
  int _currentIndex = 0;

  void showNextCard() {
    setState(() {
      _currentIndex =
          _currentIndex + 1 < _flashcards.length ? _currentIndex + 1 : 0;
    });
  }

  void showPrevCard() {
    setState(() {
      _currentIndex =
          _currentIndex - 1 >= 0 ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: FlipCard(
                  front:
                      FlashCardView(text: _flashcards[_currentIndex].question),
                  back: FlashCardView(text: _flashcards[_currentIndex].answer)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: showPrevCard,
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Colors.purple,
                  ),
                  label: const Text(
                    "Prev",
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                ),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: showNextCard,
                  icon: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
