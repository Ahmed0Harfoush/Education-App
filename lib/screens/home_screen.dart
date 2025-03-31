import 'package:education_app/screens/course_screen.dart';
import 'package:education_app/screens/Study/study_materials.dart';
import 'package:flutter/material.dart';
import '../GPT/home_screen_chat.dart';
import '../ToDo/task_app.dart';
import '../category/category_page.dart';
import '../category/Classes/classes_page.dart';
import '../category/free_course_page.dart';
import '../category/leader_board_page.dart';
import '../category/books_online_page.dart';
import '../pages/account_page.dart';
import '../pages/courses_page.dart';
import '../pages/wishlist_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  List catNames = [
    "Category",
    "Classes",
    "Free Course",
    "Ask chat",
    "Books online",
    "LeaderBoard"
  ];

  List<Color> catColors = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE08D),
    Color(0xFF61BDFD),
    Color(0xFFFC7C7F),
    Color(0xFFCB84FB),
    Color(0xFF78E667),
  ];


  List<Widget> catIcons = [
    Icon(Icons.category, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
    Icon(Icons.assignment, color: Colors.white, size: 30),
    Image.asset('images/chat/gpt.png', width: 30, height: 30,color: Colors.white,), // Using Image instead of Icon
    Icon(Icons.book_online, color: Colors.white, size: 30),
    Icon(Icons.emoji_events, color: Colors.white, size: 30),
  ];


  List imgList = ['Flutter', 'Java', 'Python', 'C++', 'programming', 'AI'];

  Map<String, List<String>> courseVideos = {
    'Flutter': ['https://www.youtube.com/watch?v=4AoFA19gbLo&list=PLjxrf2q8roU3wk7CDw4RfV3mEwOJbjx1k', 'https://www.youtube.com/watch?v=ceMsPBbcEGg&list=PLjxrf2q8roU3wk7CDw4RfV3mEwOJbjx1k&index=2',
      'https://www.youtube.com/watch?v=9Oblo1ZLY1I&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=3', 'https://www.youtube.com/watch?v=IxSNp7P36Qs&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=4',
      'https://www.youtube.com/watch?v=wlC5FBhrpTs&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=5', 'https://www.youtube.com/watch?v=JtcBZLbrajM&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=6',
      'https://www.youtube.com/watch?v=n4dwi9l_X1k&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=7','https://www.youtube.com/watch?v=Par2c-IJBAU&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=80',
      'https://www.youtube.com/watch?v=fINHBP40uqk&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=9','https://www.youtube.com/watch?v=aigTbJnwv-8&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=10',
      'https://www.youtube.com/watch?v=4EZtvsvSswA&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=11', 'https://www.youtube.com/watch?v=fJwjM5bmBHU&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=12',
      'https://www.youtube.com/watch?v=Abu0w1-YDy0&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=13', 'https://www.youtube.com/watch?v=OmQlBteoWzc&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=14',
      'https://www.youtube.com/watch?v=urKMZHTvuBM&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=15','https://www.youtube.com/watch?v=2ywBwTK4qxs&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=16',
      'https://www.youtube.com/watch?v=jh_alF4pymI&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=17', 'https://www.youtube.com/watch?v=RB-W4bNUnbU&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=18',
      'https://www.youtube.com/watch?v=smjlMKDxlW0&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=19', 'https://www.youtube.com/watch?v=-VZHvAkzK1c&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=20',
      'https://www.youtube.com/watch?v=1puDXWBEht4&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=21', 'https://www.youtube.com/watch?v=brUGtdAJnhE&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=22',
      'https://www.youtube.com/watch?v=KhTDULI2jTc&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=23', 'https://www.youtube.com/watch?v=48aPfXpLTrk&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=24',
      'https://www.youtube.com/watch?v=pvEfXKifO4U&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=25', 'https://www.youtube.com/watch?v=ytKryU1Vs5g&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=26',
      'https://www.youtube.com/watch?v=YFGBnyTF3tE&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=27', 'https://www.youtube.com/watch?v=KLtlGIXQyjU&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=28',
      'https://www.youtube.com/watch?v=bhcbFNmZJ5U&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=29', 'https://www.youtube.com/watch?v=DAuW5pJqjuI&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=30',
      'https://www.youtube.com/watch?v=45G4q-CX4C0&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=31', 'https://www.youtube.com/watch?v=cibpxicoAUQ&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=32',
      'https://www.youtube.com/watch?v=b0Yq-c-JLNg&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=33', 'https://www.youtube.com/watch?v=uL8l0KbeEXY&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=34',
      'https://www.youtube.com/watch?v=Wa6sMJIf9ZY&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=35', 'https://www.youtube.com/watch?v=MFadZ5cOP9I&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=36',
      'https://www.youtube.com/watch?v=5cLg2_ZZ5vU&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=37', 'https://www.youtube.com/watch?v=krGB3zjKWP0&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=38',
      'https://www.youtube.com/watch?v=Y7-rpMoQo2Q&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=39', 'https://www.youtube.com/watch?v=bBwz0eC6E5o&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=40',
      'https://www.youtube.com/watch?v=7f3Hoo5yIxM&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=41', 'https://www.youtube.com/watch?v=xFl3gjLvTcI&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=42',
      'https://www.youtube.com/watch?v=WWpMAHp8gpg&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=43', 'https://www.youtube.com/watch?v=a55sLMvu36s&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=44',
      'https://www.youtube.com/watch?v=V9vL9whDEQc&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=45', 'https://www.youtube.com/watch?v=FrYDUIdZNzo&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=46',
      'https://www.youtube.com/watch?v=gH55mpPfGBc&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=47', 'https://www.youtube.com/watch?v=3eGiYzl8uxI&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=48',
      'https://www.youtube.com/watch?v=GHIUFzuTFIs&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=49', 'https://www.youtube.com/watch?v=fQsXCvru9Hc&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=50',
      'https://www.youtube.com/watch?v=A4d6La_kMJI&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=51', 'https://www.youtube.com/watch?v=snTHmeSKms8&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=52',
      'https://www.youtube.com/watch?v=zy8JlDyi7uU&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=53', 'https://www.youtube.com/watch?v=k6rMYX0Png8&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=54',
      'https://www.youtube.com/watch?v=3LyB26t0Brs&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=55', 'https://www.youtube.com/watch?v=eGt8wh6nB1Q&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=56',
      'https://www.youtube.com/watch?v=bEyN_5z9ecU&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=57', 'https://www.youtube.com/watch?v=Gd99AwQgFCk&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=58',
      'https://www.youtube.com/watch?v=nawTCIr1JNI&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=59', 'https://www.youtube.com/watch?v=1iCyq1cgGE0&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=60',
      'https://www.youtube.com/watch?v=j8i7IsSGcDo&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=61', 'https://www.youtube.com/watch?v=ZWvh_dEU3vw&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=62',
      'https://www.youtube.com/watch?v=TRowxBh8ylw&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=63', 'https://www.youtube.com/watch?v=6wIYuFuB9qM&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=64',
      'https://www.youtube.com/watch?v=6HeOfLPieo8&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=65', 'https://www.youtube.com/watch?v=XOBZYosTgFA&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=69',
      'https://www.youtube.com/watch?v=wXtAm2zXE8Q&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=86', 'https://www.youtube.com/watch?v=LfcDPKHBbtA&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=88',
      'https://www.youtube.com/watch?v=JSvoNKCAqmI&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=89', 'https://www.youtube.com/watch?v=r0HQSEXSwfg&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=90',
      'https://www.youtube.com/watch?v=z0XlxGV-O-w&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=91', 'https://www.youtube.com/watch?v=uPd9mITpVBs&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=92',
      'https://www.youtube.com/watch?v=6jIenhu1Sns&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=93', 'https://www.youtube.com/watch?v=wMwtJ9DBTTo&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=94',
      'https://www.youtube.com/watch?v=lDgwt837gRE&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=95', 'https://www.youtube.com/watch?v=q8Ezruwv7HA&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=96',
      'https://www.youtube.com/watch?v=2DiVwB0X1Bg&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=97', 'https://www.youtube.com/watch?v=KVPVT9gvGLE&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=98',
      'https://www.youtube.com/watch?v=GILkMtpdogk&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=99', 'https://www.youtube.com/watch?v=VHODKtQW-Kk&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=100',
      'https://www.youtube.com/watch?v=WsCqMOpDqnE&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=101', 'https://www.youtube.com/watch?v=4KPWiwEHOUI&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=102',
      'https://www.youtube.com/watch?v=_enL3bRiHVI&list=PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ&index=87'
    ],
    'Java': ['https://www.youtube.com/shorts/4Z0dSlLqjJo','https://www.youtube.com/watch?v=FbviMTJ_vP8&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f',
      'https://www.youtube.com/watch?v=gzlhm0jco0g&list=PLS1QulWo1RIbfTjQvTdj8Y6yyq4R7g-Al&index=2','https://www.youtube.com/watch?v=KYhy6Q914C0&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=2',
      'https://www.youtube.com/watch?v=dfOe9XIj6EY&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=3', 'https://www.youtube.com/watch?v=pleAjW8KJrg&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=4',
      'https://www.youtube.com/watch?v=0uU-DwqpY74&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=5', 'https://www.youtube.com/watch?v=0Nb4wHNj5bE&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=6',
      'https://www.youtube.com/watch?v=IUu7_6pecHQ&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=7', 'https://www.youtube.com/watch?v=eAVLutX8bL0&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=8',
      'https://www.youtube.com/watch?v=xHdc_z4vTlg&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=9', 'https://www.youtube.com/watch?v=FG7-8gAJ-5k&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=10',
      'https://www.youtube.com/watch?v=igBAvIb8kVA&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=11', 'https://www.youtube.com/watch?v=B_hJVREXkxo&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=12',
      'https://www.youtube.com/watch?v=usiSqquehcs&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=13', 'https://www.youtube.com/watch?v=4HOpxzgyNoo&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=14',
      'https://www.youtube.com/watch?v=MI3RMJ07zdU&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=15', 'https://www.youtube.com/watch?v=uu3ezsqDI5g&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=16',
      'https://www.youtube.com/watch?v=qvs_hmpMsmQ&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=17', 'https://www.youtube.com/watch?v=V4W5vNAP-t0&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=18',
      'https://www.youtube.com/watch?v=J_-M2HuO8Ng&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=19','https://www.youtube.com/watch?v=KNJZqS6IwaU&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=20',
      'https://www.youtube.com/watch?v=GDb7diTDq9I&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=21', 'https://www.youtube.com/watch?v=up20my-_yCY&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=22',
      'https://www.youtube.com/watch?v=joiBD693gLc&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=23', 'https://www.youtube.com/watch?v=n5pcp_WOMWY&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=24',
      'https://www.youtube.com/watch?v=FdUQaSjPPiQ&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=25', 'https://www.youtube.com/watch?v=dLl-5Tjy_Fg&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=26',
      'https://www.youtube.com/watch?v=L9-AiQHBUc0&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=27', 'https://www.youtube.com/watch?v=M3Na5luSx50&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=29',
      'https://www.youtube.com/watch?v=IzjJqzX4hx0&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=30', 'https://www.youtube.com/watch?v=IiyO7kFHFcI&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=31',
      'https://www.youtube.com/watch?v=itxieu37gAk&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=32', 'https://www.youtube.com/watch?v=8Tx3ZkyutI4&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=33',
      'https://www.youtube.com/watch?v=qB3UP3yhdJA&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=34', 'https://www.youtube.com/watch?v=Rrx_5jn1BWk&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=35',
      'https://www.youtube.com/watch?v=mmg-Tgpx19k&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=36', 'https://www.youtube.com/watch?v=lhfX8FPG7ZE&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=37',
      'https://www.youtube.com/watch?v=WS1uq6g183E&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=38', 'https://www.youtube.com/watch?v=FMzuhNde4Os&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=39',
      'https://www.youtube.com/watch?v=k2tHU_cegu4&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=40', 'https://www.youtube.com/watch?v=jo1SGSbgdRo&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=41',
      'https://www.youtube.com/watch?v=IMBkkfo7z0s&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=42', 'https://www.youtube.com/watch?v=lPvY3jV6MRQ&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=43',
      'https://www.youtube.com/watch?v=YTcDkM3FJEo&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=44', 'https://www.youtube.com/watch?v=w99Owc11rMU&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=45',
      'https://www.youtube.com/watch?v=BzhbsAnTX70&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=46', 'https://www.youtube.com/watch?v=1rNGO0113Ns&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=47',
      'https://www.youtube.com/watch?v=6RjZP0LV-zY&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=48', 'https://www.youtube.com/watch?v=8eRQ3CLsxew&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=49',
      'https://www.youtube.com/watch?v=SV1EdFvhOCw&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=50', 'https://www.youtube.com/watch?v=jv_cnBtv_Dc&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=51',
      'https://www.youtube.com/watch?v=IysqYCbvC5w&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=52', 'https://www.youtube.com/watch?v=FKVyBXWcHRo&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=53',
      'https://www.youtube.com/watch?v=Hn7wMiTarMs&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=54', 'https://www.youtube.com/watch?v=KggbpCuKcss&list=PL1DUmTEdeA6K7rdxKiWJq6JIxTvHalY8f&index=55',
    ],
    'Python': ['https://www.youtube.com/watch?v=xkZMUX_oQX4&t=17s', 'https://www.youtube.com/watch?v=Do34NKMq80c&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9',
      'https://www.youtube.com/watch?v=MWbucf-IgSI&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=2', 'https://www.youtube.com/watch?v=jsPH-pc-uk8&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=3',
      'https://www.youtube.com/watch?v=soeFEuWGq1g&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=4','https://www.youtube.com/watch?v=KyhcyHfVWC4&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=5',
      'https://www.youtube.com/watch?v=Eo6yjsDYCuo&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=6', 'https://www.youtube.com/watch?v=R_NU4vsJU6s&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=7',
      'https://www.youtube.com/watch?v=2g0-njo4Gzo&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=8', 'https://www.youtube.com/watch?v=6Yak2hOdJWE&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=9',
      'https://www.youtube.com/watch?v=1OjEOXgVZJs&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=10', 'https://www.youtube.com/watch?v=jnDhsH5rwa8&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=11',
      'https://www.youtube.com/watch?v=e_6M-c30z8g&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=14', 'https://www.youtube.com/watch?v=aueaY_at0xg&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=15',
      'https://www.youtube.com/watch?v=qS47lHZFQlU&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=16', 'https://www.youtube.com/watch?v=ll3iQi55Q0w&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=17',
      'https://www.youtube.com/watch?v=Ya8W9-bDTrc&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=18', 'https://www.youtube.com/watch?v=FVG79ZzOUvc&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=19',
      'https://www.youtube.com/watch?v=aGtglWkjkmk&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=20', 'https://www.youtube.com/watch?v=Iczi2XD2Lus&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=21',
      'https://www.youtube.com/watch?v=hGcsssSEQdc&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=22', 'https://www.youtube.com/watch?v=3vN6cT0ukCE&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=23',
      'https://www.youtube.com/watch?v=lMc5fnsKe00&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=24', 'https://www.youtube.com/watch?v=YZIAXU30Zy4&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=25',
      'https://www.youtube.com/watch?v=E3oNmRMNwuY&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=26', 'https://www.youtube.com/watch?v=910lHBMO7T0&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=27',
      'https://www.youtube.com/watch?v=SqeF-AgWfQU&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=28', 'https://www.youtube.com/watch?v=T_Qekdi6Lyc&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=29',
      'https://www.youtube.com/watch?v=0ef_PHn4ewY&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=30', 'https://www.youtube.com/watch?v=SoM7likpJco&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=31',
      'https://www.youtube.com/watch?v=0NnF32jfSUk&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=32', 'https://www.youtube.com/watch?v=NeWJW2hvsEk&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=33',
      'https://www.youtube.com/watch?v=P0BKnAP9xoQ&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=34', 'https://www.youtube.com/watch?v=zU0iLY49-BE&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=35',
      'https://www.youtube.com/watch?v=x5Vwp9cFR5A&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=36', 'https://www.youtube.com/watch?v=o2OS2suyfEg&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=37',
      'https://www.youtube.com/watch?v=ZXu6iUiwAa0&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=38', 'https://www.youtube.com/watch?v=OoKudGvc-WA&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=39',
      'https://www.youtube.com/watch?v=Eoka4Erh5lY&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=40', 'https://www.youtube.com/watch?v=YpkvbG0iXEA&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=41',
      'https://www.youtube.com/watch?v=ZlENdNkjBN4&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=42', 'https://www.youtube.com/watch?v=lKv8pOeZxiY&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=43',
      'https://www.youtube.com/watch?v=kH9yGLAFcrw&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=44', 'https://www.youtube.com/watch?v=rZ5vfo6-M74&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=45',
      'https://www.youtube.com/watch?v=lLAW7Buy27o&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=46', 'https://www.youtube.com/watch?v=yWXwKu1cygQ&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=47',
      'https://www.youtube.com/watch?v=sjXKYHpROzo&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=48', 'https://www.youtube.com/watch?v=Ny2CAO-MvPQ&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=49',
      'https://www.youtube.com/watch?v=u8Tkw9sgJeE&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=50', 'https://www.youtube.com/watch?v=__0l0oaJwOM&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=51',
      'https://www.youtube.com/watch?v=Hu1qDNuEhyo&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=52', 'https://www.youtube.com/watch?v=eyVKLDHqMrA&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=53',
      'https://www.youtube.com/watch?v=EDdPspiCY5s&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=54', 'https://www.youtube.com/watch?v=pQRTKeMVfig&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=55',
      'https://www.youtube.com/watch?v=0qlNAe6h5jM&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=56', 'https://www.youtube.com/watch?v=LgGJDyhyfMQ&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=57',
      'https://www.youtube.com/watch?v=lV-KqVqfzss&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=58', 'https://www.youtube.com/watch?v=YVHhgMlo3-c&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=59',
      'https://www.youtube.com/watch?v=tUMcR80uSgE&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=60', 'https://www.youtube.com/watch?v=MR47o3v4Mss&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=61',
      'https://www.youtube.com/watch?v=E7eQ-u21hpU&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=62', 'https://www.youtube.com/watch?v=crRgWYpicfI&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=63',
      'https://www.youtube.com/watch?v=uuotL12J_5E&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=64', 'https://www.youtube.com/watch?v=-BPIF6yPQkw&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=65',
      'https://www.youtube.com/watch?v=nKVU_kaQYUs&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=66', 'https://www.youtube.com/watch?v=A0kIdl9BZ8Y&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=67',
      'https://www.youtube.com/watch?v=SDzoG72zh08&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=68', 'https://www.youtube.com/watch?v=4K9pyl4eQ7U&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=69',
      'https://www.youtube.com/watch?v=p38685OnYWY&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=70', 'https://www.youtube.com/watch?v=lbZIttPFS20&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=71',
      'https://www.youtube.com/watch?v=TgUxTMn9npw&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=72', 'https://www.youtube.com/watch?v=-6muUzRLH3k&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=73',
      'https://www.youtube.com/watch?v=BOwhs56dOP4&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=74', 'https://www.youtube.com/watch?v=_Zf8si7N4t8&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=75',
      'https://www.youtube.com/watch?v=lCCSqQ3VVY4&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=76', 'https://www.youtube.com/watch?v=B2tFd1AtamI&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=77',
      'https://www.youtube.com/watch?v=Bkur3I6O2dk&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=78', 'https://www.youtube.com/watch?v=IPkWfO1kuWQ&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=79',
      'https://www.youtube.com/watch?v=VhBx0_HCDcA&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=80', 'https://www.youtube.com/watch?v=9Fps_pfnpYM&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=82',
      'https://www.youtube.com/watch?v=t-spUjUn8L4&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=83', 'https://www.youtube.com/watch?v=mjkVxoRR6xc&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=84',
      'https://www.youtube.com/watch?v=uxIZ23K5dEk&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=85', 'https://www.youtube.com/watch?v=5NWI5f5UAeQ&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=86',
      'https://www.youtube.com/watch?v=cB_xSH3WFMY&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=87', 'https://www.youtube.com/watch?v=0BINzQIKStw&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=88',
      'https://www.youtube.com/watch?v=b6ZbtdJ7D84&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=89', 'https://www.youtube.com/watch?v=zsA4vnzTi_A&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=90',
      'https://www.youtube.com/watch?v=va5cthcItv4&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=91', 'https://www.youtube.com/watch?v=_FenZMTWKVA&list=PLoP3S2S1qTfCUdNazAZY1LFALcUr0Vbs9&index=92',
    ],
    'C++': ['https://www.youtube.com/watch?v=UdTzHmjMYBc',
      'https://www.youtube.com/watch?v=XDuWyYxksXU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS', 'https://www.youtube.com/watch?v=jOUb09iiO20&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=2',
      'https://www.youtube.com/watch?v=R-Hu5rdn-vc&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=3', 'https://www.youtube.com/watch?v=RWtT07Id-n4&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=4',
      'https://www.youtube.com/watch?v=FVV4kTy0dJg&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=5', 'https://www.youtube.com/watch?v=1K1sET8dDrI&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=6',
      'https://www.youtube.com/watch?v=NeHu899_uYA&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=7', 'https://www.youtube.com/watch?v=6UoFcvARKI4&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=8',
      'https://www.youtube.com/watch?v=R2zqj_52WwU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=9', 'https://www.youtube.com/watch?v=A6B4tlaPapo&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=10',
      'https://www.youtube.com/watch?v=J_vnlD5Ca-U&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=11', 'https://www.youtube.com/watch?v=HHl6YF6GUhw&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=12',
      'https://www.youtube.com/watch?v=zBhT544Xy0o&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=13', 'https://www.youtube.com/watch?v=cS0tbixHmdI&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=14',
      'https://www.youtube.com/watch?v=7hM-MBheZ-w&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=15', 'https://www.youtube.com/watch?v=BibCqAo5ZsQ&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=16',
      'https://www.youtube.com/watch?v=MrwqesK64aU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=17', 'https://www.youtube.com/watch?v=739Wvc6XqDM&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=18',
      'https://www.youtube.com/watch?v=8efyLVOfd4E&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=19', 'https://www.youtube.com/watch?v=BIQplCgmB2o&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=20',
      'https://www.youtube.com/watch?v=rqXv-mKqw5Y&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=21', 'https://www.youtube.com/watch?v=ZX2DLrnCR3w&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=22',
      'https://www.youtube.com/watch?v=N68m5IxR_zw&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=23', 'https://www.youtube.com/watch?v=AQyni1r43T0&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=24',
      'https://www.youtube.com/watch?v=nCO0KZ67b1Q&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=25', 'https://www.youtube.com/watch?v=RWVrMQpvVxU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=26',
      'https://www.youtube.com/watch?v=xpznDlbgQPM&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=27', 'https://www.youtube.com/watch?v=41v0w8BjJms&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=28',
      'https://www.youtube.com/watch?v=e0Gz1_ceuMU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=29', 'https://www.youtube.com/watch?v=QmUR0ZIrXQA&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=30',
      'https://www.youtube.com/watch?v=l67qWVYe-xo&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=31','https://www.youtube.com/watch?v=Ps0xSAXmULA&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=32',
      'https://www.youtube.com/watch?v=Ang11UuVE30&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=33', 'https://www.youtube.com/watch?v=8ptGpQ_2Np8&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=34',
      'https://www.youtube.com/watch?v=KWRFfCToxiY&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=35', 'https://www.youtube.com/watch?v=OK1uu-axN0E&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=36',
      'https://www.youtube.com/watch?v=w8WnxLZmctg&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=37', 'https://www.youtube.com/watch?v=NWP1cTeDFVY&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=38',
      'https://www.youtube.com/watch?v=4DkdiXp5rYw&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=39', 'https://www.youtube.com/watch?v=4v5hDgUDK9Q&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=40',
      'https://www.youtube.com/watch?v=2pG43LVr_Sw&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=41', 'https://www.youtube.com/watch?v=dNCryC9CzQQ&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=42',
      'https://www.youtube.com/watch?v=lylQR-hFV-M&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=43', 'https://www.youtube.com/watch?v=Ne7RthIdaok&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=44',
      'https://www.youtube.com/watch?v=oyYC2dOekeU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=45', 'https://www.youtube.com/watch?v=PJeNjjQcrG8&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=46',
      'https://www.youtube.com/watch?v=_eYTdzypBIY&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=47', 'https://www.youtube.com/watch?v=p0pCO7gPfmQ&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=48',
      'https://www.youtube.com/watch?v=DoY-G3Fwy4g&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=49', 'https://www.youtube.com/watch?v=ykpDu3swciM&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=50',
      'https://www.youtube.com/watch?v=pbu11F6X9Yg&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=51', 'https://www.youtube.com/watch?v=3ESx17kVUKo&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=52',
      'https://www.youtube.com/watch?v=5rtyV-WOIpA&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=53', 'https://www.youtube.com/watch?v=q2BVplB0RgI&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=54',
      'https://www.youtube.com/watch?v=Gkg8NmfUCjg&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=55', 'https://www.youtube.com/watch?v=MBvixzJw2sQ&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=56',
      'https://www.youtube.com/watch?v=wOBMuQUlKNY&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=57', 'https://www.youtube.com/watch?v=qBojueEZxjs&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=58',
      'https://www.youtube.com/watch?v=kApYul6wN3A&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=59', 'https://www.youtube.com/watch?v=2NPd8KgneBQ&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=60',
      'https://www.youtube.com/watch?v=ErBDovJ3eTk&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=61', 'https://www.youtube.com/watch?v=wyFLcNCCaas&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=62',
      'https://www.youtube.com/watch?v=AU_wSvenbI8&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=63', 'https://www.youtube.com/watch?v=bpXRvo4IH-0&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=64',
      'https://www.youtube.com/watch?v=I_AzDYyhlMU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=65', 'https://www.youtube.com/watch?v=djgs6PnNl2w&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=66',
      'https://www.youtube.com/watch?v=55MRxgVOkMo&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=67', 'https://www.youtube.com/watch?v=OIJsJrNJKUc&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=68',
      'https://www.youtube.com/watch?v=QSmQylbugAg&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=69', 'https://www.youtube.com/watch?v=JrPhJtFuwqU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=70',
      'https://www.youtube.com/watch?v=_RE-naCqphE&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=71', 'https://www.youtube.com/watch?v=DgJqgq5Is0Y&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=72',
      'https://www.youtube.com/watch?v=RoKGZi4ArFo&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=73', 'https://www.youtube.com/watch?v=Qm14ePexV10&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=74',
      'https://www.youtube.com/watch?v=s6sb23dglxs&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=75', 'https://www.youtube.com/watch?v=9ALw6qoCvk8&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=76',
      'https://www.youtube.com/watch?v=9ZE8HAHyp4I&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=77', 'https://www.youtube.com/watch?v=Mlo7_fUG4N0&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=78',
      'https://www.youtube.com/watch?v=6U6WtWG3NrA&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU', 'https://www.youtube.com/watch?v=mYMwYUU6HAs&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=2',
      'https://www.youtube.com/watch?v=AqAyBoy5bcg&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=3', 'https://www.youtube.com/watch?v=8CtVnogubxQ&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=4',
      'https://www.youtube.com/watch?v=OWoXsjvDPas&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=5', 'https://www.youtube.com/watch?v=oX4krxQisZ0&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=6',
      'https://www.youtube.com/watch?v=dIEJ9L2sX04&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=7', 'https://www.youtube.com/watch?v=54jjyqtDawA&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=8',
      'https://www.youtube.com/watch?v=jj4A4letbkA&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=9', 'https://www.youtube.com/watch?v=NX8ROdE-TfE&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=10',
      'https://www.youtube.com/watch?v=ssAkGOXt6tM&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=11', 'https://www.youtube.com/watch?v=mODdipJl7hs&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=12',
      'https://www.youtube.com/watch?v=Y6qBd_eEN-0&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=13', 'https://www.youtube.com/watch?v=kEKLmupmxFU&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=14',
      'https://www.youtube.com/watch?v=Gd1KamgzKwE&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=15', 'https://www.youtube.com/watch?v=QgcbH4oOuUU&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=16',
      'https://www.youtube.com/watch?v=1H9FnhOGsbg&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=17', 'https://www.youtube.com/watch?v=u-9YNtI97Tg&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=18',
      'https://www.youtube.com/watch?v=4XmmPBhr1cI&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=19', 'https://www.youtube.com/watch?v=pEkscsIRysU&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=20',
      'https://www.youtube.com/watch?v=PizCZbMwNBc&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=21', 'https://www.youtube.com/watch?v=UtvrvFAgLCQ&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=22',
      'https://www.youtube.com/watch?v=VhLQZYkLhpg&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=23', 'https://www.youtube.com/watch?v=xyIvVmDNS6w&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=24',
      'https://www.youtube.com/watch?v=ri5fB9Vq7Uo&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=25', 'https://www.youtube.com/watch?v=38IG-UToeZ0&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=26',
      'https://www.youtube.com/watch?v=jGP19W5IObA&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt', 'https://www.youtube.com/watch?v=OlY_Fwfyk6s&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=2',
      'https://www.youtube.com/watch?v=XxniWLQEMMo&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=3', 'https://www.youtube.com/watch?v=Ozm_OHViErY&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=4',
      'https://www.youtube.com/watch?v=pASx8xQtIYY&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=5', 'https://www.youtube.com/watch?v=TU2S9P5CRUE&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=6',
      'https://www.youtube.com/watch?v=cQ-HCe_IAos&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=7', 'https://www.youtube.com/watch?v=80pnhhHGpWc&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=8',
      'https://www.youtube.com/watch?v=nyIF45QKX4k&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=9', 'https://www.youtube.com/watch?v=i_Q_YZwdoMg&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=10',
      'https://www.youtube.com/watch?v=ykfeLmXogw8&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=11', 'https://www.youtube.com/watch?v=quMfajPvW24&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=12',
      'https://www.youtube.com/watch?v=dqgZd8qvXoY&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=13', 'https://www.youtube.com/watch?v=tEVTakjxS-Q&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=14',
    ],
    'programming': ['https://www.youtube.com/watch?v=JdEI8Zaf-lA', 'https://www.youtube.com/watch?v=LGY-Keww1Ac',
      'https://www.youtube.com/watch?v=Dv7gLpW91DM&t=32s','https://www.youtube.com/watch?v=6rxWc-TNIJI', 'https://www.youtube.com/watch?v=zN7cH8DYF2Y&t=50s',
      'https://www.youtube.com/watch?v=XASY30EfGAc', 'https://www.youtube.com/watch?v=iqOYf4RFnMY', 'https://www.youtube.com/watch?v=EGQh5SZctaE',
      'https://www.youtube.com/watch?v=N7ZmPYaXoic', 'https://www.youtube.com/watch?v=CIRGjwYgdT4', 'https://www.youtube.com/watch?v=aYjGXzktatA',
      'https://www.youtube.com/watch?v=SS19Q-_saCc', 'https://www.youtube.com/watch?v=pXHnLbyDKNQ', 'https://www.youtube.com/watch?v=ytYS-Geo5JM'
    ],
    'AI': ['https://www.youtube.com/watch?v=ad79nYk2keg', 'https://www.youtube.com/watch?v=Yq0QkCxoTHM'],
  };



  Map<String, Map<String, dynamic>> courseDetails = {
    'Flutter': {
      'description': '''
      Flutter is an open-source UI toolkit developed by Google for building natively compiled applications for mobile, web, and desktop from a single codebase. It uses the Dart programming language and features a rich set of pre-designed widgets that allow for fast and efficient UI development.

Key aspects of Flutter include:

- **Single Codebase**: Write once and run on multiple platforms (iOS, Android, web, desktop).
- **Hot Reload**: Allows developers to see changes in real time without restarting the app.
- **Customizable Widgets**: Flutter provides a wide range of customizable widgets, which are the building blocks of any app.
- **Native Performance**: Despite being a cross-platform framework, Flutter achieves near-native performance thanks to its compilation to native ARM code.
- **Dart Language**: Flutter uses Dart, a language optimized for UI creation and fast development cycles.

      ''',
      'length': '26 Hours',
      'rating': 4.5,
    },
    'Java': {
      'description': '''
      Java is a high-level, object-oriented programming language developed by Sun Microsystems (now owned by Oracle) in 1995. It is widely used for building cross-platform applications, particularly in web and Android development, due to its "write once, run anywhere" (WORA) principle.

Key features of Java include:

- **Object-Oriented**: Java promotes reusable and modular code through its object-oriented structure, focusing on classes and objects.
- **Platform Independence**: Java applications are compiled into bytecode, which runs on the Java Virtual Machine (JVM), making them platform-independent.
- **Rich Standard Library**: Java comes with an extensive standard library, including packages for data structures, networking, multithreading, and more.
- **Automatic Memory Management**: Java provides garbage collection, which automatically manages memory allocation and deallocation.
- **Security**: Java includes built-in security features, making it a common choice for web-based applications.
- **Concurrency Support**: Java has built-in support for multithreading and concurrency, making it efficient for handling complex operations.
- **Android Development**: Java is the primary language for Android app development, powering a large portion of mobile applications.
      ''',
      'length': '30 Hours',
      'rating': 4.3,
    },
    'Python': {
      'description': '''
      Python is a high-level, interpreted programming language known for its simplicity, readability, and versatility. Created by Guido van Rossum in 1991, Python is widely used in various domains, including web development, data analysis, artificial intelligence, automation, and scientific computing.

Key features of Python include:

- **Readability**: Python's syntax is designed to be easy to read and write, making it accessible to beginners while powerful for advanced use.
- **Dynamically Typed**: Variables in Python are not explicitly declared, and their types are determined at runtime.
- **Interpreted Language**: Python code is executed line by line, which simplifies debugging and speeds up development.
- **Extensive Libraries**: Python has a vast standard library and a rich ecosystem of third-party packages (e.g., NumPy, pandas, TensorFlow), supporting a wide range of tasks.
- **Cross-Platform**: Python code runs on multiple platforms (Windows, macOS, Linux) without modification.
- **Support for Multiple Paradigms**: Python supports object-oriented, procedural, and functional programming paradigms.
- **Automation and Scripting**: Python is commonly used for automating repetitive tasks and writing scripts due to its ease of use and flexibility.
- **Popular in Data Science**: Python is the go-to language for data analysis, machine learning, and AI due to its powerful libraries and frameworks.
      ''',
      'length': '20 Hours',
      'rating': 4.7,
    },
    'C++': {
      'description': '''
      C++ is a high-performance, general-purpose programming language created by Bjarne Stroustrup in 1985 as an extension of C. It supports both procedural and object-oriented programming paradigms, making it a flexible and powerful tool for system-level software, game development, and performance-critical applications.

Key features of C++ include:

- **Object-Oriented Programming (OOP)**: C++ supports classes, inheritance, polymorphism, encapsulation, and abstraction, enabling modular and reusable code.
- **High Performance**: C++ is compiled to machine code, making it highly efficient and suitable for performance-critical applications like games, real-time simulations, and operating systems.
- **Memory Management**: Unlike languages with automatic garbage collection, C++ provides manual memory management with features like pointers and dynamic memory allocation (via `new` and `delete`).
- **Standard Template Library (STL)**: C++ includes the STL, a collection of powerful, templated classes and algorithms like vectors, lists, stacks, queues, and various sorting and searching algorithms.
- **Low-Level System Access**: C++ allows low-level manipulation of hardware resources, making it suitable for system-level programming, such as developing operating systems, drivers, and embedded systems.
- **Multi-Paradigm**: C++ supports procedural, object-oriented, and functional programming, offering flexibility in how programs are designed and implemented.
- **Portability**: C++ is highly portable, enabling code to be written once and compiled across different platforms.

C++ is widely used in applications where high performance and control over system resources are essential.
      ''',
      'length': '24 Hours',
      'rating': 4.6,
    },
    'programming': {
      'description': '''
      This course serves as a foundational guide to the principles of programming, suitable for beginners with no prior experience. Participants will learn the core concepts and fundamental constructs of programming, including:

Basic Syntax and Semantics: Understanding the rules and structure of programming languages.
Variables and Data Types: Exploring different types of data and how to store and manipulate them.
Control Structures: Learning about decision-making through conditional statements (if, else) and loops (for, while).
Functions and Modular Programming: Discovering how to create reusable code through functions and the importance of modular design.
Basic Algorithms: Introduction to problem-solving techniques and common algorithms.
Debugging and Testing: Developing skills to troubleshoot and test code effectively.
By the end of the course, students will be able to write simple programs and develop a solid understanding of programming logic, preparing them for more advanced topics in computer science.
      ''',
      'length': '20 Hours',
      'rating': 4.7,
    },
    'AI': {
      'description': '''
      This course provides an in-depth exploration of Artificial Intelligence, focusing on its principles, methodologies, and real-world applications. Participants will gain a comprehensive understanding of the following key topics:

Introduction to AI: Overview of AI history, concepts, and the difference between AI, machine learning, and deep learning.
Machine Learning: Understanding supervised, unsupervised, and reinforcement learning techniques, along with key algorithms and their applications.
Neural Networks: Exploring the structure and functioning of neural networks, including deep learning architectures and their applications in various domains.
Natural Language Processing (NLP): Learning how AI can understand and process human language, including techniques for text analysis and language generation.
Computer Vision: Introduction to techniques for enabling machines to interpret and understand visual information from the world.
Ethics and Impact of AI: Discussion on the ethical implications of AI, including bias, fairness, and the societal impact of AI technologies.
By the end of the course, students will have a foundational understanding of AI technologies, enabling them to develop AI-based solutions and critically assess the role of AI in modern society.
      ''',
      'length': '20 Hours',
      'rating': 4.7,
    },
  };


  int _selectedIndex = 0;

  List<Widget> _pages = [
    Container(), // Placeholder for the Home page.
    CoursesPage(),
    WishlistPage(),
    AccountPage(),
    TasksApp(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
    });
  }

  void navigateToCategoryPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => ClassesPage()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => FreeCoursePage()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreenChat()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => BooksOnlinePage()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) => LeaderBoardPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List filteredCourses = imgList.where((course) {
      return course.toLowerCase().contains(_searchQuery);
    }).toList();

    return Scaffold(
      body: _selectedIndex == 0
          ? ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
              color: Color(0xFF674AEF),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.dashboard, size: 30, color: Colors.white),
                    Tooltip(
                      message: 'Activate it to receive notifications',
                      child: IconButton(
                        icon: Icon(Icons.notifications, size: 30, color: Colors.white),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('There are no notifications!')),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 15),
                  child: Text(
                    "Hi Programmer",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search here....",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                      prefixIcon: Icon(Icons.search, size: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: catNames.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => navigateToCategoryPage(context, index),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: catColors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: catIcons[index]),
                          ),
                          SizedBox(height: 10),
                          Text(
                            catNames[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Courses",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF674AEF),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GridView.builder(
                  itemCount: filteredCourses.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (MediaQuery.of(context).size.height - 50 - 20) / (4 * 240),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseScreen(
                              courseName: filteredCourses[index],
                              courseVideos: courseVideos[filteredCourses[index]] ?? [],
                              courseDetails: courseDetails[filteredCourses[index]]!, // Ensure it's not null
                            ),
                          ),
                        );
                      },
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => CourseScreen(
                      //         courseName: filteredCourses[index],
                      //         courseVideos: courseVideos[filteredCourses[index]]!.map((video) => video['name']!).toList(), // Get video names
                      //         courseDetails: courseDetails[filteredCourses[index]]!, // Ensure it's not null
                      //       ),
                      //     ),
                      //   );
                      // },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                "images/language/${filteredCourses[index]}.png",
                                height: 100,
                                width: 100,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              filteredCourses[index],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                // New Container added here
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    // Navigate to the target page here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudyMaterials(), // Replace TargetPage with the actual page you want to navigate to
                      ),
                    );
                  },

                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
                      crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Image.asset(
                            "images/Study/study.png", // Use a default or static image
                            height: 100,
                            width: 100,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Study materials for the Faculty of Computers, Information and Artificial Intelligence",
                            textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      )
          : _pages[_selectedIndex],
      backgroundColor: Color(0xFFC5CAE9),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        iconSize: 32,
        selectedItemColor: Color(0xFF674AEF),
        selectedFontSize: 18,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "Courses"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          BottomNavigationBarItem(icon: Icon(Icons.today_outlined), label: "ToDoList"),
        ],
      ),
    );
  }
}
