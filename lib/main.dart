import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/animate/animate_demo.dart';
import 'package:flutter_app/HomePage.dart';
import 'package:flutter_app/launch.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new RandomWords(),
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          // 如果是奇数， 添加一个1像素的分割线widget
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
//    return new Text("${3 ~/ 2}");
//    return _buildSuggestions();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("startup Name Generor"),
        actions: <Widget>[new IconButton(icon: new Icon(Icons.list), onPressed: _launchHomePage)],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final divided = ListTile.divideTiles(tiles: tiles, context: context).toList();

//      return new Scaffold(
//        appBar: new AppBar(
//          title: new Text("Saved Suggestionos"),
//        ),
//        body: new ListView(
//          children: divided,
//        ),
//
      return new HomePage();
    }));
  }

  _launchHomePage() {
    Launch.launch(context, new HomePage());
  }
}
