import 'package:education_app/screens/Study/Levels/study_level1.dart';
import 'package:education_app/screens/Study/Levels/study_level2.dart';
import 'package:education_app/screens/Study/Levels/study_level3.dart';
import 'package:education_app/screens/Study/Levels/study_level4.dart';
import 'package:flutter/material.dart';

class StudyMaterials extends StatefulWidget {
  const StudyMaterials({super.key});

  @override
  State<StudyMaterials> createState() => _StudyMaterialsState();
}

class _StudyMaterialsState extends State<StudyMaterials> {
  Map<String, Map<String, Map<String, dynamic>>> studyMaterials = {
    'Level 1': {
      'Semester 1': {
        'Materials': {
          'Math 0': {
            'title': 'Math 0',
            'description': 'Basic mathematics concepts for beginners.',
            'videos': [
              {'name': 'matrix operations ', 'path': 'https://www.youtube.com/watch?v=Y074b0xjaao&list=PLZyQU-WOzZF2XrIVWIYo3GFiRStKzkK0J', 'description': ' Matrix math | matrix operations.'},
              {'name': 'matrix operations 2', 'path': 'https://www.youtube.com/watch?v=YjkIDa6OtkE&list=PLZyQU-WOzZF2XrIVWIYo3GFiRStKzkK0J&index=2', 'description': '2 Matrix math | matrix operations.'},
              {'name': 'matrix multiplication', 'path': 'https://www.youtube.com/watch?v=gmY9_X7eZck&list=PLZyQU-WOzZF2XrIVWIYo3GFiRStKzkK0J&index=3', 'description': 'Matrix math | matrix multiplication .'},
              {'name': 'Matrix transpose ', 'path': 'https://www.youtube.com/watch?v=8jqzQ5-OxYA&list=PLZyQU-WOzZF2XrIVWIYo3GFiRStKzkK0J&index=4', 'description': '4 Matrix transpose | المصفوفات | مدور المصفوفة'},
              {'name': 'Matrix types', 'path': 'https://www.youtube.com/watch?v=gXQNEPRHi0E&list=PLZyQU-WOzZF2XrIVWIYo3GFiRStKzkK0J&index=5', 'description': '5 Matrix types | special matrices | المصفوفات | انواع المصفوفات | linear algebra'},
              {'name': 'symmetric matrix | skew symmetric |', 'path': 'https://www.youtube.com/watch?v=-gBnXccklI0&list=PLZyQU-WOzZF2XrIVWIYo3GFiRStKzkK0J&index=6', 'description': '6 symmetric matrix | skew symmetric | orthogonal matrix | جبر خطى'},
              {'name': 'matrix determinant | diagonal expansion method |', 'path': 'https://www.youtube.com/watch?v=ap1av4I1oak&list=PLZyQU-WOzZF2XrIVWIYo3GFiRStKzkK0J&index=7', 'description': '7 matrix determinant | diagonal expansion method | المحددات جبر خطى'},
              {'name': 'minor and cofactor matrix determinant', 'path': 'https://www.youtube.com/watch?v=VrTxCdR3aaU&list=PLZyQU-WOzZF2XrIVWIYo3GFiRStKzkK0J&index=8', 'description': '8 minor and cofactor matrix determinant | matrix minor | matrix cofactor الجبر الخطى'},
              {'name': 'determinants | matrix determinant', 'path': 'https://www.youtube.com/watch?v=xm-azHUsisU&list=PLZyQU-WOzZF2XrIVWIYo3GFiRStKzkK0J&index=9', 'description': '9 determinants | matrix determinant محدد المصفوفة | المحددات | الجبر الخطى'},
              {'name': 'determinants | determinant properties ', 'path': 'https://www.youtube.com/watch?v=DKtJxS9hz98&list=PLZyQU-WOzZF2XrIVWIYo3GFiRStKzkK0J&index=10', 'description': '10 determinants | determinant properties خواص المحددات الجبر الخطى'},
              {'name': 'matrix inverse | inverse of matrices |', 'path': 'https://www.youtube.com/watch?v=JmksJDShluQ&list=PLZyQU-WOzZF2XrIVWIYo3GFiRStKzkK0J&index=11', 'description': '11 matrix inverse | inverse of matrices | معكوس المصفوفة | جبر خطى'},
              {'name': 'matrix inverse properties | inverse of matrices | ', 'path': 'https://www.youtube.com/watch?v=Sdx8LsM6MMI&list=PLZyQU-WOzZF2XrIVWIYo3GFiRStKzkK0J&index=13', 'description': '12 matrix inverse properties | inverse of matrices | خصائص معكوس المصفوفة'},
              {'name': 'matrix inverse 3*3 | inverse of matrices |', 'path': 'https://www.youtube.com/watch?v=2gpcHBygcBs&list=PLZyQU-WOzZF2XrIVWIYo3GFiRStKzkK0J&index=12', 'description': '13 matrix inverse 3*3 | inverse of matrices | معكوس المصفوفة'},
            ],
            'books': [
              {'title': 'Mathematics-0', 'path': 'https://mrcet.com/downloads/digital_notes/HS/Mathematics-I.pdf'},
              {'title': 'Matrix algebra for beginners', 'path': 'https://vcp.med.harvard.edu/papers/matrices-1.pdf'},
            ],
          },
          'Math 1': {
            'title': 'Math 1',
            'description': 'Advanced algebra and functions.',
            'videos': [
              {'name': 'Mathematics | Basic rules', 'path': 'https://www.youtube.com/watch?v=K4PSaQ_LCNQ&list=PLZEjCjHzGS_a5qUPC6upncagEJm8bPS1I', 'description': '#1 Mathematics | Basic rules'},
              {'name': ' | Ch.1 ( Part 1 )', 'path': 'https://www.youtube.com/watch?v=dX5kxD5vNk0&list=PLZEjCjHzGS_a5qUPC6upncagEJm8bPS1I&index=2', 'description': '#2 Math.1 for Computer Science | Ch.1 ( Part 1 )'},
              {'name': ' | Ch.1 ( Part 2 )', 'path': 'https://www.youtube.com/watch?v=aiACBXY-opk&list=PLZEjCjHzGS_a5qUPC6upncagEJm8bPS1I&index=3', 'description': '#3 Math.1 for Computer Science | Ch.1 ( Part 2 )'},
              {'name': ' | Revision on Ch.1', 'path': 'https://www.youtube.com/watch?v=DczvR3Wv1rE&list=PLZEjCjHzGS_a5qUPC6upncagEJm8bPS1I&index=4', 'description': '#4 Math.1 for Copmuter Science | Revision on Ch.1'},
              {'name': ' | Ch.2 ( Part 1 )', 'path': 'https://www.youtube.com/watch?v=lJljn57M00M&list=PLZEjCjHzGS_a5qUPC6upncagEJm8bPS1I&index=5', 'description': '#5 Math.1 for Computer Science | Ch.2 ( Part 1 )'},
              {'name': ' | Ch.2 ( Part 2 )', 'path': 'https://www.youtube.com/watch?v=ATyRs09EzAw&list=PLZEjCjHzGS_a5qUPC6upncagEJm8bPS1I&index=6', 'description': '#6 Math.1 for computer science | Ch.2 ( Part 2 )'},
              {'name': ' | Ch.2 ( Part 3 )', 'path': 'https://www.youtube.com/watch?v=RbQ6Em9hvzM&list=PLZEjCjHzGS_a5qUPC6upncagEJm8bPS1I&index=7', 'description': '#7 Math.1 for computer science | Ch.2 ( Part 3 )'},
              {'name': ' | Revision on Ch.2', 'path': 'https://www.youtube.com/watch?v=1XVjuqfIjgg&list=PLZEjCjHzGS_a5qUPC6upncagEJm8bPS1I&index=8', 'description': '#8 Math.1 for Copmuter Science | Revision on Ch.2'},
              {'name': ' | Ch.3 ( Integration )', 'path': 'https://www.youtube.com/watch?v=o53VVj8qqoo&list=PLZEjCjHzGS_a5qUPC6upncagEJm8bPS1I&index=9', 'description': '#9 Math.1 for Computer Science | Ch.3 ( Integration )'},
            ],
            'books': [
              {'title': 'Math Advanced  Book', 'path': 'https://textbooks.tommo.team/Maths%20Year%201%20Pure.pdf'},
            ],
          },
          'Introduction to Programming': {
            'title': 'Introduction to Programming',
            'description': 'Basic programming concepts and first steps in coding.',
            'videos': [
              {'name': '1 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=XDuWyYxksXU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS', 'description': 'Fundamentals Of Programming With C++ #001 - Important Introduction About The Course'},
              {'name': '2 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=jOUb09iiO20&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=2', 'description': 'Fundamentals Of Programming With C++ #002 - Why C++ Language'},
              {'name': '3 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=R-Hu5rdn-vc&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=3', 'description': 'Fundamentals Of Programming With C++ #003 - Install VSC Editor, Compiler And Debugger'},
              {'name': '4 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=RWtT07Id-n4&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=4', 'description': 'Fundamentals Of Programming With C++ #004 - Install Visual Studio And Answer Questions'},
              {'name': '5 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=FVV4kTy0dJg&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=5', 'description': 'Fundamentals Of Programming With C++ #005 - How The C++ Works'},
              {'name': '6 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=1K1sET8dDrI&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=6', 'description': 'Fundamentals Of Programming With C++ #006 - Preprocessing, Compiling And Linking'},
              {'name': '7 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=NeHu899_uYA&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=7', 'description': 'Fundamentals Of Programming With C++ #007 - C++ Language Syntax'},
              {'name': '8 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=6UoFcvARKI4&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=8', 'description': 'Fundamentals Of Programming With C++ #008 - Comments And Use Cases'},
              {'name': '9 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=R2zqj_52WwU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=9', 'description': 'Fundamentals Of Programming With C++ #009 - Variables Basic Knowledge'},
              {'name': '10 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=A6B4tlaPapo&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=10', 'description': 'Fundamentals Of Programming With C++ #010 - Variables Naming Rules And Best Practices'},
              {'name': '11 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=J_vnlD5Ca-U&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=11', 'description': 'Fundamentals Of Programming With C++ #011 - Variables Advanced Knowledge'},
              {'name': '12 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=HHl6YF6GUhw&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=12', 'description': 'Fundamentals Of Programming With C++ #012 - Variables Scope'},
              {'name': '13 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=zBhT544Xy0o&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=13', 'description': 'Fundamentals Of Programming With C++ #013 - Variables - Constant Variable'},
              {'name': '14 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=cS0tbixHmdI&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=14', 'description': 'Fundamentals Of Programming With C++ #014 - Calculate Your Age Application'},
              {'name': '15 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=7hM-MBheZ-w&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=15', 'description': 'Fundamentals Of Programming With C++ #015 - Escape Sequences Characters'},
              {'name': '16 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=BibCqAo5ZsQ&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=16', 'description': 'Fundamentals Of Programming With C++ #016 - Data Types - What Is Data ?'},
              {'name': '17 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=MrwqesK64aU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=17', 'description': 'Fundamentals Of Programming With C++ #017 - Data Types, Sizes And Memory'},
              {'name': '18 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=739Wvc6XqDM&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=18', 'description': 'Fundamentals Of Programming With C++ #018 - Data Types - Integer'},
              {'name': '19 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=8efyLVOfd4E&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=19', 'description': 'Fundamentals Of Programming With C++ #019 - Data Types - Float And Double'},
              {'name': '21 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=rqXv-mKqw5Y&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=21', 'description': 'Fundamentals Of Programming With C++ #021 - Data Types - Bool And Void'},
              {'name': '22 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=ZX2DLrnCR3w&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=22', 'description': 'Fundamentals Of Programming With C++ #022 - Data Types - Modifiers And Type Alias'},
              {'name': '23 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=N68m5IxR_zw&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=23', 'description': 'Fundamentals Of Programming With C++ #023 - Data Types - Type Conversion'},
              {'name': '24 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=AQyni1r43T0&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=24', 'description': 'Fundamentals Of Programming With C++ #024 - Operators - Arithmetic Operators'},
              {'name': '25 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=nCO0KZ67b1Q&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=25', 'description': 'Fundamentals Of Programming With C++ #025 - Operators - Assignment Operators'},
              {'name': '26 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=RWVrMQpvVxU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=26', 'description': 'Fundamentals Of Programming With C++ #026 - Operators - Increment And Decrement'},
              {'name': '27 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=xpznDlbgQPM&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=27', 'description': 'Fundamentals Of Programming With C++ #027 - Operators - Comparison Operators'},
              {'name': '28 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=41v0w8BjJms&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=28', 'description': 'Fundamentals Of Programming With C++ #028 - Operators - Logical Operators'},
              {'name': '29 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=e0Gz1_ceuMU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=29', 'description': 'Fundamentals Of Programming With C++ #029 - Operators - Precedence'},
              {'name': '30 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=QmUR0ZIrXQA&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=30', 'description': 'Fundamentals Of Programming With C++ #030 - Control Flow - If Condition Introduction'},
              {'name': '31 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=l67qWVYe-xo&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=31', 'description': 'Fundamentals Of Programming With C++ #031 - Control Flow - If, Else If, Else'},
              {'name': '32 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=Ps0xSAXmULA&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=32', 'description': 'Fundamentals Of Programming With C++ #032 - Control Flow - Nested If Conditions'},
              {'name': '33 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=Ang11UuVE30&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=33', 'description': 'Fundamentals Of Programming With C++ #033 - Control Flow - Ternary Conditional Operator'},
              {'name': '34 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=8ptGpQ_2Np8&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=34', 'description': 'Fundamentals Of Programming With C++ #034 - Control Flow - Nested Ternary Operator'},
              {'name': '35 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=KWRFfCToxiY&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=35', 'description': 'Fundamentals Of Programming With C++ #035 - Condition Trainings - Create Four'},
              {'name': '36 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=OK1uu-axN0E&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=36', 'description': 'Fundamentals Of Programming With C++ #036 - Control Flow - Switch Case'},
              {'name': '37 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=w8WnxLZmctg&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=37', 'description': 'Fundamentals Of Programming With C++ #037 - Switch Training - Create Three Application'},
              {'name': '38 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=NWP1cTeDFVY&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=38', 'description': 'Fundamentals Of Programming With C++ #038 - Array - What Is Array ?'},
              {'name': '39 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=4DkdiXp5rYw&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=39', 'description': 'Fundamentals Of Programming With C++ #039 - Array - Access Elements & Memory Location'},
              {'name': '40 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=4v5hDgUDK9Q&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=40', 'description': 'Fundamentals Of Programming With C++ #040 - Array - Add And Update Elements'},
              {'name': '41 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=2pG43LVr_Sw&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=41', 'description': 'Fundamentals Of Programming With C++ #041 - Array - Two Dimensional Array'},
              {'name': '42 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=dNCryC9CzQQ&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=42', 'description': 'Fundamentals Of Programming With C++ #042 - Array - Class Array'},
              {'name': '43 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=lylQR-hFV-M&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=43', 'description': 'Fundamentals Of Programming With C++ #043 - Array - Methods Discussions'},
              {'name': '44 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=Ne7RthIdaok&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=44', 'description': 'Fundamentals Of Programming With C++ #044 - Array Trainings - Guess The Number Game'},
              {'name': '45 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=oyYC2dOekeU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=45', 'description': 'Fundamentals Of Programming With C++ #045 - String - What Is A String'},
              {'name': '46 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=PJeNjjQcrG8&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=46', 'description': 'Fundamentals Of Programming With C++ #046 - String - Concatenating'},
              {'name': '47 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=_eYTdzypBIY&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=47', 'description': 'Fundamentals Of Programming With C++ #047 - Loop With For'},
              {'name': '48 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=p0pCO7gPfmQ&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=48', 'description': 'Fundamentals Of Programming With C++ #048 - Loop With For - Advanced Syntax'},
              {'name': '49 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=DoY-G3Fwy4g&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=49', 'description': 'Fundamentals Of Programming With C++ #020 - Data Types - Char And ASCII'},
              {'name': '50 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=ykpDu3swciM&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=50', 'description': 'Fundamentals Of Programming With C++ #050 - Loop With For - Nested Loop'},
              {'name': '51 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=pbu11F6X9Yg&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=51', 'description': 'Fundamentals Of Programming With C++ #051 - Loop With While'},
              {'name': '52 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=3ESx17kVUKo&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=52', 'description': 'Fundamentals Of Programming With C++ #052 - Loop With Do While'},
              {'name': '53 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=5rtyV-WOIpA&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=53', 'description': 'Fundamentals Of Programming With C++ #053 - Loop - Break, Continue'},
              {'name': '54 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=q2BVplB0RgI&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=54', 'description': 'Fundamentals Of Programming With C++ #054 - Loop Training Create Three Apps'},
              {'name': '55 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=Gkg8NmfUCjg&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=55', 'description': 'Fundamentals Of Programming With C++ #055 - Function - Introduction'},
              {'name': '56 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=MBvixzJw2sQ&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=56', 'description': 'Fundamentals Of Programming With C++ #056 - Function With Parameter'},
              {'name': '57 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=wOBMuQUlKNY&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=57', 'description': 'Fundamentals Of Programming With C++ #057 - Function With Parameter Training'},
              {'name': '58 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=qBojueEZxjs&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=58', 'description': 'Fundamentals Of Programming With C++ #058 - Function Parameter Default Value'},
              {'name': '59 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=kApYul6wN3A&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=59', 'description': 'Fundamentals Of Programming With C++ #059 - Function - Passing Array As'},
              {'name': '60 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=2NPd8KgneBQ&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=60', 'description': 'Fundamentals Of Programming With C++ #060 - Function - Return Statement + Void'},
              {'name': '61 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=ErBDovJ3eTk&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=61', 'description': 'Fundamentals Of Programming With C++ #061 - Function - Forward Declaration'},
              {'name': '62 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=wyFLcNCCaas&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=62', 'description': 'Fundamentals Of Programming With C++ #062 - Built-In Functions - Math Functions'},
              {'name': '63 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=AU_wSvenbI8&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=63', 'description': 'Fundamentals Of Programming With C++ #063 - Built-In Functions - Training - Create'},
              {'name': '64 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=bpXRvo4IH-0&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=64', 'description': 'Fundamentals Of Programming With C++ #064 - Built-In Functions - Training - Create 3 Apps'},
              {'name': '65 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=I_AzDYyhlMU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=65', 'description': 'Fundamentals Of Programming With C++ #065 - Function Overloading'},
              {'name': '66 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=djgs6PnNl2w&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=66', 'description': 'Fundamentals Of Programming With C++ #066 - Function Recursion'},
              {'name': '67 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=55MRxgVOkMo&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=67', 'description': 'Fundamentals Of Programming With C++ #067 - Vector - What Is Vector'},
              {'name': '68 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=OIJsJrNJKUc&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=68', 'description': 'Fundamentals Of Programming With C++ #068 - Vector Versus Array'},
              {'name': '69 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=QSmQylbugAg&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=69', 'description': 'Fundamentals Of Programming With C++ #069 - Vector - Access, Add, Update And Delete'},
              {'name': '70 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=JrPhJtFuwqU&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=70', 'description': 'Fundamentals Of Programming With C++ #070 - Vector - Functions'},
              {'name': '71 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=_RE-naCqphE&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=71', 'description': 'Fundamentals Of Programming With C++ #071 - Vector - Iterator And Why To Use'},
              {'name': '72 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=DgJqgq5Is0Y&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=72', 'description': 'Fundamentals Of Programming With C++ #072 - Vector - Traversing With Iterator'},
              {'name': '73 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=RoKGZi4ArFo&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=73', 'description': 'Fundamentals Of Programming With C++ #073 - Vector - Loop With Iterator And Ranged Loop'},
              {'name': '74 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=Qm14ePexV10&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=74', 'description': 'Fundamentals Of Programming With C++ #074 - Vector - Use Iterator To Count, Sort & Reverse'},
              {'name': '75 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=s6sb23dglxs&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=75', 'description': 'Fundamentals Of Programming With C++ #075 - Pointers - What Are Pointers ?'},
              {'name': '76 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=9ALw6qoCvk8&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=76', 'description': 'Fundamentals Of Programming With C++ #076 - Pointers - Pointing To Array'},
              {'name': '77 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=9ZE8HAHyp4I&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=77', 'description': 'Fundamentals Of Programming With C++ #077 - Pointers - Void And Wild Pointer And Null'},
              {'name': '78 Fundamentals Of Programming With C++', 'path': 'https://www.youtube.com/watch?v=Mlo7_fUG4N0&list=PLDoPjvoNmBAwy-rS6WKudwVeb_x63EzgS&index=78', 'description': 'Fundamentals Of Programming With C++ #078 - Pointers - Arithmetic And Array'},
            ],
            'books': [
              {'title': 'A Complete Guide toProgramming in C++', 'path': 'https://www.idpoisson.fr/volkov/C++.pdf'},
              {'title': 'Beginning C++ Programming', 'path': 'https://notalentgeek.github.io/note/note/project/project-independent/pi-brp-beginning-c-programming/document/20170807-1504-cet-1-book-and-source-1.pdf'},
            ],
          },
          'Introduction to Computers': {
            'title': 'Introduction to Computers',
            'description': 'Understanding computer architecture and basic components.',
            'videos': [
              {'name': '#1 - Computer Introduction - Chapter 1-1: What is Computer, Hardware, and Software?', 'path': 'https://www.youtube.com/watch?v=yLEqH5qgmbU&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck', 'description': 'What is Computer, Hardware, and Software?'},
              {'name': '#2 - Computer Introduction - Chapter 1-2: Basic Concepts In Computer Science?', 'path': 'https://www.youtube.com/watch?v=DlgWPn6cqAo&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=2', 'description': 'Chapter 1-2: Basic Concepts In Computer Science'},
              {'name': '#3 - Computer Introduction - Chapter 1-3: Basic Concepts In Computer Science?', 'path': 'https://www.youtube.com/watch?v=vOYyjAz9mXA&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=3', 'description': 'Chapter 1-3: Basic Concepts In Computer Science'},
              {'name': '#4 - Computer Introduction - Chapter 1-4: Solving Questions For English Section', 'path': 'https://www.youtube.com/watch?v=sUkuBTtqQfU&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=4', 'description': 'Chapter 1-4: Solving Questions For English Section'},
              {'name': '#5 - Computer Introduction - Chapter 1-5: حل أسئلة الفصل الأول', 'path': 'https://www.youtube.com/watch?v=IxKoCrEYmPs&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=5', 'description': 'Chapter 1-5: حل أسئلة الفصل الأول'},
              {'name': '#6 - Computer Introduction - Chapter 4-1: Numerical Systems', 'path': 'https://www.youtube.com/watch?v=zZGVKXHqce4&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=6', 'description': 'Chapter 4-1: Numerical Systems'},
              {'name': '#7 - Computer Introduction - Chapter 4-2: Conversion From All Systems To DECIMAL System', 'path': 'https://www.youtube.com/watch?v=I-HgZ0Rs_hQ&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=7', 'description': 'Chapter 4-2: Conversion From All Systems To DECIMAL System'},
              {'name': '#8 - Computer Introduction - Chapter 4-3: Convert From DECIMAL To All Systems', 'path': 'https://www.youtube.com/watch?v=fe5aM2FMlw8&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=8', 'description': 'Chapter 4-3: Convert From DECIMAL To All Systems'},
              {'name': '#9 - Computer Introduction - Chapter 4-3: Conversion From DECIMAL To All Systems [Integer and Float]', 'path': 'https://www.youtube.com/watch?v=WCckLc3Gtto&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=9', 'description': 'Chapter 4-3: Conversion From DECIMAL To All Systems [Integer and Float]'},
              {'name': '#10 - Computer Introduction - Chapter 4-4: Conversion From Octal & Hexadecimal To BINARY', 'path': 'https://www.youtube.com/watch?v=K34kewPtrmU&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=10', 'description': 'Chapter 4-4: Conversion From Octal & Hexadecimal To BINARY'},
              {'name': '#11 - Computer Introduction - Chapter 4-5: Conversion From BINARY To Octal & Hexadecimal', 'path': 'https://www.youtube.com/watch?v=odL_PRDYxx8&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=11', 'description': 'Chapter 4-5: Conversion From BINARY To Octal & Hexadecimal'},
              {'name': '#12 - Computer Introduction - Chapter 4-6: Addition in Numerical Systems', 'path': 'https://www.youtube.com/watch?v=xK8-nNanBdw&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=12', 'description': 'Chapter 4-6: Addition in Numerical Systems'},
              {'name': '#13 - Computer Introduction - Chapter 4-7: Subtraction in Numerical Systems', 'path': 'https://www.youtube.com/watch?v=TOO89N1jEmk&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=13', 'description': 'Chapter 4-7: Subtraction in Numerical Systems'},
              {'name': '#14 - Computer Introduction - Chapter 4-8: Questions Solutions Part 1', 'path': 'https://www.youtube.com/watch?v=_wcqYZWyUOg&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=14', 'description': 'Chapter 4-8: Questions Solutions Part 1'},
              {'name': '#15 - Computer Introduction - Chapter 4-8: Questions Solutions Part 2', 'path': 'https://www.youtube.com/watch?v=foWAfLtWTBA&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=15', 'description': 'Chapter 4-8: Questions Solutions Part 2'},
              {'name': '#16 - Computer Introduction - Chapter 2: Flowcharts', 'path': 'https://www.youtube.com/watch?v=Seao2NUVz5k&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=16', 'description': 'Chapter 2: Flowcharts'},
              {'name': 'Computer Introduction - Chapter 4: Convert Between Systems Using Calculator', 'path': 'https://www.youtube.com/watch?v=yEI_wW4WkpI&list=PLltPpA0o0tmyDULlYJGL5LVzI3pV0ETck&index=17', 'description': 'Chapter 4: Convert Between Systems Using Calculator'},
            ],
            'books': [
              {'title': 'INTRODUCTION TO COMPUTERS', 'path': 'https://cag.gov.in/uploads/media/introduction-to-computers-by-peter-norton-6th-ed-20210326115622.pdf'},
              {'title': 'computer fundamentals', 'path': 'https://gpnanakpur.ac.in/wp-content/uploads/2019/04/computerfundamentals-e-notes.pdf'},
            ],
          },
          'Physics': {
            'title': 'Physics',
            'description': 'Fundamentals of physics and basic mechanics.',
            'videos': [
              {'name': '#1 Physics for Computer Science | Ch.1 ( Measurements )', 'path': 'https://www.youtube.com/watch?v=hnds6pTG2rs&list=PLZEjCjHzGS_YM2s7B5RQxr4i6vTLXd5Ag', 'description': '| Ch.1 ( Measurements )'},
              {'name': '#2 Physics for Computer Science | Ch.2 ( Motion in one dimension )', 'path': 'https://www.youtube.com/watch?v=VuHGhsIZSXU&list=PLZEjCjHzGS_YM2s7B5RQxr4i6vTLXd5Ag&index=2', 'description': '| Ch.2 ( Motion in one dimension )'},
              {'name': '#3 Physics for Computer Science | Ch.3 ( Vectors )', 'path': 'https://www.youtube.com/watch?v=hUDO1wVr3T4&list=PLZEjCjHzGS_YM2s7B5RQxr4i6vTLXd5Ag&index=3', 'description': '| Ch.3 ( Vectors )'},
              {'name': '#4 Physics for Computer Science | Ch.4 ( Motion in two dimensions )', 'path': 'https://www.youtube.com/watch?v=0fXyhso1zo0&list=PLZEjCjHzGS_YM2s7B5RQxr4i6vTLXd5Ag&index=4', 'description': '| Ch.4 ( Motion in two dimensions )'},
              {'name': '#5 Physics for Computer Science | Ch.5 ( The laws of motion )', 'path': 'https://www.youtube.com/watch?v=tXyyLeTwnt0&list=PLZEjCjHzGS_YM2s7B5RQxr4i6vTLXd5Ag&index=5', 'description': '| Ch.5 ( The laws of motion )'},
              {'name': '#6 Physics for Computer Science | Ch.6 ( Energy & Work )', 'path': 'https://www.youtube.com/watch?v=_fkJfs--k7k&list=PLZEjCjHzGS_YM2s7B5RQxr4i6vTLXd5Ag&index=6', 'description': '| Ch.6 ( Energy & Work )'},
              {'name': '#7 Physics for Computer Science | Ch.10 ( Law of Gravity )', 'path': 'https://www.youtube.com/watch?v=uZuJjxWPyLs&list=PLZEjCjHzGS_YM2s7B5RQxr4i6vTLXd5Ag&index=7', 'description': '| Ch.10 ( Law of Gravity )'},
              {'name': '#8 Graph of pendulum Experiment | Practical physics exam', 'path': 'https://www.youtube.com/watch?v=vZg816Z2tAo&list=PLZEjCjHzGS_YM2s7B5RQxr4i6vTLXd5Ag&index=8', 'description': '| Practical physics exam'},
              {'name': '#9 Hooke "s Law Experiment | for Practical physics exam', 'path': 'https://www.youtube.com/watch?v=eI7o6xZATxw&list=PLZEjCjHzGS_YM2s7B5RQxr4i6vTLXd5Ag&index=9', 'description': '| Practical physics exam2'},
              {'name': '#10 Final Revision | Physics for Computer Science', 'path': 'https://www.youtube.com/watch?v=7LyiuOhZvlM&list=PLZEjCjHzGS_YM2s7B5RQxr4i6vTLXd5Ag&index=10', 'description': '| Final Revision | '},
            ],
            'books': [
              {'title': 'Physics', 'path': 'https://cin.ufpe.br/~gcs/Springer%20-%20Physics%20for%20Computer%20Science%20Students.pdfpath_to_math_basics_book'},
              {'title': 'Physics2', 'path': 'https://www.scribd.com/document/626092701/Resnick-Halliday-Krane-Vol-2'},
            ],
          },
        }
      },
      'Semester 2': {
        'Materials': {
          'Math 2': {
            'title': 'Math 2',
            'description': 'Calculus and differential equations.',
            'videos': [
              {'name': '#1 Basic rules of integration', 'path': 'https://www.youtube.com/watch?v=qW_08w4cIWs&list=PLZEjCjHzGS_bzIFpd98foLw0IYugbVDMj&index=1', 'description': ' #1 Math.2 for Computer Science | Basic rules of integration'},
              {'name': '#2 Examples on Basic rules of integration', 'path': 'https://www.youtube.com/watch?v=4xJ_EBQOZfU&list=PLZEjCjHzGS_bzIFpd98foLw0IYugbVDMj&index=2', 'description': ' #2 Math.2 for Computer Science | Examples on Basic rules of integration'},
              {'name': '#3 Rules of Integration for Trigonometric Functions', 'path': 'https://www.youtube.com/watch?v=kgeEiNtuuS0&list=PLZEjCjHzGS_bzIFpd98foLw0IYugbVDMj&index=3', 'description': ' #3 Math.2 for Computer Science | Rules of Integration for Trigonometric Functions'},
              {'name': '#4 Integration by Substitution', 'path': 'https://www.youtube.com/watch?v=zAAegHI4pFg&list=PLZEjCjHzGS_bzIFpd98foLw0IYugbVDMj&index=4', 'description': ' #4 Math.2 for Computer Science | Integration by Substitution'},
              {'name': '#5 Integration by parts', 'path': 'https://www.youtube.com/watch?v=GBRdiTr3_nY&list=PLZEjCjHzGS_bzIFpd98foLw0IYugbVDMj&index=5', 'description': ' #5 Math.2 for Computer Science | Integration by parts'},
              {'name': '#6 Integration by partial fraction part 1 (proper)', 'path': 'https://www.youtube.com/watch?v=frJn9_2UeWs&list=PLZEjCjHzGS_bzIFpd98foLw0IYugbVDMj&index=6', 'description': ' #6 Math.2 for Computer Science | Integration by partial fraction part 1 (proper)'},
              {'name': '#7 Integration by partial fraction part 2 ( improper )', 'path': 'https://www.youtube.com/watch?v=9ukERSFZj-A&list=PLZEjCjHzGS_bzIFpd98foLw0IYugbVDMj&index=7', 'description': ' #7 Math.2 for Computer Science | Integration by partial fraction part 2 ( improper )'},
              {'name': '#8 Strategy for Evaluating (The 4 Cases)', 'path': 'https://www.youtube.com/watch?v=83dyLTb0xF0&list=PLZEjCjHzGS_bzIFpd98foLw0IYugbVDMj&index=8', 'description': ' #8 Math.2 for Computer Science | Strategy for Evaluating (The 4 Cases)'},
              {'name': '#9 Separable Differential equations (Ch.2)', 'path': 'https://www.youtube.com/watch?v=wjMvZJ_-CHA&list=PLZEjCjHzGS_bzIFpd98foLw0IYugbVDMj&index=9', 'description': ' #9 Math.2 for Computer Science | Separable Differential equations (Ch.2)'},
              {'name': '#10 Homogeneous Differential equations (Ch.2)', 'path': 'https://www.youtube.com/watch?v=qW_08w4cIWs&list=PLZEjCjHzGS_bzIFpd98foLw0IYugbVDMj&index=1', 'description': ' #10 Math.2 for Computer Science | Homogeneous Differential equations (Ch.2)'},
              {'name': '#10 Exact Differential equations (Ch.2)', 'path': 'https://www.youtube.com/watch?v=CtOSw2a271M&list=PLZEjCjHzGS_bzIFpd98foLw0IYugbVDMj&index=11', 'description': ' #11 Math.2 for Computer Science | Exact Differential equations (Ch.2)'},
            ],
            'books': [
              {'title': 'Integration by using Patial Fractions.', 'path': ''},
              {'title': 'Intro to Math', 'path': 'path_to_intro_to_math_book'},
            ],
          },
          'Advanced Programming': {
            'title': 'Advanced Programming',
            'description': 'Java Object-oriented programming.',
            'videos': [
              {'name': '#00 Get Started - برمجة 2', 'path': 'https://www.youtube.com/watch?v=M3Na5luSx50&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk', 'description': ' 00 - Object Oriented Programming with Java - Get Started - برمجة 2'},
              {'name': '#01 What IS Object Oriented Programming ? - Part 1 - برمجة 2', 'path': 'https://www.youtube.com/watch?v=IzjJqzX4hx0&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=2', 'description': ' 01 - Java - What IS Object Oriented Programming ? - Part 1 - برمجة 2'},
              {'name': '#02 What IS Object Oriented Programming ? - Part 2 - برمجة 2', 'path': 'https://www.youtube.com/watch?v=IiyO7kFHFcI&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=3', 'description': ' 02 - Java - What IS Object Oriented Programming ? - Part 2 - برمجة 2'},
              {'name': '#03 What IS Object Oriented Programming ? - Part 3 - برمجة 2', 'path': 'https://www.youtube.com/watch?v=itxieu37gAk&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=4', 'description': ' 03 - Java - What IS Object Oriented Programming ? - Part 3 - برمجة 2'},
              {'name': '#04 - Create Your First Class in Java - 1', 'path': 'https://www.youtube.com/watch?v=8Tx3ZkyutI4&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=5', 'description': ' 04 - Create Your First Class in Java - Part 1 - برمجة 2'},
              {'name': '#05 - Create Your First Class in Java - 2', 'path': 'https://www.youtube.com/watch?v=qB3UP3yhdJA&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=6', 'description': ' 05 - Create Your First Class in Java - Part 2 - برمجة 2'},
              {'name': '#06 - Create Your First Class in Java - 3', 'path': 'https://www.youtube.com/watch?v=Rrx_5jn1BWk&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=7', 'description': ' 06 - Create Your First Class in Java - Part 3 - برمجة 2'},
              {'name': '#07 - Create Your First Class in Java - 4', 'path': 'https://www.youtube.com/watch?v=mmg-Tgpx19k&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=8', 'description': ' 07 - Create Your First Class in Java - Part 4 - برمجة 2'},
              {'name': '#08 Constructors and constructor overloading - 1', 'path': 'https://www.youtube.com/watch?v=lhfX8FPG7ZE&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=9', 'description': ' 08 - Constructors and constructor overloading in Java - Part 1 - برمجة 2'},
              {'name': '#09 Constructors and constructor overloading - 2', 'path': 'https://www.youtube.com/watch?v=WS1uq6g183E&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=10', 'description': ' 09 - Constructors and constructor overloading in Java - Part 2 - برمجة 2'},
              {'name': '#10 Static methods and fields in Java -', 'path': 'https://www.youtube.com/watch?v=FMzuhNde4Os&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=11', 'description': ' 10 - Static methods and fields in Java - برمجة 2'},
              {'name': '#11 - Passing an object to a method in Java -', 'path': 'https://www.youtube.com/watch?v=k2tHU_cegu4&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=12', 'description': ' 11 - Passing an object to a method in Java - برمجة 2'},
              {'name': '#12 - Comparing and Copying objects in Java -', 'path': 'https://www.youtube.com/watch?v=jo1SGSbgdRo&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=13', 'description': ' 12 - Comparing and Copying objects in Java - برمجة 2'},
              {'name': '#13 - Inheritance and Polymorphism In Java - Part 1 -', 'path': 'https://www.youtube.com/watch?v=IMBkkfo7z0s&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=14', 'description': ' 13 - Inheritance and Polymorphism In Java - Part 1 - برمجة 2'},
              {'name': '#14 - Inheritance and Polymorphism In Java - Part 2 -', 'path': 'https://www.youtube.com/watch?v=lPvY3jV6MRQ&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=15', 'description': ' 14 - Inheritance and Polymorphism In Java - Part 2 - برمجة 2'},
              {'name': '#15 - Inheritance and Method Overriding in Java -', 'path': 'https://www.youtube.com/watch?v=YTcDkM3FJEo&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=16', 'description': ' 15 - Inheritance and Method Overriding in Java - برمجة 2'},
              {'name': '#16 - Final Methods and Protected Members in Java -', 'path': 'https://www.youtube.com/watch?v=w99Owc11rMU&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=17', 'description': ' 16 - Final Methods and Protected Members in Java - برمجة 2'},
              {'name': '#17 - Abstract class and Abstract Method in Java -', 'path': 'https://www.youtube.com/watch?v=BzhbsAnTX70&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=18', 'description': ' 17 - Abstract class and Abstract Method in Java - برمجة 2'},
              {'name': '#18 - Interfaces in Java -', 'path': 'https://www.youtube.com/watch?v=1rNGO0113Ns&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=19', 'description': ' 18 - Interfaces in Java - برمجة 2'},
              {'name': '#19 - Enumerated Types ( Enum ) in Java -', 'path': 'https://www.youtube.com/watch?v=6RjZP0LV-zY&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=20', 'description': ' 19 - Enumerated Types ( Enum ) in Java - برمجة 2'},
              {'name': '#20 - Exception Handling in Java -', 'path': 'https://www.youtube.com/watch?v=8eRQ3CLsxew&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=21', 'description': ' 20 - Exception Handling in Java - برمجة 2'},
              {'name': '#21 - ArrayList Class in Java -', 'path': 'https://www.youtube.com/watch?v=SV1EdFvhOCw&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=22', 'description': ' 21 - ArrayList Class in Java - برمجة 2'},
              {'name': '#22 - Revision On OOP - Part 1', 'path': 'https://www.youtube.com/watch?v=jv_cnBtv_Dc&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=23', 'description': ' Revision On Object Oriented Programming with java - Part 1'},
              {'name': '#23 - Revision On OOP - Part 2', 'path': 'https://www.youtube.com/watch?v=IysqYCbvC5w&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=24', 'description': ' Revision On Object Oriented Programming with java - Part 2'},
              {'name': '#24 - Revision On OOP - Part 3', 'path': 'https://www.youtube.com/watch?v=FKVyBXWcHRo&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=25', 'description': ' Revision On Object Oriented Programming with java - Part 3'},
              {'name': '#25 - Revision On OOP - Part 4', 'path': 'https://www.youtube.com/watch?v=Hn7wMiTarMs&list=PL1DUmTEdeA6Icttz-O9C3RPRF8R8Px5vk&index=26', 'description': ' Revision On Object Oriented Programming with java - Part 4'},
            ],
            'books': [
              {'title': 'Object-Oriented ProgrammingJava', 'path': 'https://www.ms.sapientia.ro/~manyi/teaching/oop/oop_java.pdf'},
              {'title': 'Object Oriented Programming through JAVA', 'path': 'https://mrcet.com/downloads/digital_notes/CSE/II%20Year/CS/OBJECT%20ORIENTED%20PROGRAMMING%20THROUGH%20JAVA.pdf'},
            ],
          },
          'Electronics': {
            'title': 'Electronics',
            'description': 'Basic concepts of electronics and circuits.',
            'videos': [
              {'name': '#1 Electronics || Chapter 1', 'path': 'https://www.youtube.com/watch?v=eH0IfX5vBi0&list=PLZEjCjHzGS_bJ-siRuqEGGxdwWpWcjIBD', 'description': ' #1 Electronics for Computer Science || Chapter 1'},
              {'name': '#2 Electronics || Chapter 2', 'path': 'https://www.youtube.com/watch?v=5r3fev6OKn4&list=PLZEjCjHzGS_bJ-siRuqEGGxdwWpWcjIBD&index=2', 'description': ' #2 Electronics for Computer Science || Chapter 2'},
              {'name': '#3 Electronics || Chapter 1&2', 'path': 'https://www.youtube.com/watch?v=3QY0e0vkouY&list=PLZEjCjHzGS_bJ-siRuqEGGxdwWpWcjIBD&index=3', 'description': ' #3 Electronics for Computer Science || Chapter 1&2'},
              {'name': '#4 Electronics || Chapter 3 (Node Analysis)', 'path': 'https://www.youtube.com/watch?v=T4IHBFULHs0&list=PLZEjCjHzGS_bJ-siRuqEGGxdwWpWcjIBD&index=4', 'description': ' #4 Electronics for Computer Science || Chapter 3 (Node Analysis)'},
              {'name': '#5 Electronics || Chapter 3 (Mesh Analysis)', 'path': 'https://www.youtube.com/watch?v=ay-8120INCU&list=PLZEjCjHzGS_bJ-siRuqEGGxdwWpWcjIBD&index=5', 'description': ' #5 Electronics for Computer Science || Chapter 3 (Mesh Analysis)'},
              {'name': '#6 Electronics || Chapter 4 (Source Ttransformation)', 'path': 'https://www.youtube.com/watch?v=ohBcpDV6Z20&list=PLZEjCjHzGS_bJ-siRuqEGGxdwWpWcjIBD&index=6', 'description': ' #6 Electronics for Computer Science || Chapter 4 (Source Ttransformation)'},
              {'name': '#7 Electronics || Chapter 4 (Thevenin"s Theorem)', 'path': 'https://www.youtube.com/watch?v=30cdyewLh5Y&list=PLZEjCjHzGS_bJ-siRuqEGGxdwWpWcjIBD&index=7', 'description': ' #7 Electronics For Computer Science || Chapter 4 (Thevenin"s Theorem)'},
              {'name': '#8 Electronics || Chapter 5 (Operational Amplefire)', 'path': 'https://www.youtube.com/watch?v=tQ4olZwRhbw&list=PLZEjCjHzGS_bJ-siRuqEGGxdwWpWcjIBD&index=8', 'description': ' #8 Electronics For Computer Science ll Chapter 5 (Operational Amplefire)'},
              {'name': '#9 Electronics || Diode and its Applications', 'path': 'https://www.youtube.com/watch?v=A0SfCWVAb70&list=PLZEjCjHzGS_bJ-siRuqEGGxdwWpWcjIBD&index=9', 'description': ' #9 Electronics For Computer Science || Diode and its Applications'},
              {'name': '#10 Electronics || Bipolar Junction Transistor (BJT)', 'path': 'https://www.youtube.com/watch?v=4mow_pEe19Q&list=PLZEjCjHzGS_bJ-siRuqEGGxdwWpWcjIBD&index=10', 'description': ' #10 Electronics For Computer science || Bipolar Junction Transistor (BJT)'},
              {'name': '#11 Revision on Electronics (للعملي)', 'path': 'https://www.youtube.com/watch?v=SFOvWNknn7s&list=PLZEjCjHzGS_bJ-siRuqEGGxdwWpWcjIBD&index=11', 'description': ' Revision on Electronics (للعملي)'},

            ],
            'books': [
              {'title': 'Basic electronics', 'path': 'https://www.academia.edu/36466747/Basic_electronics_pdf'},
              {'title': 'ElectronicsFOR DUMmIES', 'path': 'https://www.n5dux.com/ham/files/pdf/Electronics%20for%20Dummies.pdf'},
            ],
          },
          'Statistics and Probability': {
            'title': 'Statistics and Probability',
            'description': 'Introduction to statistical methods and probability theory.',
            'videos': [
              {'name': '#1 Introduction || Probability & Statistics', 'path': 'https://www.youtube.com/watch?v=C9OpL7vdK3s&list=PLZEjCjHzGS_ZOD3C3U6KftCzq9Z2dF5sN&index=1', 'description': ' #1 Introduction to statistics || Probability & Statistics'},
              {'name': '#2 Introduction || Probability & Statistics', 'path': 'https://www.youtube.com/watch?v=UVECAdym9SM&list=PLZEjCjHzGS_ZOD3C3U6KftCzq9Z2dF5sN&index=2', 'description': ' #2 Introduction to statistics || Probability & Statistics'},
              {'name': '#3 Bayes" Theorem.', 'path': 'https://www.youtube.com/watch?v=fTXQRF3NDIw&list=PLZEjCjHzGS_ZOD3C3U6KftCzq9Z2dF5sN&index=3', 'description': ' #3 Bayes" Theorem || Probability & Statistics'},
              {'name': '#4 Discrete Random Variable (Binomial & poisson) Distribution.', 'path': 'https://www.youtube.com/watch?v=Skh7dqUsaQo&list=PLZEjCjHzGS_ZOD3C3U6KftCzq9Z2dF5sN&index=4', 'description': ' #4 Discrete Random Variable (Binomial & poisson) Distribution || Probability & Statistics'},
              {'name': '#5 Continuous Random Variable (Normal Distribution)', 'path': 'https://www.youtube.com/watch?v=iat4I9NuxBE&list=PLZEjCjHzGS_ZOD3C3U6KftCzq9Z2dF5sN&index=5', 'description': ' #5 Continuous Random Variable (Normal Distribution) || Probability & Statistics'},
              {'name': '#6 Sampling Distribution.', 'path': 'https://www.youtube.com/watch?v=5WCfAWcj_I4&list=PLZEjCjHzGS_ZOD3C3U6KftCzq9Z2dF5sN&index=6', 'description': ' #6 Sampling Distribution || Probability & Statistics'},
              {'name': '#7 Tests Of Hypothesis', 'path': 'https://www.youtube.com/watch?v=TJ86dOOl-5w&list=PLZEjCjHzGS_ZOD3C3U6KftCzq9Z2dF5sN&index=7', 'description': ' #7 Tests Of Hypothesis || Probability & Statistics'},
            ],
            'books': [
              {'title': 'Probability and Statistics book 1', 'path': 'https://www.utstat.toronto.edu/mikevans/jeffrosenthal/book.pdf'},
              {'title': 'Probability and Statistics book 2', 'path': 'https://mrcet.com/downloads/digital_notes/CSE/II%20Year/PROBABILITY%20AND%20STATISTICS%20[R20A0024].pdf'},
            ],
          },
        }
      },
    },
    'Level 2': {
      'Semester 3': {
        'Materials': {
          'Math 3': {
            'title': 'Math 3',
            'description': 'Calculus and differential equations.',
            'videos': [
              {'name': ' Differential Equation ( part 1 - yc )', 'path': 'https://www.youtube.com/watch?v=Q0YEhxYzDgA&list=PLZEjCjHzGS_bRy0o6NCRwt4xipWEQSALD', 'description': ' Matrix math | matrix operations.'},
              {'name': 'Math Fundamentals', 'path': 'path_to_video_for_math0_part2', 'description': ' Matrix math | matrix operations.'},
            ],
            'books': [
              {'title': 'Math Basics Book', 'path': 'path_to_math_basics_book'},
              {'title': 'Intro to Math', 'path': 'path_to_intro_to_math_book'},
            ],
          },
          'Data Structure': {
            'title': 'Data Structure',
            'description': 'Object-oriented programming and data structures.',
            'videos': [
              {'name': '00 Object Oriented Programming with C++ - Introduction', 'path': 'https://www.youtube.com/watch?v=6U6WtWG3NrA&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=1&t=1s', 'description': 'Object Oriented Programming with C++ - Introduction'},
              {'name': '01 - C++ - What is object Oriented Programming ?', 'path': 'https://www.youtube.com/watch?v=mYMwYUU6HAs&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=2', 'description': ' What is object Oriented Programming ? - Part 1'},
              {'name': '02 - C++ - What is Object Oriented Programming ? - part 2', 'path': 'https://www.youtube.com/watch?v=AqAyBoy5bcg&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=3', 'description': 'What is Object Oriented Programming ? - part 2'},
              {'name': '03 - C++ - Class and Objects , why we need Classes ?', 'path': 'https://www.youtube.com/watch?v=8CtVnogubxQ&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=4', 'description': 'Class and Objects , why we need Classes ?'},
              {'name': '04 - C++ - Create Your First Class - Part 1', 'path': 'https://www.youtube.com/watch?v=OWoXsjvDPas&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=5', 'description': 'Create Your First Class - Part 1'},
              {'name': '05 - C++ - Create Your First Class - Part 2', 'path': 'https://www.youtube.com/watch?v=oX4krxQisZ0&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=6', 'description': 'Create Your First Class - Part 2'},
              {'name': '06 - C++ - Create Your First Class - Part 3', 'path': 'https://www.youtube.com/watch?v=dIEJ9L2sX04&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=7', 'description': 'Create Your First Class - Part 3'},
              {'name': '07 - C++ - Constructor & Destructor - Part 1', 'path': 'https://www.youtube.com/watch?v=54jjyqtDawA&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=8', 'description': 'Constructor & Destructor - Part 1'},
              {'name': '08 - C++ - Constructor & Destructor - Part 2', 'path': 'https://www.youtube.com/watch?v=jj4A4letbkA&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=9', 'description': 'Constructor & Destructor - Part 2'},
              {'name': '09 - C++ - Method and Constructor Overloading - Part 1', 'path': 'https://www.youtube.com/watch?v=NX8ROdE-TfE&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=10', 'description': 'Method and Constructor Overloading - Part 1'},
              {'name': '10 - C++ - Method and Constructor Overloading - Part 2', 'path': 'https://www.youtube.com/watch?v=ssAkGOXt6tM&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=11', 'description': 'Method and Constructor Overloading - Part 2'},
              {'name': '11 - C++ - The default Copy Constructor', 'path': 'https://www.youtube.com/watch?v=mODdipJl7hs&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=12', 'description': 'The default Copy Constructor'},
              {'name': '12 - C++ - Passing objects To Methods', 'path': 'https://www.youtube.com/watch?v=Y6qBd_eEN-0&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=13', 'description': 'Passing objects To Methods'},
              {'name': '13 - C++ - Static Class Members', 'path': 'https://www.youtube.com/watch?v=kEKLmupmxFU&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=14', 'description': 'Static Class Members'},
              {'name': '14 - C++ - OOP - Operator Overloading', 'path': 'https://www.youtube.com/watch?v=Gd1KamgzKwE&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=15', 'description': 'Operator Overloading'},
              {'name': '15 - C++ - OOP - Inheritance - What Is Inheritance ?', 'path': 'https://www.youtube.com/watch?v=QgcbH4oOuUU&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=16', 'description': 'Inheritance - What Is Inheritance ?'},
              {'name': '16 - C++ - OOP - Inheritance - How Inheritance Is Done in C++ ?', 'path': 'https://www.youtube.com/watch?v=1H9FnhOGsbg&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=17', 'description': 'Inheritance - How Inheritance Is Done in C++ ?'},
              {'name': '17 - C++ - OOP - Inheritance - Calling Base Class Constructors', 'path': 'https://www.youtube.com/watch?v=u-9YNtI97Tg&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=18', 'description': '17 - C++ - OOP - Inheritance - Calling Base Class Constructors'},
              {'name': '18 - C++ - OOP - Inheritance - Function Overriding', 'path': 'https://www.youtube.com/watch?v=4XmmPBhr1cI&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=19', 'description': 'Inheritance - Function Overriding'},
              {'name': '19-  C++ - OOP - Multiple Inheritance', 'path': 'https://www.youtube.com/watch?v=pEkscsIRysU&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=20', 'description': 'Multiple Inheritance'},
              {'name': '20-  C++ - OOP - Polymorphism and virtual Functions', 'path': 'https://www.youtube.com/watch?v=PizCZbMwNBc&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=21', 'description': 'Polymorphism and virtual Functions'},
              {'name': '21 - C++ - OOP - Abstract Class - Final Classifier', 'path': 'https://www.youtube.com/watch?v=UtvrvFAgLCQ&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=22', 'description': 'Abstract Class - Final Classifier'},
              {'name': '22 - C++ - OOP - Friend Function and Friend Class', 'path': 'https://www.youtube.com/watch?v=VhLQZYkLhpg&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=23', 'description': 'Friend Function and Friend Class'},
              {'name': '23 - C++ - Revision on OOP Concepts by Example', 'path': 'https://www.youtube.com/watch?v=xyIvVmDNS6w&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=24', 'description': 'Revision on OOP Concepts by Example'},
              {'name': '24 - C++ - Exception Handling In C++', 'path': 'https://www.youtube.com/watch?v=ri5fB9Vq7Uo&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=25', 'description': '24 - C++ - Exception Handling In C++'},
              {'name': '|Programming with C++| - | Pointers in C++ |', 'path': 'https://www.youtube.com/watch?v=38IG-UToeZ0&list=PL1DUmTEdeA6KLEvIO0NyrkT91BVle8BOU&index=26', 'description': '|Programming with C++| - | Pointers in C++ |'},
              {'name': '01 - | C++ Data Structures | - | why Data Structures ? | - | تراكيب البيانات |', 'path': 'https://www.youtube.com/watch?v=jGP19W5IObA&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt', 'description': '| why Data Structures ? | - | تراكيب البيانات |'},
              {'name': '02 - | C++ Data Structures | - | Static & Dynamic memory Allocation - Part 1| - | تراكيب البيانات |', 'path': 'https://www.youtube.com/watch?v=OlY_Fwfyk6s&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=2', 'description': '| Static & Dynamic memory Allocation - Part 1| - | تراكيب البيانات |'},
              {'name': '03 - | C++ Data Structures | - | Static & Dynamic memory Allocation - Part 2| - | تراكيب البيانات |', 'path': 'https://www.youtube.com/watch?v=XxniWLQEMMo&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=3', 'description': '| Static & Dynamic memory Allocation - Part 2| - | تراكيب البيانات |'},
              {'name': '04 - | C++ Data Structures | - | Basic Data Structures - Classifications | - | تراكيب البيانات |', 'path': 'https://www.youtube.com/watch?v=Ozm_OHViErY&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=4', 'description': '| Basic Data Structures - Classifications | - | تراكيب البيانات |'},
              {'name': '05 - | C++ Data Structures | - | Array as a Data Structure - Part 1 | - | تراكيب البيانات |', 'path': 'https://www.youtube.com/watch?v=pASx8xQtIYY&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=5', 'description': '| Array as a Data Structure - Part 1 | - | تراكيب البيانات |'},
              {'name': '06 - | C++ Data Structures | - | Array as a Data Structure - Part 2 | - | تراكيب البيانات |', 'path': 'https://www.youtube.com/watch?v=TU2S9P5CRUE&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=6', 'description': '| Array as a Data Structure - Part 2 | - | تراكيب البيانات |'},
              {'name': '07 - | C++ Data Structures | - | Linked Lists - Part 1 | - | تراكيب البيانات |', 'path': 'https://www.youtube.com/watch?v=cQ-HCe_IAos&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=7', 'description': '| Linked Lists - Part 1 | - | تراكيب البيانات |'},
              {'name': '08 - | C++ Data Structures | - | Linked Lists - Part 2 | - | تراكيب البيانات |', 'path': 'https://www.youtube.com/watch?v=80pnhhHGpWc&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=8', 'description': '| Linked Lists - Part 2 | - | تراكيب البيانات |'},
              {'name': '09 - | C++ Data Structures | - | Linked Lists - Part 3 | - | تراكيب البيانات |', 'path': 'https://www.youtube.com/watch?v=nyIF45QKX4k&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=9', 'description': '| Linked Lists - Part 3 | - | تراكيب البيانات |'},
              {'name': '10 - | C++ Data Structures | - | Stack Using Linked Lists | - | تراكيب البيانات |', 'path': 'https://www.youtube.com/watch?v=i_Q_YZwdoMg&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=10', 'description': '| Stack Using Linked Lists | - | تراكيب البيانات |'},
              {'name': '11 - | C++ Data Structures | - | Queue Using Linked Lists | - | تراكيب البيانات |', 'path': 'https://www.youtube.com/watch?v=ykfeLmXogw8&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=11', 'description': '| Queue Using Linked Lists | - | تراكيب البيانات |'},
              {'name': '12 - | C++ Data Structures | - | Binary Search Tree - Part 1 | - | تراكيب البيانات |', 'path': 'https://www.youtube.com/watch?v=quMfajPvW24&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=12', 'description': '| Binary Search Tree - Part 1 | - | تراكيب البيانات |'},
              {'name': '13 - | C++ Data Structures | - | Binary Search Tree - Part 2 | - | تراكيب البيانات |', 'path': 'https://www.youtube.com/watch?v=dqgZd8qvXoY&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=13', 'description': '| Binary Search Tree - Part 2 | - | تراكيب البيانات |'},
              {'name': '14 - | C++ Data Structures | - | Binary Search Tree - Part 3 | - | تراكيب البيانات |', 'path': 'https://www.youtube.com/watch?v=tEVTakjxS-Q&list=PL1DUmTEdeA6JlommmGP5wicYLxX5PVCQt&index=14', 'description': '| Binary Search Tree - Part 3 | - | تراكيب البيانات |'},
            ],
            'books': [
              {'title': 'Data Structures and Algorithms', 'path': 'https://www.mta.ca/~rrosebru/oldcourse/263114/Dsa.pdf'},
              {'title': 'Data Structuresand AlgorithmAnalysis inC++', 'path': 'https://www.uoitc.edu.iq/images/documents/informatics-institute/Competitive_exam/DataStructures.pdf'},],
          },
          'Logic Design': {
            'title': 'Logic Design',
            'description': 'Basic concepts of electronics and circuits.',
            'videos': [
              {'name': 'Logic Design', 'path': 'path_to_video_for_math0_part1'},
              {'name': 'Logic Design', 'path': 'path_to_video_for_math0_part2'},
            ],
            'books': [
              {'title': 'Logic Design', 'path': 'path_to_math_basics_book'},
              {'title': 'Logic Design', 'path': 'path_to_intro_to_math_book'},
            ],
          },
          'DataBase': {
            'title': 'DataBase',
            'description': 'Introduction to statistical methods and probability theory.',
            'videos': [
              {'name': 'DataBase', 'path': 'path_to_video_for_math0_part1'},
              {'name': 'DataBase', 'path': 'path_to_video_for_math0_part2'},
            ],
            'books': [
              {'title': 'DataBase', 'path': 'path_to_math_basics_book'},
              {'title': 'DataBase', 'path': 'path_to_intro_to_math_book'},
            ],
          },
          'Software Engineering': {
            'title': 'Software',
            'description': 'Introduction to statistical methods and probability theory.',
            'videos': [
              {'name': 'Software Engineering', 'path': 'path_to_video_for_math0_part1'},
              {'name': 'Software Engineering', 'path': 'path_to_video_for_math0_part2'},
            ],
            'books': [
              {'title': 'Software Engineering', 'path': 'path_to_math_basics_book'},
              {'title': 'Software Engineering', 'path': 'path_to_intro_to_math_book'},
            ],
          },
        }
      },
      'Semester 4': {
        'Materials': {
          'Math 4': {
            'title': 'Math 4',
            'description': 'Calculus and differential equations.',
            'videos': [
              {'name': 'Introduction to Math4', 'path': 'path_to_video_for_math0_part1'},
              {'name': 'Math Fundamentals', 'path': 'path_to_video_for_math0_part2'},
            ],
            'books': [
              {'title': 'Math Basics Book', 'path': 'path_to_math_basics_book'},
              {'title': 'Intro to Math', 'path': 'path_to_intro_to_math_book'},
            ],
          },
          'Machine Learning': {
            'title': 'Machine Learning',
            'description': 'Introduction to machine learning concepts and applications.',
            'videos': [
              {'name': 'Machine Learning', 'path': 'path_to_video_for_math0_part1'},
              {'name': 'Machine Learning', 'path': 'path_to_video_for_math0_part2'},
            ],
            'books': [
              {'title': 'Machine Learning Basics', 'path': 'path_to_machine_learning_book'},
              {'title': 'Deep Learning', 'path': 'path_to_deep_learning_book'},
            ],
          },
          'Artificial Intelligence': {
            'title': 'Artificial Intelligence',
            'description': 'Fundamentals of AI and its applications.',
            'videos': [
              {'name': 'AI Concepts', 'path': 'path_to_video_for_math0_part1'},
              {'name': 'AI Applications', 'path': 'path_to_video_for_math0_part2'},
            ],
            'books': [
              {'title': 'AI Basics', 'path': 'path_to_ai_basics_book'},
              {'title': 'Advanced AI', 'path': 'path_to_advanced_ai_book'},
            ],
          },
        }
      },
    },
    'Level 3': {
      'Semester 5': {
        'Materials': {
          'Advanced Math': {
            'title': 'Advanced Math',
            'description': 'Complex numbers and their applications.',
            'videos': [
              {'name': 'Complex Numbers', 'path': 'https://www.youtube.com/watch?v=Q0YEhxYzDgA&list=PLZEjCjHzGS_bRy0o6NCRwt4xipWEQSALD', 'description': ' Matrix math | matrix operations.'},
              {'name': 'Applications', 'path': 'path_to_video_for_math0_part2'},
            ],
            'books': [
              {'title': 'Complex Numbers Book', 'path': 'path_to_complex_numbers_book'},
              {'title': 'Applications of Complex Numbers', 'path': 'path_to_applications_book'},
            ],
          },
          'Algorithms': {
            'title': 'Algorithms',
            'description': 'Introduction to algorithms and their applications.',
            'videos': [
              {'name': 'Algorithm Basics', 'path': 'path_to_video_for_math0_part1'},
              {'name': 'Algorithm Applications', 'path': 'path_to_video_for_math0_part2'},
            ],
            'books': [
              {'title': 'Algorithm Basics Book', 'path': 'path_to_algorithm_basics_book'},
              {'title': 'Advanced Algorithms', 'path': 'path_to_advanced_algorithms_book'},
            ],
          },
        }
      },
      'Semester 6': {
        'Materials': {
          'Physics 2': {
            'title': 'Physics 2',
            'description': 'Advanced concepts in physics.',
            'videos': [
              {'name': 'Physics Concepts', 'path': 'path_to_video_for_math0_part1'},
              {'name': 'Advanced Physics', 'path': 'path_to_video_for_math0_part2'},
            ],
            'books': [
              {'title': 'Advanced Physics Book', 'path': 'path_to_advanced_physics_book'},
              {'title': 'Physics Applications', 'path': 'path_to_physics_applications_book'},
            ],
          },
          'Data Science': {
            'title': 'Data Science',
            'description': 'Fundamentals of data science and analytics.',
            'videos': [
              {'name': 'Data Science Basics', 'path': 'path_to_video_for_math0_part1'},
              {'name': 'Data Science Applications', 'path': 'path_to_video_for_math0_part2'},
            ],
            'books': [
              {'title': 'Data Science Book', 'path': 'path_to_data_science_book'},
              {'title': 'Advanced Data Science', 'path': 'path_to_advanced_data_science_book'},
            ],
          },
        }
      },
    },
    'Level 4': {
      'Semester 7': {
        'Materials': {
          'Software Testing': {
            'title': 'Software Testing',
            'description': 'Fundamentals of software testing and quality assurance.',
            'videos': [
              {'name': 'Software Testing Basics', 'path': 'path_to_video_for_math0_part1'},
              {'name': 'Testing Techniques', 'path': 'path_to_video_for_math0_part2'},
            ],
            'books': [
              {'title': 'Software Testing Book', 'path': 'path_to_software_testing_book'},
              {'title': 'Quality Assurance', 'path': 'path_to_quality_assurance_book'},
            ],
          },
          'Project Management': {
            'title': 'Project Management',
            'description': 'Basics of project management and methodologies.',
            'videos': [
              {'name': 'Project Management Basics', 'path': 'path_to_video_for_math0_part1'},
              {'name': 'Agile Methodologies', 'path': 'path_to_video_for_math0_part2'},
            ],
            'books': [
              {'title': 'Project Management Book', 'path': 'path_to_project_management_book'},
              {'title': 'Agile Project Management', 'path': 'path_to_agile_pm_book'},
            ],
          },
        }
      },
      'Semester 8': {
        'Materials': {
          'Capstone Project': {
            'title': 'Capstone Project',
            'description': 'Final project applying learned skills.',
            'videos': [
              {'name': 'Capstone Project Overview', 'path': 'path_to_video_for_math0_part1'},
              {'name': 'Project Presentation', 'path': 'path_to_video_for_math0_part2'},
            ],
            'books': [
              {'title': 'Capstone Project Guide', 'path': 'path_to_capstone_guide'},
              {'title': 'Project Documentation', 'path': 'path_to_project_documentation'},
            ],
          },
          'Career Development': {
            'title': 'Career Development',
            'description': 'Skills for job readiness and career growth.',
            'videos': [
              {'name': 'Resume Building', 'path': 'path_to_video_for_math0_part1'},
              {'name': 'Interview Skills', 'path': 'path_to_video_for_math0_part2'},
            ],
            'books': [
              {'title': 'Career Development Book', 'path': 'path_to_career_development_book'},
              {'title': 'Job Search Strategies', 'path': 'path_to_job_search_book'},
            ],
          },
        }
      },
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF674AEF),
        title: const Text('Study Materials'),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StudyLevel1(
                    materials: studyMaterials['Level 1'],
                  ),
                ),
              );
            },
            child: buildContainer("Level 1", "images/Study/RST (1).png"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StudyLevel2(
                      materials: studyMaterials['Level 2']!
                  ),
                ),
              );
            },
            child: buildContainer("Level 2", "images/Study/RST (2).png"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StudyLevel3(
                    materials: studyMaterials['Level 3'],
                  ),
                ),
              );
            },
            child: buildContainer("Level 3", "images/Study/RST (3).png"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StudyLevel4(
                    materials: studyMaterials['Level 4'],
                  ),
                ),
              );
            },
            child: buildContainer("Level 4", "images/Study/RST (4).png"),
          ),
        ],
      ),
    );
  }

  Widget buildContainer(String title, String imagePath) {
    // return Container(
    //   margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10),
    //     image: DecorationImage(
    //       image: AssetImage(imagePath),
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.all(20),
    //     child: Center(
    //       child: Text(
    //         title,
    //         style: const TextStyle(
    //           color: Colors.white,
    //           fontSize: 24,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Increased margin
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30), // Increased padding
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26, // Increased font size for better visibility
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

