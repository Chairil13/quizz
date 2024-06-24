import 'package:flutter/material.dart';

import 'quizzScreen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _subject = '';
  String _level = 'Beginner';
  int _numberOfQuestions = 1;
  String _language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'QUIZ',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    'Isi formulirnya',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Topik Quiz',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    _subject = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silahkan Masukkan Subjek';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  // value: _level,
                  decoration: const InputDecoration(
                    labelText: 'Pilih level',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _level = value!;
                    });
                  },
                  items: ['Beginner', 'Intermediate', 'Professional', 'Expert']
                      .map((level) => DropdownMenuItem(
                            value: level,
                            child: Text(level),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Jumlah pertanyaan',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    _numberOfQuestions = int.parse(value!);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan masukkan nomor';
                    }
                    // int? number = int.tryParse(value);
                    // if (number == null || number < 1 || number > 15) {
                    //   return 'Please enter a number between 1 and 15';
                    // }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _language,
                  decoration: const InputDecoration(
                    labelText: 'Pilih Bahasa',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _language = value!;
                    });
                  },
                  items: [
                    'English',
                    'Indonesian',
                    'Français',
                    'Spanish',
                    'German',
                    'Japanese',
                    'Korean',
                    'Chinese',
                    'Arabic'
                  ]
                      .map((language) => DropdownMenuItem(
                            value: language,
                            child: Text(language),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizzScreen(
                              subject: _subject,
                              level: _level,
                              numberOfQuestions: _numberOfQuestions,
                              language: _language,
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Mulai',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
