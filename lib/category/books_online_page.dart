import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksOnlinePage extends StatefulWidget {
  @override
  _BooksOnlinePageState createState() => _BooksOnlinePageState();
}

class _BooksOnlinePageState extends State<BooksOnlinePage> {
  final List<Map<String, String>> books = [
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx-qPs68z6k15gIkl7Js3WiJnQ9c4sJPAvuQ&s',
      'title': 'BEGINNING FLUTTER',
      'author': 'Marco L. Napoli',
      'courseType': 'Flutter',
      'url': 'https://digilib.stekom.ac.id/assets/dokumen/ebook/feb_3872ce7467cbdc7beedfcdc12b2b607b0ba36429_1649057575.pdf'
    },
    {
      'image': 'https://dl.acm.org/cms/asset/6b720639-c1b0-49f0-bc4b-90ceb80feb78/560084.cover.gif',
      'title': 'A Complete Guide to Programming in C++',
      'author': 'Ulla Kirch-Prinz Peter Prinz',
      'courseType': 'C++',
      'url': 'https://www.idpoisson.fr/volkov/C++.pdf'
    },
    {
      'image': 'https://m.media-amazon.com/images/I/410avwuaDIL._AC_UF1000,1000_QL80_.jpg',
      'title': 'Teach yourself JAVA in 21 day',
      'author': 'Laura Lemay Charles L. Perkins',
      'courseType': 'Java',
      'url': 'https://www.cs.cmu.edu/afs/cs.cmu.edu/user/gchen/www/download/java/LearnJava.pdf'
    },
    {
      'image': 'https://learning-python.com/lp5e-large.jpg',
      'title': 'Learning Python',
      'author': 'Mark Lutz',
      'courseType': 'Python',
      'url': 'https://cfm.ehu.es/ricardo/docs/python/Learning_Python.pdf'
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNaE2F5nVXh9taTyUPcNE2Svtrl72orEGvjQ&s',
      'title': 'Data Structures and Algorithms',
      'author': 'Granville Barnett, and Luca Del Tongo',
      'courseType': 'Data Structure',
      'url': 'https://www.mta.ca/~rrosebru/oldcourse/263114/Dsa.pdf'
    },
    {
      'image': 'https://m.media-amazon.com/images/I/71T7aD3EOTL._UF1000,1000_QL80_.jpg',
      'title': 'Robert C. Martin Series',
      'author': 'Granville Barnett, and Luca Del Tongo',
      'courseType': 'Clean Code',
      'url': 'https://kolegite.com/EE_library/books_and_lectures/%D0%9F%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%B8%D1%80%D0%B0%D0%BD%D0%B5/Clean%20Code%20-%20%20A%20Handbook%20of%20Agile%20Software%20Craftsmanship.pdf'
    },
    {
      'image': 'https://m.media-amazon.com/images/I/61nHC3YWZlL._AC_UF350,350_QL50_.jpg',
      'title': 'Artificial Intelligence A Modern Approach Third Edition',
      'author': 'Stuart J. Russell and Peter Norvig',
      'courseType': 'AI',
      'url': 'https://people.engr.tamu.edu/guni/csce421/files/AI_Russell_Norvig.pdf'
    },
  ];

  List<Map<String, String>> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    filteredBooks = books;
  }

  void _filterBooks(String query) {
    final filtered = books.where((book) {
      final titleLower = book['title']!.toLowerCase();
      final authorLower = book['author']!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) || authorLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredBooks = filtered;
    });
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC5CAE9),
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text(
          "Books online",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) => _filterBooks(query),
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                final book = filteredBooks[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => _launchURL(book['url']!),
                        child: Image.network(
                          book['image']!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book['title']!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Author: ${book['author']}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Course Type: ${book['courseType']}',
                              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
