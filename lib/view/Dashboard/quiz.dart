import 'package:flutter/material.dart';
import 'package:rabaa/model/quizModel.dart';
import 'package:rabaa/view/Dashboard/results.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<QuizQuestion> _questions;
  int _currentIndex = 0;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    String jsonString = '''
      {"response_code":0,"results":[{"type":"boolean","difficulty":"medium","category":"Entertainment: Video Games","question":"Mortal Kombat was almost based on Jean-Claude Van Damme movie.","correct_answer":"True","incorrect_answers":["False"]},{"type":"multiple","difficulty":"medium","category":"History","question":"In what year did Kentucky become the 15th state to join the union?","correct_answer":"1792","incorrect_answers":["1782","1798","1788"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Music","question":"From which album is the Gorillaz song, &quot;On Melancholy Hill&quot; featured in?","correct_answer":"Plastic Beach","incorrect_answers":["Demon Days","Humanz","The Fall"]},{"type":"multiple","difficulty":"medium","category":"Geography","question":"Which city is the capital of Switzerland?","correct_answer":"Bern","incorrect_answers":["Z&uuml;rich","Frankfurt","Wien"]},{"type":"multiple","difficulty":"hard","category":"Entertainment: Video Games","question":"What vault in the video game &quot;Fallout 3&quot; is the home of multiple clones named Gary?","correct_answer":"Vault 108","incorrect_answers":["Vault 101","Vault 87","Vault 21"]},{"type":"boolean","difficulty":"easy","category":"Sports","question":"Peyton Manning retired after winning Super Bowl XLIX.","correct_answer":"False","incorrect_answers":["True"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Video Games","question":"What character is NOT apart of the Grand Theft Auto series?","correct_answer":"Michael Cardenas","incorrect_answers":["Packie McReary","Tommy Vercetti","Lester Crest"]},{"type":"boolean","difficulty":"medium","category":"General Knowledge","question":"The sum of all the numbers on a roulette wheel is 666.","correct_answer":"True","incorrect_answers":["False"]},{"type":"multiple","difficulty":"easy","category":"Entertainment: Video Games","question":"Gordon Freeman is said to have burnt and destroyed what food in the break room microwave?","correct_answer":"Casserole","incorrect_answers":["Sub Sandwich","Chicken Soup","Pepperoni Pizza"]},{"type":"multiple","difficulty":"medium","category":"Entertainment: Video Games","question":"&quot;Rollercoaster Tycoon&quot; was programmed mostly entirely in...","correct_answer":"x86 Assembly","incorrect_answers":["C++","C","ALGOL"]}]}
    ''';
    _questions = parseQuizData(jsonString).questions;
  }

void _answerQuestion(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        _score++;
      });
    }
    if (_currentIndex + 1 < _questions.length) {
      _nextQuestion();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            score: _score,
            totalQuestions: _questions.length,
          ),
        ),
      );
    }
  }

  void _nextQuestion() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        centerTitle: true,
      ),
      body: _questions.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Question ${_currentIndex + 1}/${_questions.length}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    _questions[_currentIndex].question,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(height: 20.0),
                  if (_questions[_currentIndex].type == 'boolean')
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _answerQuestion(true);
                          },
                          child: Text('True'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _answerQuestion(false);
                          },
                          child: Text('False'),
                        ),
                      ],
                    ),
                  if (_questions[_currentIndex].type == 'multiple')
                    Column(
                      children: _buildMultipleChoice(),
                    ),
                  SizedBox(height: 20.0),
                  Text(
                    'Score: $_score',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
    );
  }

  List<Widget> _buildMultipleChoice() {
    List<Widget> choices = [];
    List<String> options = _questions[_currentIndex].incorrectAnswers;
    options.add(_questions[_currentIndex].correctAnswer);
    options.shuffle();
    for (String option in options) {
      choices.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            onPressed: () {
              _answerQuestion(option == _questions[_currentIndex].correctAnswer);
            },
            child: Text(option),
          ),
        ),
      );
    }
    return choices;
  }
}