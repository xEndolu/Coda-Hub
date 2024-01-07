import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodaHub',
      theme: ThemeData.from(colorScheme: CustomColorScheme.colorScheme),
      home: HomeScreen(),
    );
  }
}

class CustomColorScheme {
  static final ColorScheme colorScheme = ColorScheme.light(
    primary: Color(0xFFD7B9FD),
    secondary: Colors.white,
    background: Color(0xFFF4F6FF),
    surface: Color(0xFFF4F6FF),
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    onBackground: Colors.black,
    onSurface: Colors.black,
    error: Colors.red,
    onError: Colors.white,
  );
  static Color primaryColor = Color(0xFFD7B9FD);
  static Color onPrimaryColor = Colors.black;
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    Home(),
    Lessons(),
    VideoLectures(),
    AboutUs(),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: _currentIndex),
      screens: _pages,
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: 'Home',
          activeColorPrimary: Color.fromARGB(255, 142, 15, 165),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.library_books),
          title: 'Lessons',
          activeColorPrimary: Color.fromARGB(255, 142, 15, 165),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.video_library),
          title: 'Video Lectures',
          activeColorPrimary: Color.fromARGB(255, 142, 15, 165),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.info),
          title: 'About Us',
          activeColorPrimary: Color.fromARGB(255, 142, 15, 165),
          inactiveColorPrimary: Colors.grey,
        ),
      ],
      confineInSafeArea:
          true, // Set it to false if you want to avoid system padding
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose from 1 to 6 for different styles
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.0), // Add space above the Home Page widget
            _buildHomePageWidget(),
            SizedBox(height: 10.0), // Add space below the Home Page widget
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildContainerWithTextAndLogo(
                    context,
                    'assets/codahub.png',
                    'CodaHub',
                    'What would you like to learn today?',
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProgrammingDetailsPage(),
                        ),
                      );
                    },
                    child: _buildContainerWithTextAndImage(
                      context,
                      'What is Programming?',
                      'assets/what_is_prog.png',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigate to Lessons() screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Lessons(),
                            ),
                          );
                        },
                        child: _buildSmallContainer(
                          context,
                          'LESSONS',
                          'assets/lessons.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to VideoLectures() screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoLectures(),
                            ),
                          );
                        },
                        child: _buildSmallContainer(
                          context,
                          'VIDEO LECTURES',
                          'assets/vid_lecs.png',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildHomePageWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Color(0xFFD7B9FD),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/codahub.png',
            width: 40.0, // Adjust the width as needed
            height: 40.0, // Adjust the height as needed
          ),
          SizedBox(width: 12.0), // Add space between image and text
          Text(
            'HOME',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildContainerWithTextAndLogo(
  BuildContext context,
  String logoPath,
  String title,
  String description,
) {
  return Container(
    margin: EdgeInsets.all(12.0),
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      border: Border.all(
        color: Color(0xFFD7B9FD),
        width: 4.0,
      ),
    ),
    width: MediaQuery.of(context).size.width * 0.8,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  logoPath,
                  height: 30.0,
                  width: 30.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 4.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 100.0, // Adjust the width as needed
          height: 125.0, // Adjust the height as needed
          child: Image.asset(
            'assets/what_to_know.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}

Widget _buildContainerWithTextAndImage(
  BuildContext context,
  String title,
  String imagePath,
) {
  double containerHeight = title == 'Lesson' ? 140.0 : 140.0;

  return Container(
    margin: EdgeInsets.all(8.0), // Reduced margin for a smaller container
    padding: EdgeInsets.all(4.0), // Reduced padding for a smaller container
    decoration: BoxDecoration(
      borderRadius:
          BorderRadius.circular(10.0), // Slightly smaller border radius
      border: Border.all(
        color: Color(0xFFD7B9FD),
        width: 3.0, // Slightly thinner border
      ),
    ),
    width: MediaQuery.of(context).size.width *
        0.8, // Adjusted width for a smaller container
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 22.0), // Increased space above the text
              Text(
                'What is programming?',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ), // Increased font size and boldness
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 3.0), // Reduced space between text and image
            ],
          ),
        ),
        SizedBox(
          height: 70.0,
          width: 70.0, // Adjusted image width
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}

Widget _buildSmallContainer(
  BuildContext context,
  String title,
  String imagePath,
) {
  double containerHeight =
      title == 'Lessons' ? 180.0 : 180.0; // Fixed height for both containers

  return Container(
    margin: EdgeInsets.all(12.0),
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      border: Border.all(
        color: Color(0xFFD7B9FD),
        width: 4.0,
      ),
    ),
    width: MediaQuery.of(context).size.width * 0.4,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.0, // Slightly larger font size
            fontWeight: FontWeight.bold, // Bold text
          ),
          textAlign: TextAlign.center, // Center the text
        ),
        SizedBox(height: 12.0),
        SizedBox(
          height: containerHeight,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}

class ProgrammingDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildIntroductionWidget(context),
            SizedBox(height: 15.0),
            _buildTitleWithColoredText(
              'Programming is, quite literally, all around us. From the take-out we order, to the movies we stream, code enables everyday actions in our lives. Tech companies are no longer recognizable as just software companies — instead, they bring food to our door, help us get a taxi, influence outcomes in presidential elections, or act as a personal trainer.',
              Color(0xFFD7B9FD),
            ),
            SizedBox(height: 15.0),
            _buildTitleWithColoredText(
              '''For many years, only a few people have known how to code. However, that’s starting to change. The number of people learning to code is increasing year by year, with estimates around 31.1 million software developers worldwide, which doesn’t even account for the many other careers that relate to programming.
\nHere at CodeHub, our mission is to make technical knowledge accessible and applicable. Technology plays a crucial role in our economy — but programming is no longer just for software engineers. Any person can benefit from learning to program — whether it’s learning HTML to improve your marketing emails or taking a SQL course to add a dose of analysis to your research role.
\nEven outside of the tech industry, learning to program is essential to participating in the world around you: it affects the products you buy, the legal policies you vote for, and the data you share online.
\nSo, let’s dig into what programming is.''',
              Color(0xFFD7B9FD),
            ),
            SizedBox(height: 15.0),
            _buildImageAndTitle(
              'assets/intro1.png',
              'WHAT IS PROGRAMMING?',
            ),
            _buildTitleWithColoredText(
              'Put simply, programming is giving a set of instructions to a computer to execute. If you’ve ever cooked using a recipe before, you can think of yourself as the computer and the recipe’s author as a programmer. The recipe author provides you with a set of instructions that you read and then follow. The more complex the instructions, the more complex the result!',
              Color(0xFFD7B9FD),
            ),
            _buildImageAndTitle(
              'assets/intro2.png',
              'PROGRAMMING AS COMMUNICATION, or CODING',
            ),
            _buildTitleWithColoredText(
              '''“Ok, so now I know what programming is, but what’s coding? I’m here to learn how to code. Are they the same thing?”
\nWhile sometimes used interchangeably, programming and coding actually have different definitions. 
\nProgramming is the mental process of thinking up instructions to give to a machine (like a computer). Coding is the process of transforming those ideas into a written language that a computer can understand.
\nOver the past century, humans have been trying to figure out how to best communicate with computers through different programming languages. Programming has evolved from punch cards with rows of numbers that a machine read, to drag-and-drop interfaces that increase programming speed, with lots of other methods in between.
\nTo this day, people are still developing programming languages, trying to improve our programming efficiency. There are tons of programming languages out there, each with its own unique strengths and applications. Ultimately, the best one for you depends on what you’re looking to achieve.''',
              Color(0xFFD7B9FD),
            ),
            _buildImageAndTitle(
              'assets/intro3.png',
              'CONCLUSION',
            ),
            _buildTitleWithColoredText(
              '''As programming becomes a larger part of our lives, it’s vital that everyone has an understanding of what programming is and how it can be used. Programming is important to our careers, but it also plays a key role in how we participate in politics, how we buy things, and how we stay in touch with one another.
\nLearning to code is an exciting journey. Whether your goal is to build a mobile app, search a database, or program a robot, coding is a skill that will take you far in life. Just remember — computers are tools. While learning to program may initially be frustrating, if you choose to stick with it, you’ll be able to make some brilliant things.''',
              Color(0xFFD7B9FD),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroductionWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pop(); // Navigate back to the previous screen (home)
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Color(0xFFD7B9FD),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Icon(Icons.arrow_back),
            SizedBox(width: 8.0),
            Image.asset(
              'assets/intro.png',
              width: 50,
              height: 50,
            ),
            SizedBox(width: 8.0),
            Text(
              'INTRODUCTION',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageAndTitle(String imagePath, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 100, // Increase the width as needed
          height: 100, // Increase the height as needed
        ),
        SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTitleWithColoredText(String title, Color bgColor) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class Lessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: Color(0xFFD7B9FD),
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/lesson_list.png',
                    width: 40.0, // Adjust the width as needed
                    height: 40.0, // Adjust the height as needed
                  ),
                  SizedBox(width: 12.0), // Add space between image and text
                  Text(
                    'LESSONS',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView(
              children: [
                LanguageTile(
                  language: 'JAVASCRIPT',
                  content: javascriptContent(),
                  imageAsset: 'assets/javascript/javascript.png',
                ),
                LanguageTile(
                  language: 'PYTHON',
                  content: pythonContent(),
                  imageAsset: 'assets/python/python.png',
                ),
                LanguageTile(
                  language: 'GO',
                  content: goContent(),
                  imageAsset: 'assets/go/go.png',
                ),
                LanguageTile(
                  language: 'JAVA',
                  content: javaContent(),
                  imageAsset: 'assets/java/java.png',
                ),
                LanguageTile(
                  language: 'KOTLIN',
                  content: kotlinContent(),
                  imageAsset: 'assets/kotlin/kotlin.png',
                ),
                LanguageTile(
                  language: 'PHP',
                  content: phpContent(),
                  imageAsset: 'assets/php/php.png',
                ),
                LanguageTile(
                  language: 'C#',
                  content: csharpContent(),
                  imageAsset: 'assets/c#/C#.png',
                ),
                LanguageTile(
                  language: 'SWIFT',
                  content: swiftContent(),
                  imageAsset: 'assets/swift/swift.png',
                ),
                LanguageTile(
                  language: 'R',
                  content: rContent(),
                  imageAsset: 'assets/r/r.png',
                ),
                LanguageTile(
                  language: 'RUBY',
                  content: rubyContent(),
                  imageAsset: 'assets/ruby/ruby.png',
                ),
                LanguageTile(
                  language: 'C AND C++',
                  content: cAndcplusplusContent(),
                  imageAsset: 'assets/c and c++/c and c++.png',
                ),
                LanguageTile(
                  language: 'MATLAB',
                  content: matlabContent(),
                  imageAsset: 'assets/matlab/matlab.png',
                ),
                LanguageTile(
                  language: 'TYPESCRIPT',
                  content: typescriptContent(),
                  imageAsset: 'assets/typescript/typescript.png',
                ),
                LanguageTile(
                  language: 'SCALA',
                  content: scalaContent(),
                  imageAsset: 'assets/scala/scala.png',
                ),
                LanguageTile(
                  language: 'SQL',
                  content: sqlContent(),
                  imageAsset: 'assets/sql/sql.png',
                ),
                LanguageTile(
                  language: 'HTML',
                  content: htmlContent(),
                  imageAsset: 'assets/html/html.png',
                ),
                LanguageTile(
                  language: 'CSS',
                  content: cssContent(),
                  imageAsset: 'assets/css/css.png',
                ),
                LanguageTile(
                  language: 'NOSQL',
                  content: nosqlContent(),
                  imageAsset: 'assets/nosql/nosql.png',
                ),
                LanguageTile(
                  language: 'RUST',
                  content: rustContent(),
                  imageAsset: 'assets/rust/rust.png',
                ),
                LanguageTile(
                  language: 'PERL',
                  content: perlContent(),
                  imageAsset: 'assets/perl/perl.png',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<OutlineItem> javascriptContent() {
  return [
    OutlineItem(
      imagePath: 'assets/javascript/javascript.png',
    ),
    OutlineItem(
      title: 'What is JavaScript?',
      description:
          'JavaScript is a versatile programming language primarily used for web development. It enables the creation of dynamic and interactive elements within web pages, providing enhanced user experiences. Originally designed for client-side scripting in browsers, JavaScript has evolved into a powerful language capable of handling both front-end and back-end development. Its syntax is similar to other programming languages, making it accessible for developers to create responsive and feature-rich web applications.',
    ),
    OutlineItem(
      title: 'Why use JavaScript?',
      description:
          'JavaScript is essential in web development for its ability to create dynamic and responsive user interfaces. It reduces server load by executing tasks on the client side, leading to improved performance. JavaScript supports various programming paradigms, making it versatile for different applications, from simple web enhancements to complex server-side development using frameworks like Node.js.',
    ),
    OutlineItem(
      title: 'How to use JavaScript?',
      description:
          'JavaScript can be incorporated into HTML documents using script tags. These tags can be placed in the head or body section of an HTML document, and developers can write JavaScript code directly within these tags or link external JavaScript files with a .js extension. The language utilizes variables, functions, loops, and conditionals to achieve desired functionalities, providing flexibility in coding.',
    ),
    OutlineItem(title: 'JavaScript Programming Concepts:', description: '''
    1. Variables:
    let variableName ="Hello, JavaScript!";
    let variableName = value; : Declares a variable with the specified name and assigns a value to it.

    2. Data Types:
    - Numbers: Represents numeric values, both integers and floating-point numbers.
    Numbers are used for arithmetic operations and mathematical calculations.
    let length = 16; let weight = 7.5;

    - Strings: Represents a sequence of characters and is enclosed in single (' '), double (" "), or backtick (` `) quotes. Strings are used for text and can include letters, numbers, symbols, and spaces.
    let color = "Yellow";
    let lastName = "Johnson";

    - Booleans: Represents a logical value indicating either true or false. Booleans are often used in conditional statements and comparisons.
    let x = true; let y = false;

    - Object: Represents a collection of key-value pairs, where keys are strings or symbols, and values can be of any data type. Objects are versatile and used for structuring complex data and creating reusable code.
    const person = {firstName:"John", lastName:"Doe"};

    - Array object: Represents an ordered list of values, where each value is identified by an index or a key. Arrays are used for storing and organizing multiple values under a single variable.
    const cars = ["Saab", "Volvo", "BMW"];

    - Date object: Represents dates and times in JavaScript. The Date object provides methods for working with dates, such as getting and setting the year, month, day, hour, minute, second, and millisecond.
    const date = new Date("2022-03-25");

    3. Functions:
    Function greet (name) {
      Return "Hello, "+ name + "!";
    }
    let result = greet(“John”);
    function functionName(parameters) { /* code */ } : Declares a function with optional parameters and a code block.
  '''),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              'Gmail: A widely used email service developed by Google, offering a dynamic and responsive user interface.',
          imagePath: 'assets/javascript/gmail.png',
        ),
        AppData(
          description:
              'Slack: A popular team collaboration platform utilizing JavaScript for real-time messaging and interactive features.',
          imagePath: 'assets/javascript/slack.png',
        ),
        AppData(
          description:
              'Facebook: The leading social media platform, leveraging JavaScript for its dynamic and user-friendly interface.',
          imagePath: 'assets/javascript/fb.png',
        ),
        AppData(
          description:
              'Twitter: A microblogging platform that employs JavaScript for seamless and responsive tweet updates.',
          imagePath: 'assets/javascript/twtr.png',
        ),
        AppData(
          description:
              'Instagram: A photo and video sharing platform using JavaScript for its interactive and visually engaging features.',
          imagePath: 'assets/javascript/ig.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> pythonContent() {
  return [
    OutlineItem(
      imagePath: 'assets/python/python.png',
    ),
    OutlineItem(
      title: 'What is Python?',
      description:
          'Python is a high-level, general-purpose programming language that emphasizes readability and simplicity. Created by Guido van Rossum and first released in 1991, Python has gained widespread popularity for its clear and concise syntax, making it an ideal choice for beginners and experienced developers alike. Known for its versatility, Python is used across various domains, including web development, data science, artificial intelligence, machine learning, automation, and more.',
    ),
    OutlineItem(
      title: 'Why use Python?',
      description:
          "Python is favored for its readability, ease of learning, and versatility. Its extensive standard libraries and frameworks, such as Django for web development and TensorFlow for machine learning, contribute to rapid development. Python's broad community support, cross-platform compatibility, and active developer community make it an excellent choice for a wide range of applications.",
    ),
    OutlineItem(
      title: 'How to use Python?',
      description:
          'Using Python involves writing code in a text editor or an integrated development environment (IDE), saving the code with a .py extension, and executing it using a Python interpreter. Python supports an interactive mode, enabling users to test code snippets in real-time. Its syntax is straightforward, emphasizing code readability and reducing the cost of program maintenance.',
    ),
    OutlineItem(title: 'Python Programming Concepts:', description: '''
1. Print Statement:
    print("Hello, Python!")
    print("text") : Outputs the specified text or value to the console.

2. Variables:
    X=10
    variable_name = value : Assigns a value to a variable. Variables can hold different data types.

3. Data Types:
    num = 42 		#integer
    text= “Python”		#string
    is_true = True		#boolean
    - Text Type: Represents sequences of characters and is commonly known as a string. It can be created using single (' '), double (" "), or triple ('' ' ' or " " " " ) quotes.
    Str
    - Numeric Types: Represent numeric values. Int is for integers, float is for floating-point numbers, and complex is for complex numbers.
    Int, float, complex
    - Sequence Types: Represent ordered collections of elements. Lists are mutable, tuples are immutable, and the range is used to represent sequences of numbers.
    List, tuple, range
    - Mapping Type: Represents a collection of key-value pairs. It is also known as a dictionary, where each key must be unique.
    Dict
    - Set Types: Represents an unordered collection of unique elements. Sets are mutable, while frozensets are immutable.
    Set, frozenset
    - Boolean Type: Represents boolean values True or False. Used in conditional expressions and logical operations.
    Bool
    - Binary Types: Represent sequences of bytes. Bytes and bytearray are mutable, while memoryview provides a view over an array’s buffer.
    Bytes, bytearray, memoryview
    - None Type: Represents the absence of a value or a null value. Often used as a default return value for functions that do not explicitly return anything.
    NoneType

4. List:
    fruits = ["apple","orange","banana"]
    list_name = [element1, element2, ...] : Creates a list to store multiple elements.

5. Conditional Statements:
    if condition:
        # code if condition is true
    else:
    # code if condition is false
    if condition: : Executes different code blocks based on a specified condition.

6. Loops:
    for i in range(5):
        # code to be executed in each iteration
    for variable in iterable: : Repeats a block of code for each element in an iterable.

7. Functions:
    def greet(name):
        return "Hello, " + name + “!”
    def function_name(parameters): : Declares a function with optional parameters.

8. Dictionaries:
    person = {"name":"John","age": 30}
    dictionary_name = {"key1": value1, "key2": value2, ...} : Creates a dictionary to store key-value pairs.

9. Input from User:
    user_input =input("Enter something: ")
    input("prompt") : Takes user input and returns it as a string.

10. Comments:
    # This is a single-line comment
    """
    This is a multi-line comment
    """
    Adds comments within the code. Comments are ignored by the Python interpreter.
  '''),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              "Instagram: A widely-used photo and video-sharing platform developed using Django, a Python web framework, showcasing Python's effectiveness in web development.",
          imagePath: 'assets/python/ig.png',
        ),
        AppData(
          description:
              "Dropbox: A cloud storage service that heavily relies on Python for both server-side and client-side development, highlighting Python's versatility.",
          imagePath: 'assets/python/dropbox.png',
        ),
        AppData(
          description:
              "YouTube: Python is used in various components of YouTube's backend, demonstrating its suitability for handling large-scale web applications.",
          imagePath: 'assets/python/yt.png',
        ),
        AppData(
          description:
              'Reddit: A social news aggregation and discussion platform developed with Python, emphasizing its role in creating dynamic and interactive web applications.',
          imagePath: 'assets/python/reddit.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> goContent() {
  return [
    OutlineItem(
      imagePath: 'assets/go/go.png',
    ),
    OutlineItem(
      title: 'What is Go?',
      description:
          'Go, also known as Golang, is an open-source programming language developed by Google engineers Robert Griesemer, Rob Pike, and Ken Thompson. Launched in 2009, Go is designed to be simple, efficient, and scalable, making it well-suited for system-level programming, concurrent programming, and cloud-based applications. It emphasizes readability, productivity, and strong support for concurrent processes.',
    ),
    OutlineItem(
      title: 'Why use Go?',
      description:
          "Go is valued for its efficiency, simplicity, and strong support for concurrent programming. It compiles to machine code, leading to fast execution, and its simplicity makes it easy to learn and maintain. Go's built-in concurrency features, like goroutines and channels, make it well-suited for developing scalable and concurrent systems, particularly in cloud-based environments.",
    ),
    OutlineItem(
      title: 'How to use Go?',
      description:
          "To use Go, you need to install the Go compiler and set up your development environment. Write your Go code in a text editor or an integrated development environment (IDE), save it with a. go extension, and use the 'go run' command to compile and execute your program. Go follows a straightforward syntax, focusing on simplicity and readability.",
    ),
    OutlineItem(title: 'Go Programming Concepts', description: '''
1. Hello World:
    package main
    import "fmt"
    func main() {
        fmt.Println("Hello, Go!")
    }
    The main function is the entry point of a Go program. fmt.Println is used to print text to the console.

2. Variables:
    var x int
        x = 42
    var variable_name data_type : Declares a variable with a specified data type.

3. Constants:
    const pi = 3.14
    const constant_name = value : Declares a constant with an unchangeable value.

4. Data Types:
    Var number int
    Var text string
    Var isTrue bool
    - Boolean: Represents boolean values, either true or false. Booleans are commonly used in conditional statements and logical operations.
        var varname bool = true / false
    - Integer: Represents whole numbers. The int type is the most commonly used integer type, while others specify the size (in bits) of the integer.
        var varname int = (number)
    - Floating point number: Represents decimal numbers with floating-point precision. The float64 type is more commonly used and provides higher precision than float32.
        var varname float32 = (decimal number)
    - String: Represents sequences of characters. Strings are used for storing and manipulating textual data. They can be created using double quotes (" ") or backticks (` `).
        var varname string = "Text" / ‘Text’

5. Function:
    func add(a, b int) int {
        return a + b	
    }
    func function_name(parameters) return_type { /* code */ } : Declares a function with parameters and a return type.

6. Conditional Statements:
    if condition {
        // code if condition is false
    } else {
        // code if condition is true
    }
    if condition { /* code */ } else { /* code */ } : Executes different code blocks based on a specified condition.

7. Loops:
    for i := 0; i < S; i++ {
        // code to be executed in each iteration
    }
    for initialization; condition; increment/decrement { /* code */ } : Repeats a block of code as long as a specified condition is true.

8. Arrays and Slices:
    var number [3]int
    fruits := []{"apple", "orange", "banana"}
    Arrays have a fixed size, while slices are dynamically-sized and more flexible.

9. Maps:
    person := map[string]interface{}{
        “name”:”John”,
        “age”: 30,
    }
    map[key_type]value_type : Represents an unordered collection of key-value pairs.

10. Pointers:
    x := 12
    var pointer *int = &x
    *data_type : Represents a pointer to a variable of the specified data type.
'''),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              "Docker: A platform for developing, shipping, and running applications in containers. Go's efficiency and concurrency support contribute to Docker's robust performance.",
          imagePath: 'assets/go/docker.png',
        ),
        AppData(
          description:
              "Kubernetes: An open-source container orchestration platform. Go's simplicity and concurrent programming features play a key role in managing and scaling containerized applications.",
          imagePath: 'assets/go/kubernetes.png',
        ),
        AppData(
          description:
              "Prometheus: A monitoring and alerting toolkit designed for reliability and scalability. Go's efficiency makes it suitable for handling large-scale monitoring tasks.",
          imagePath: 'assets/go/prometheus.png',
        ),
        AppData(
          description:
              "InfluxDB: A high-performance, distributed, and scalable time-series database. Go's speed and simplicity are advantageous for handling time-series data efficiently.",
          imagePath: 'assets/go/influx_db.png',
        ),
        AppData(
          description:
              "Terraform: An infrastructure as code (IaC) tool for building, changing, and versioning infrastructure. Go's efficiency and readability contribute to Terraform's success in managing complex infrastructure configurations.",
          imagePath: 'assets/go/terraform.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> javaContent() {
  return [
    OutlineItem(
      imagePath: 'assets/java/java.png',
    ),
    OutlineItem(
      title: 'What is Java?',
      description:
          'Java is a versatile, object-oriented programming language developed by James Gosling and his team at Sun Microsystems in the mid-1990s. Known for its portability, Java enables developers to write code once and run it on various platforms without modification. It is widely used for building scalable, cross-platform applications, ranging from web and mobile applications to enterprise-level systems.',
    ),
    OutlineItem(
      title: 'Why use Java?',
      description:
          "Java is favored for its platform independence, making it compatible with various operating systems. Its robustness, security features, and extensive libraries contribute to the development of scalable and reliable applications. Additionally, Java's object-oriented nature promotes modular and maintainable code, while its broad community support ensures a wealth of resources and tools for developers.",
    ),
    OutlineItem(
      title: 'How to use Java?',
      description:
          "To use Java, you need to install the Java Development Kit (JDK) on your system. Write your Java code in a text editor or an integrated development environment (IDE), save it with a .java extension, and use the 'javac' command to compile it into bytecode. The compiled bytecode can then be executed using the 'java' command.",
    ),
    OutlineItem(title: 'Java Programming Concepts:', description: '''
1. Hello World:
    public class Helloworld {
        public static void main(String[]args) {
            System.out.println(“Hello, Java!”);
        }
    }
    The main method is the entry point of a Java program. System.out.println is used to print text to the console.

2. Variables:
    int x = 10;
    data_type variable_name = value; : Declares a variable with a specified data type and assigns a value to it.

3. Constants:
    final double PI = 3.14;
    final data_type CONSTANT_NAME = value; : Declares a constant with an unchangeable value.

4. Data Types:
    int number;
    double decimal;
    char character;
    boolean isTrue;
    Java supports various data types, including integers (int), floating-point numbers (double), characters (char), and booleans (boolean).

5. Functions (Methods):
    public static int add(int a, int b) {
        return a + b;
    }
    access_modifier return_type method_name(parameters) { /* code */ } : Declares a method with optional parameters and a return type.

6. Conditional Statements:
    if (condition) {
        // code if condition is true
    } else {
        // code if condition is false
    }
    if (condition) { /* code */ } else { /* code */ } : Executes different code blocks based on a specified condition.

7. Loops:
    for (int i = 0; i < 5; i++) {
        // code to be executed in each iteration
    }
    for (initialization; condition; increment/decrement) { /* code */ } : Repeats a block of code as long as a specified condition is true.

8. Arrays:
    int[] numbers = {1, 2, 3, 4, 5};
    data_type[] array_name = {element1, element2, ...} : Creates an array to store multiple elements.

9. Classes and Objects:
    class Person {
        String name;
        int age;
    }

    Person john = new Person();
    john.name = “John”;
    john.age = 30;
    class : Defines a class with attributes (fields) and creates an object (instance) of that class.

10. Input from User:
    import java.util.Scanner;
    Scanner scanner = new Scanner(System.in);
    int userInput = scanner.nextInt();
    Uses the Scanner class to take user input.
'''),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              'Android OS: Java is a key language for developing Android applications, making it the foundation for a vast ecosystem of mobile apps.',
          imagePath: 'assets/java/android.png',
        ),
        AppData(
          description:
              "Eclipse IDE: An integrated development environment widely used for Java development, showcasing Java's versatility in building powerful tools for developers.",
          imagePath: 'assets/java/eclipse.png',
        ),
        AppData(
          description:
              "Apache Hadoop: A distributed storage and processing framework for big data applications. Java's scalability is crucial for handling large-scale data processing tasks.",
          imagePath: 'assets/java/apache.png',
        ),
        AppData(
          description:
              'LinkedIn: The social networking platform relies on Java for its backend services, contributing to the scalability and reliability of the site.',
          imagePath: 'assets/java/linked_in.png',
        ),
        AppData(
          description:
              "Minecraft: A popular sandbox video game written in Java, highlighting the language's suitability for gaming and multimedia applications.",
          imagePath: 'assets/java/minecraft.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> kotlinContent() {
  return [
    OutlineItem(
      imagePath: 'assets/kotlin/kotlin.png',
    ),
    OutlineItem(
      title: 'What is Kotlin?',
      description:
          'Kotlin is a modern, statically-typed programming language developed by JetBrains. Introduced as an alternative to Java for Android development, Kotlin has gained popularity for its conciseness, expressiveness, and seamless interoperability with existing Java code. It is designed to be fully interoperable with Java, allowing developers to leverage existing libraries and frameworks while providing enhanced features such as null safety, extension functions, and improved syntax.',
    ),
    OutlineItem(
      title: 'Why use Kotlin?',
      description:
          "Kotlin is preferred for its concise syntax, reducing boilerplate code and enhancing developer productivity. It offers modern language features, including null safety, smart casts, and extension functions, which contribute to more robust and readable code. Kotlin's seamless interoperability with Java makes it an excellent choice for both new projects and incremental adoption in existing Java codebases.",
    ),
    OutlineItem(
      title: 'How to use Kotlin?',
      description:
          "To use Kotlin, you can set up your development environment with the Kotlin compiler. Kotlin code can be written in a text editor or an integrated development environment (IDE), saved with a .kt extension, and compiled using the 'kotlinc' command. The resulting bytecode can be executed using the Java Virtual Machine (JVM).",
    ),
    OutlineItem(title: 'Kotlin Programming Concepts:', description: '''
1. Hello World:
    fun main() {
        println("Hello, Kotlin!")
    }
    The main function is the entry point of a Kotlin program. println is used to print text to the console.

2. Variables:
    var x = 10
    var variable_name = value : Declares a variable with a specified value. The var keyword indicates a mutable variable.

3. Constants:
    val PI = 3.14
    val constant_name = value : Declares a read-only (immutable) variable, similar to a constant.

4. Data types:
    var number: Int
    var text: String
    var isTrue: Boolean
    Kotlin supports various data types, including integers (Int), strings (String), and booleans (Boolean).

5. Functions:
    fun add(a: Int, b: Int): Int {
        return a + b
    }
    fun function_name(parameters): return_type { /* code */ } : Declares a function with parameters and a return type.

6. Conditional Statements:
    if (condition) {
        // code if condition is false
    } else {
        // code if condition is true
    }
    if (condition) { /* code */ } else { /* code */ } : Executes different code blocks based on a specified condition.

7. Loops:
    for (i in 0 until 5) {
        // code to be executed in each iteration
    }
    Kotlin provides a concise for loop syntax. The until keyword is used to specify the range.

8. Arrays and Lists:
    val number = arrayOf(1, 2, 3, 4, 5)
    val fruits = listOf("apple", "orange", "banana")
    Arrays are created using arrayOf, and lists are created using listOf.

9. Classes and Objects:
    class Person(var name: String, var age: Int)
    val john = Person("John", 30)
    Defines a class with attributes (fields) in the constructor and creates an object of that class.

10. Nullability:
    var nullableValue: String? = null
    Kotlin emphasizes null safety. The "?" indicates that a variable can be assigned null.
'''),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              "Trello: A popular project management tool that uses Kotlin for its Android application, highlighting Kotlin's suitability for modern mobile app development.",
          imagePath: 'assets/kotlin/trello.png',
        ),
        AppData(
          description:
              "Coursera: The online learning platform employs Kotlin for its Android app, showcasing the language's capabilities in delivering a seamless and interactive educational experience.",
          imagePath: 'assets/kotlin/coursera.png',
        ),
        AppData(
          description:
              "Evernote: A note-taking app utilizing Kotlin for Android development, reflecting Kotlin's ability to enhance the efficiency and maintainability of mobile applications.",
          imagePath: 'assets/kotlin/evernote.png',
        ),
        AppData(
          description:
              'Square: The payment processing company employs Kotlin for various Android applications, emphasizing its use in creating secure and efficient financial software.',
          imagePath: 'assets/kotlin/square.png',
        ),
        AppData(
          description:
              "Slack: The team collaboration platform uses Kotlin in its Android app, demonstrating the language's versatility in building robust and user-friendly mobile applications.",
          imagePath: 'assets/kotlin/slack.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> phpContent() {
  return [
    OutlineItem(
      imagePath: 'assets/php/php.png',
    ),
    OutlineItem(
      title: 'What is PHP?',
      description:
          """PHP is a server-side scripting language designed for web development that stands for "Hypertext Preprocessor". PHP is widely used to create dynamic and interactive web pages. It is embedded within HTML code and is executed on the server, generating dynamic content that is then sent to the client's web browser. PHP is one of the most popular server-side scripting languages for web development and is widely used in conjunction with databases and other technologies to build dynamic and feature-rich websites.""",
    ),
    OutlineItem(
      title: 'Why use PHP?',
      description:
          'PHP is a versatile and widely used programming language that is suitable for various web development tasks. Its simplicity, open-source nature, server-side capabilities, and extensive community support make it a popular choice for building dynamic and interactive websites.',
    ),
    OutlineItem(
      title: 'How to use PHP?',
      description:
          'Before using PHP, you need a web server to execute your PHP code. Common choices include Apache, Nginx, or LiteSpeed. You can install these servers separately or use pre-packaged solutions like XAMPP, WampServer, or MAMP for local development. Create a new text file with a .php extension. For example, you can use a text editor like Notepad, Visual Studio Code, or any other code editor.',
    ),
    OutlineItem(title: 'PHP Programming Concepts:', description: r'''
1. Hello World:
    <?
    echo "Hello PHP!";
    ?>

    <?php /* code */ ?> : PHP code is embedded within these tags. echo is used to output text.

2. Variables:
    $x = 10;
    $variable_name = value; : Declares a variable with a specified value.

3. Constant:
    define("PI", 3.14);
    define("CONSTANT_NAME", value); : Declares a constant with an unchangeable value.

4. Data types:
    $number = 24;
    $text = "abs";
    $isTrue = true;
    PHP supports various data types, including integers, strings, and booleans.

5. Functions:
    function add($a, $b) {
        return $a + $b; 
    }
    function function_name(parameters) { /* code */ } : Declares a function with parameters.

6. Conditional Statements:
    if ($condition){
        // code if condition is true
    } else {
        // code if condition is false
    }

    if ($condition) { /* code */ } else { /* code */ } : Executes different code blocks based on a specified condition.

7. Loops:
    for ($i = 0; $i < 5; $i++) {
        // code to be executed in each iteration
    }
    for (initialization; condition; increment/decrement) { /* code */ } : Repeats a block of code as long as a specified condition is true.

8. Arrays:
    $numbers = array(1, 2, 3, 4, 5);
    array(element1, element2, ...) : Creates an array to store multiple elements.

9. Associative Arrays:
    $person = array("name" => "John", "age" => 30);
    Uses key-value pairs to create an associative array.

10. Classes and Objects:
    class Person{
        public $name;
        public $age;
    }
    $john = new Person();
    $john->name = "John";
    $john->age = 30;
    Defines a class with attributes and creates an object of that class.

11. Input from Users:
    $userInput = $_POST['input_name'];
    Takes user input from an HTML form.
'''),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              "WordPress: WordPress is a popular content management system (CMS) written in PHP. It's widely used for creating blogs, websites, and online stores.",
          imagePath: 'assets/php/wordpress.png',
        ),
        AppData(
          description:
              'Joomla: Joomla is another CMS written in PHP, known for its flexibility and extensibility. It is often used for building websites and online applications.',
          imagePath: 'assets/php/joomla.png',
        ),
        AppData(
          description:
              'Drupal: Drupal is a robust CMS written in PHP that is used for building highly customizable websites and web applications.',
          imagePath: 'assets/php/drupal.png',
        ),
        AppData(
          description:
              'Magento: Magento is an open-source e-commerce platform written in PHP. It is widely used for building online stores and managing e-commerce websites.',
          imagePath: 'assets/php/magento.png',
        ),
        AppData(
          description:
              'phpBB: phpBB is a popular open-source forum software written in PHP. It provides a platform for creating online discussion forums.',
          imagePath: 'assets/php/phpbb.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> csharpContent() {
  return [
    OutlineItem(
      imagePath: 'assets/c#/c#.png',
    ),
    OutlineItem(
      title: 'What is C#?',
      description:
          'C# (pronounced C-sharp) is a powerful, object-oriented programming language developed by Microsoft. Introduced in the early 2000s, C# is a key component of the .NET framework and is widely used for building Windows applications, web applications, and enterprise-level software. Known for its strong type-checking, automatic garbage collection, and extensive standard libraries, C# provides a modern and efficient platform for developing a wide range of applications.',
    ),
    OutlineItem(
      title: 'Why use C#?',
      description:
          'C# is favored for its simplicity, versatility, and seamless integration with Microsoft technologies. It offers a clean and expressive syntax, making it easy to read and write code. C# is extensively used for developing Windows applications, web services, and enterprise-level software, and its integration with the .NET framework provides a robust environment for building scalable and maintainable applications.',
    ),
    OutlineItem(
      title: 'How to use C#?',
      description:
          'To use C#, you need to set up a development environment, such as Visual Studio, which is the official integrated development environment for C#. Write your C# code in a text editor or an IDE, save it with a .cs extension, and compile it using the C# compiler (csc). The resulting executable can be run on the .NET runtime.',
    ),
    OutlineItem(
      title: 'C# Programming Concepts:',
      description: r'''
    1. Hello World:
      using System;
      class HelloWorld {
        static void Main() {
          Console.WriteLine("Hello, C#!");
        }
      }
      using System; : Imports the System namespace. Console.WriteLine is used to output text to the console.

    2. Variables:
      int x = 10;
      data_type variable_name = value; : Declares a variable with a specified data type and assigns a value to it.

    3. Constants:
      const double PI = 3.14;
      const data_type CONSTANT_NAME = value; : Declares a constant with an unchangeable value.

    4. Data Types:
      int number;
      string text;
      bool isTrue;
      C# supports various data types, including integers (int), strings (string), and booleans (bool).

    5. Functions (Method):
      static int Add(int a, int b) {
        return a + b;
      }
      static return_type MethodName(parameters) { /* code */ } : Declares a method with parameters and a return type.

    6. Conditional Statement:
      if (condition) {
        // code if condition is false
      } else {
        // code if condition is true
      }
      if (condition) { /* code */ } else { /* code */ } : Executes different code blocks based on a specified condition.

    7. Loops:
      for (int i = 0; i < 5; i++) {
        // code to be executed in each iteration
      }
      for (initialization; condition; increment/decrement) { /* code */ } : Repeats a block of code as long as a specified condition is true.

    8. Arrays:
      int[] numbers = {1, 2, 3, 4, 5};
      data_type[] array_name = {element1, element2, ...} : Creates an array to store multiple elements.

    9. Input from Users:
      int userInput = int.Parse(Console.ReadLine()); 
      Takes user input from the console. Console.ReadLine() reads a line of input, and int.Parse() converts it to an integer.
  ''',
    ),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              'Microsoft Office Suite: C# is used extensively in developing applications within the Microsoft Office Suite, including Microsoft Word, Excel, and Outlook.',
          imagePath: 'assets/c#/msoffice.png',
        ),
        AppData(
          description:
              "Visual Studio IDE: The official integrated development environment for C# itself, showcasing the language's capability in building powerful development tools.",
          imagePath: 'assets/c#/vscode.png',
        ),
        AppData(
          description:
              'Unity3D Game Engine: C# is the primary scripting language for developing games and interactive experiences using the Unity game engine.',
          imagePath: 'assets/c#/unity3d.png',
        ),
        AppData(
          description:
              'Azure DevOps: A suite of development tools and services by Microsoft, utilizing C# for building a comprehensive platform for software development.',
          imagePath: 'assets/c#/azuredevops.png',
        ),
        AppData(
          description:
              "Stack Overflow: The popular programming Q&A community employs C# for its backend development, demonstrating the language's suitability for large-scale web applications.",
          imagePath: 'assets/c#/stackoverflow.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> swiftContent() {
  return [
    OutlineItem(
      imagePath: 'assets/swift/swift.png',
    ),
    OutlineItem(
      title: 'What is Swift?',
      description:
          'Swift is a powerful and modern programming language developed by Apple for building iOS, macOS, watchOS, and tvOS applications. Introduced in 2014, Swift was designed to be fast, safe, and expressive, addressing some of the limitations of Objective-C. It has since become the preferred language for Apple app development due to its readability, performance, and a range of features that simplify the development process.',
    ),
    OutlineItem(
      title: 'Why use Swift?',
      description:
          "Swift is chosen for its speed, safety features, and developer-friendly syntax. It offers concise and expressive code, reducing the potential for errors. Swift's performance is comparable to Objective-C, and its modern features, like optionals and type inference, make it easier for developers to write clean and efficient code. Additionally, Swift seamlessly integrates with existing Objective-C codebases.",
    ),
    OutlineItem(
      title: 'How to use Swift?',
      description:
          "To use Swift, you need Xcode, Apple's official integrated development environment (IDE). Write Swift code in the Xcode editor, save it with a .swift extension, and compile it using the built-in Swift compiler. The resulting binary can be run on iOS devices, macOS, watchOS, or tvOS platforms.",
    ),
    OutlineItem(
      title: 'Swift Programming Concepts:',
      description: r'''
    1. Hello World:
      import Foundation
      print("Hello, Swift!")
      import Foundation: Imports the Foundation framework. print is used to output text to the console.

    2. Variables:
      var x = 1
      var variable_name = value : Declares a variable with a specified value. Variables in Swift are mutable by default.

    3. Constants:
      let pi = 3.14
      let constant_name = value : Declares a constant with an unchangeable value.

    4. Data Types:
      var number: Int
      var text: String
      var isTrue: Bool
      Swift supports various data types, including integers (Int), strings (String), and booleans (Bool).

    5. Functions:
      func add(a: Int, b: Int) -> Int {
        return a + b
      }
      func function_name(parameters) -> return_type { /* code */ } : Declares a function with parameters and a return type.

    6. Conditional Statements:
      if (condition) {
        // code if condition is true
      } else {
        // code if condition is false
      }
      if condition { /* code */ } else { /* code */ } : Executes different code blocks based on a specified condition.

    7. Loops:
      for i in 0..<5 {
        // code to be executed in each iteration
      }
      Swift provides a concise for-in loop syntax. The ..< operator is used to specify the range.

    8. Arrays:
      let numbers = [1, 2, 3, 4, 5]
      Arrays are created using square brackets and can store elements of the same type.

    9. Dictionaries:
      let person = ["name": "John", "age": 30]
      Uses key-value pairs to create a dictionary.

    10. Optionals:
      var nullableValue: String?
      Swift emphasizes optional types to handle the absence of a value (nil).
  ''',
    ),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              "Instagram: The popular photo and video-sharing app's iOS version is developed using Swift, emphasizing the language's capabilities in building responsive and visually appealing mobile applications.",
          imagePath: 'assets/swift/ig.png',
        ),
        AppData(
          description:
              "Uber: Swift is used in the development of Uber's iOS app, contributing to the app's smooth user experience and real-time navigation features.",
          imagePath: 'assets/swift/uber.png',
        ),
        AppData(
          description:
              "LinkedIn: The professional networking platform utilizes Swift for its iOS app, showcasing the language's suitability for creating robust and feature-rich mobile applications.",
          imagePath: 'assets/swift/linked_in.png',
        ),
        AppData(
          description:
              "Waze: The navigation and traffic app uses Swift for its iOS version, highlighting the language's effectiveness in building location-based and real-time traffic applications.",
          imagePath: 'assets/swift/waze.png',
        ),
        AppData(
          description:
              "Duolingo: The language learning app employs Swift for its iOS application, demonstrating the language's utility in creating interactive and educational mobile experiences.",
          imagePath: 'assets/swift/duolingo.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> rContent() {
  return [
    OutlineItem(
      imagePath: 'assets/r/r.png',
    ),
    OutlineItem(
      title: 'What is R?',
      description:
          ' R is a powerful and open-source programming language designed for statistical computing and data analysis. Developed by Ross Ihaka and Robert Gentleman in the early 1990s, R has become a prominent language in the field of statistics and data science. It offers extensive libraries, packages, and tools for manipulating, analyzing, and visualizing data, making it a preferred choice for statisticians, data scientists, and researchers.',
    ),
    OutlineItem(
      title: 'Why use R?',
      description:
          "R is widely used in statistical modeling, data analysis, and visualization due to its rich ecosystem of packages and libraries. It provides specialized functions and tools for tasks such as regression analysis, hypothesis testing, and machine learning. R's flexibility and ease of use make it an excellent choice for those working with data-intensive applications.",
    ),
    OutlineItem(
      title: 'How to use R?',
      description:
          'To use R, you need to install the R programming environment on your system. R scripts are typically written in a text editor and saved with a .R extension. RStudio, an integrated development environment for R, is commonly used for its user-friendly interface and additional features. R code can be executed line by line or as a complete script, and the results are displayed interactively.',
    ),
    OutlineItem(
      title: 'R Programming Concepts:',
      description: r'''
    1. Hello World:
      print("Hello, R!")
      print("text") : Outputs text to the console.

    2. Variables:
      x <- 10
      <- or = is used to assign a value to a variable.

    3. Data Types:
      number <- 3
      text <- "r"
      isTrue <- TRUE
      R supports various data types, including numeric, character, and logical.

    4. Vectors:
      number <- c(1, 2, 3)
      c(element1, element2, …) : Creates a vector to store multiple elements.

    5. Functions:
      add <- function(a, b) {
        return (a + b)
      }
      function(parameters) { /* code */ } : Declares a function with parameters.

    6. Conditional Statements:
      if (condition) {
        # code if condition is true
      } else {
        # code if condition is false
      }
      if (condition) { # code } else { # code } : Executes different code blocks based on a specified condition.

    7. Loops:
      for (i in 1:5) {
        # code to be executed in each iteration
      }
      R provides a concise for loop syntax. 1:5 specifies the range.

    8. Data Frames:
      person <- data.frame(name = c("John", "Jane"), age = c(30, 25))
      Creates a data frame with columns.

    9. Lists:
      my_list <- list(numbers, text, isTrue)
      Creates a list that can contain elements of different types.

    10. Matrices:
      matrix_data <- matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2)
      Creates a matrix with specified dimensions.

    11. Reading Data from CSV:
      data <- read.csv("data.csv")
      Reads data from a CSV file into a data frame.
  ''',
    ),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              'RStudio: While not an app per se, RStudio is a widely used integrated development environment (IDE) for R that supports coding, debugging, and visualization, making it an essential tool for R developers.',
          imagePath: 'assets/r/rstudio.png',
        ),
        AppData(
          description:
              'Shiny: An R package that allows the creation of interactive web applications directly from R, providing a platform for sharing data analyses and visualizations.',
          imagePath: 'assets/r/shiny.png',
        ),
        AppData(
          description:
              'Bioconductor: An open-source project for the analysis and comprehension of genomic data, utilizing R for bioinformatics and computational biology.',
          imagePath: 'assets/r/bioconductor.png',
        ),
        AppData(
          description:
              'ggplot2: A data visualization package for R that enables the creation of highly customizable and publication-quality graphics.',
          imagePath: 'assets/r/ggplot2.png',
        ),
        AppData(
          description:
              'dplyr: A popular R package for data manipulation and analysis, offering a set of functions for efficiently filtering, grouping, and summarizing data in a user-friendly manner.',
          imagePath: 'assets/r/dplyr.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> rubyContent() {
  return [
    OutlineItem(
      imagePath: 'assets/ruby/ruby.png',
    ),
    OutlineItem(
      title: 'What is Ruby?',
      description:
          'Ruby is a dynamic, object-oriented programming language designed for simplicity and productivity. Created by Yukihiro Matsumoto in the mid-1990s, Ruby emphasizes the principle of "optimization for developer happiness." Known for its elegant syntax and readability, Ruby is often used in web development, scripting, and automation. Ruby on Rails, a popular web application framework, is built using the Ruby language.',
    ),
    OutlineItem(
      title: 'Why use Ruby?',
      description:
          "Ruby is favored for its readability and developer-friendly syntax, enabling rapid and efficient coding. It follows the principle of convention over configuration, reducing the need for boilerplate code. Ruby's object-oriented nature and dynamic typing make it versatile, allowing developers to write clean and expressive code. The Ruby on Rails framework further enhances web development productivity.",
    ),
    OutlineItem(
      title: 'How to use Ruby?',
      description:
          "To use Ruby, you need to install the Ruby interpreter on your system. Ruby code can be written in a text editor or an integrated development environment (IDE), saved with a .rb extension, and executed using the 'ruby' command. Ruby supports both procedural and object-oriented programming paradigms.",
    ),
    OutlineItem(
      title: 'Ruby Programming Concepts:',
      description: '''
    1. Hello World:
      puts "Hello, Ruby!"
      puts "text" : Outputs text to the console with a newline.

    2. Variables:
      x = 10
      variable_name = value : Declares a variable with a specified value.

    3. Data Types:
      number = 3
      text = "r"
      is_true = true
      Ruby supports various data types, including integers, strings, and booleans.

    4. Arrays:
      numbers = [1, 2, 3, 4, 5]
      Uses square brackets to create an array to store multiple elements.

    5. Hashes (Key-Value Pairs):
      person = {"name" => "John", "age" => 30}
      Creates a hash with key-value pairs.

    6. Functions:
      def add(a, b)
        return a + b
      end
      def method_name(parameters) # code end : Declares a method with parameters.

    7. Conditional Statements:
      if condition
        # code if condition is true
      else
        # code if condition is false
      end
      if condition # code else # code end : Executes different code blocks based on a specified condition.

    8. Loops:
      for i in 0..4
        # code to be executed in each iteration
      end
      Ruby provides a concise for loop syntax. 0..4 specifies the range.

    9. Symbols:
      symbol = :example
      Represents a symbol, which is a lightweight, immutable identifier.

    10. Reading Data from File:
      file_content = File.read("example.txt")
      Reads data from a file into a string.
  ''',
    ),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              'Ruby on Rails (RoR): While not an app itself, Ruby on Rails is a popular web application framework developed in Ruby. It has been used to build numerous web applications, including Basecamp, GitHub, and Shopify.',
          imagePath: 'assets/ruby/ruby_on_rails.png',
        ),
        AppData(
          description:
              "GitHub: A web-based platform for version control using Git, GitHub is a widely used service developed using Ruby on Rails, showcasing the language's effectiveness in building scalable and collaborative development tools.",
          imagePath: 'assets/ruby/github.png',
        ),
        AppData(
          description:
              "Shopify: An e-commerce platform that utilizes Ruby on Rails for its backend, demonstrating the language's suitability for creating robust and scalable online shopping experiences.",
          imagePath: 'assets/ruby/shopify.png',
        ),
        AppData(
          description:
              'Airbnb: The online marketplace for lodging and travel uses Ruby on Rails, highlighting its use in creating dynamic and user-friendly platforms.',
          imagePath: 'assets/ruby/airbnb.png',
        ),
        AppData(
          description:
              "Discourse: An open-source discussion platform for community forums, developed using Ruby on Rails, emphasizing Ruby's applicability in building interactive and scalable web applications.",
          imagePath: 'assets/ruby/discourse.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> cAndcplusplusContent() {
  return [
    OutlineItem(
      imagePath: 'assets/c and c++/c and c++.png',
    ),
    OutlineItem(
      title: 'What is C and C++?',
      description:
          'C and C++ are widely-used programming languages known for their efficiency, flexibility, and close-to-the-hardware capabilities. Developed in the early 1970s by Dennis Ritchie, C is a procedural language often utilized for system-level programming and low-level operations. C++, an extension of C developed by Bjarne Stroustrup in the late 1970s, introduces object-oriented features, allowing for modular and reusable code. Both languages have been pivotal in shaping the foundations of modern software development and are employed in a diverse range of applications, from operating systems and game development to embedded systems.',
    ),
    OutlineItem(
      title: 'Why use C and C++?',
      description:
          'C and C++ are chosen for their performance, efficiency, and versatility. C is valued for its low-level programming capabilities, making it suitable for system-level tasks and scenarios requiring direct hardware control. C++ extends C by adding object-oriented features, providing developers with the benefits of modularity and code reuse. Both languages are widely used in developing high-performance applications, including real-time systems, game engines, and operating systems.',
    ),
    OutlineItem(
      title: 'How to use C and C++?',
      description:
          'To use C and C++, you need to write source code in a text editor or an integrated development environment (IDE). The code is then saved with a .c or .cpp extension, respectively. Compilation is done using a compiler such as GCC (GNU Compiler Collection), generating executable files that can be run on the target platform. C and C++ follow a procedural paradigm, with C++ incorporating object-oriented concepts.',
    ),
    OutlineItem(
      title: 'C Programming Concepts:',
      description: '''
    1. Comments:
      Syntax: /* This is a comment */ or // This is a comment
      Description: Comments are used for providing information about the code and are ignored by the compiler.

    2. Variables:
      Syntax: int x;
      Description: Variables are used to store data. They must be declared with a data type before use.

    3. Data Types:
      Syntax: int, float, char, etc.
      Description: Data types specify the type of data a variable can hold.

    4. Functions:
      Syntax: returnType functionName(parameters) { /* code */ }
      Description: Functions are blocks of code that perform a specific task. The main function is the entry point of a C program.

    5. Conditional Statements:
      Syntax:
      if (condition) {
        // code if condition is true
      } else {
        // code if condition is false
      }
      Description: Conditional statements are used for decision-making.

    6. Loops:
      Syntax:
      for (initialization; condition; update) {
        // code to be executed
      }
      while (condition) {
        // code to be executed
      }
      Description: Loops are used for repetitive tasks.

    7. Arrays:
      Syntax: int array[5];
      Description: Arrays are used to store a collection of elements of the same data type.

    8. Pointers:
      Syntax: int *ptr;
      Description: Pointers store the memory address of another variable.
  ''',
    ),
    OutlineItem(
      title: 'C++ Programming Concepts:',
      description: '''
    In addition to the features in C, C++ includes the following:

    1. Classes and Objects:
      Syntax:
      class MyClass {
        // class members
      };
      Description: Classes are used to define user-defined data types, and objects are instances of these classes.

    2. Constructor and Destructor:
      Syntax:
      MyClass() {
        // constructor code
      }
      ~MyClass() {
        // destructor code
      }
      Description: Constructors initialize objects, and destructors clean up resources when the object goes out of scope.

    3. Inheritance:
      Syntax:
      class DerivedClass : public BaseClass {
        // derived class members
      };
      Description: Inheritance allows a class to inherit properties and behaviors from another class.

    4. Polymorphism:
      Syntax: Achieved through function overloading and virtual functions.
      Description: Polymorphism allows objects of different types to be treated as objects of a common base type.

    5. Encapsulation:
      Syntax: Achieved by using access specifiers (public, private, protected).
      Description: Encapsulation restricts access to certain components of a class, providing data hiding and security.

    6. Templates:
      Syntax:
      template <class T>
      T add(T a, T b) {
        return a + b;
      }
      Description: Templates allow writing generic functions and classes.
  ''',
    ),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              'Microsoft Windows Operating System: The core components of the Windows operating system are developed using a combination of C and C++, showcasing their efficiency in building complex and high-performance software.',
          imagePath: 'assets/c and c++/mswindows.png',
        ),
        AppData(
          description:
              'Adobe Systems Software Suite: Applications like Adobe Photoshop and Adobe Illustrator are developed using C++ for their graphical and computational intensity.',
          imagePath: 'assets/c and c++/adobe.png',
        ),
        AppData(
          description:
              "Mozilla Firefox: The popular web browser is primarily developed using C++ for its rendering engine and core functionalities, emphasizing the language's use in building browser technologies.",
          imagePath: 'assets/c and c++/mozilla.png',
        ),
        AppData(
          description:
              'MySQL Database: A widely-used relational database management system that is implemented in C++ for its performance and efficiency in handling large datasets.',
          imagePath: 'assets/c and c++/mysql.png',
        ),
        AppData(
          description:
              'Game Engines (e.g., Unreal Engine): Many game engines, including Unreal Engine, use C++ for developing video games due to its performance and ability to directly interact with hardware components.',
          imagePath: 'assets/c and c++/unreal.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> matlabContent() {
  return [
    OutlineItem(
      imagePath: 'assets/matlab/matlab.png',
    ),
    OutlineItem(
      title: 'What is MATLAB?',
      description:
          'MATLAB, short for "Matrix Laboratory," is a high-level programming language and interactive environment primarily used for numerical computing, data analysis, and visualization. Developed by MathWorks, MATLAB provides a comprehensive set of tools and functions for matrix manipulations, algorithm implementation, and the creation of graphical user interfaces. It is widely employed in academia, industry, and research for applications ranging from engineering simulations to financial modeling and image processing.',
    ),
    OutlineItem(
      title: 'Why use MATLAB?',
      description:
          "MATLAB is favored for its powerful built-in functions, toolboxes, and extensive libraries tailored for numerical and scientific computing. It excels in handling matrices and multidimensional data, making it particularly suitable for mathematical modeling, data analysis, and simulations. MATLAB's user-friendly syntax, along with its rich visualization capabilities, simplifies the implementation of complex mathematical algorithms and facilitates rapid prototyping.",
    ),
    OutlineItem(
      title: 'How to use MATLAB?',
      description:
          'Using MATLAB involves writing scripts or functions in the MATLAB language, which is based on the syntax of linear algebra. The MATLAB environment provides an interactive command-line interface where users can execute commands, visualize data, and debug code. MATLAB scripts can also be saved and executed as standalone programs, and MATLAB supports the creation of graphical user interfaces for user-friendly interactions.',
    ),
    OutlineItem(
      title: 'MATLAB Programming Concepts:',
      description: '''
    1. Comments:
      Syntax: % This is a comment
      Description: Comments start with the % symbol and are used to provide information about the code. They are ignored by the MATLAB interpreter.

    2. Variables:
      Syntax: variable = value;
      Description: Variables in MATLAB are created by assigning a value to them. MATLAB is dynamically typed, so you don't need to declare the data type explicitly.

    3. Vectors and Matrices:
      Syntax:
      vector = [1, 2, 3];
      matrix = [1, 2, 3; 4, 5, 6; 7, 8, 9];
      Description: MATLAB is designed to work with arrays, which can be vectors (1D arrays) or matrices (2D arrays).

    4. Functions:
      Syntax:
      function output = functionName(input)
        % code 
      end
      Description: Functions in MATLAB are defined using the function keyword. They can take inputs and return outputs.

    5. Scripts:
      Syntax: A series of MATLAB commands in a script file (.m file).
      Description: Scripts are used to execute a sequence of MATLAB commands. They are often used for automation and reproducibility.

    6. Plotting:
      Syntax:
      x = linspace(0, 2*pi, 100); 
      y = sin(x);
      plot(x, y); 
      Description: MATLAB is widely used for data visualization. The plot function is just one example of its plotting capabilities.

    7. Control Flow:
      Syntax:
      if condition
        % code executed if the condition is true 
      else
        % code executed if the condition is false 
      end
      for i = 1:5
        % code to be executed in the loop 
      end
      Description: MATLAB supports standard control flow constructs like if, else, for, while, etc.

    8. Built-in Functions:
      Syntax: MATLAB provides numerous built-in functions for various mathematical operations, signal processing, linear algebra, and more.
      Description: Examples include sum, mean, max, min, size, length, etc.

    9. Cell Arrays and Structures:
      Syntax:
      cellArray = {1, 'hello', [2, 3]};
      structure.field1 = 42;
      structure.field2 = 'world';
      Description: MATLAB supports cell arrays and structures for more complex data organization.
  ''',
    ),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              'Simulink: An add-on product for MATLAB, Simulink is widely used for modeling, simulating, and analyzing multi domain dynamical systems. It finds applications in control systems, signal processing, and communications.',
          imagePath: 'assets/matlab/simulink.png',
        ),
        AppData(
          description:
              'MATLAB Mobile: The mobile version of MATLAB allows users to access MATLAB on smartphones and tablets, providing a portable platform for data analysis and visualization.',
          imagePath: 'assets/matlab/matlab.png',
        ),
        AppData(
          description:
              "Image Processing Toolbox: MATLAB's Image Processing Toolbox is used in various applications, including medical imaging, remote sensing, and computer vision, enabling developers to perform advanced image analysis and manipulation.",
          imagePath: 'assets/matlab/matlab.png',
        ),
        AppData(
          description:
              "Aerospace Toolbox: MATLAB's Aerospace Toolbox is utilized in the aerospace industry for modeling and simulating aircraft and spacecraft dynamics, control systems, and orbital mechanics.",
          imagePath: 'assets/matlab/matlab.png',
        ),
        AppData(
          description:
              'MATLAB Compiler: MATLAB Compiler enables the creation of standalone executables or web applications from MATLAB code, allowing users to deploy their MATLAB applications without requiring a MATLAB installation.',
          imagePath: 'assets/matlab/matlab.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> typescriptContent() {
  return [
    OutlineItem(
      imagePath: 'assets/typescript/typescript.png',
    ),
    OutlineItem(
      title: 'What is TypeScript?',
      description:
          'TypeScript is a superset of JavaScript that adds static typing to the language. Developed by Microsoft, TypeScript aims to enhance the development experience by providing a layer of static typing, interfaces, and other features not present in standard JavaScript. TypeScript code is transpiled into JavaScript, making it compatible with existing JavaScript environments and allowing developers to take advantage of modern language features while maintaining broad browser support.',
    ),
    OutlineItem(
      title: 'Why use TypeScript?',
      description:
          'TypeScript is used to improve code maintainability and catch errors during development. The addition of static typing allows developers to define the types of variables, parameters, and return values, catching potential bugs before runtime. This leads to more robust and maintainable code, especially in large codebases. TypeScript also supports modern ECMAScript features and can be seamlessly integrated into existing JavaScript projects.',
    ),
    OutlineItem(
      title: 'How to use TypeScript?',
      description:
          'To use TypeScript, developers write code in the TypeScript language, which is similar to JavaScript but with the addition of type annotations. The TypeScript compiler (tsc) is then used to transpile the TypeScript code into standard JavaScript, which can be executed in any JavaScript runtime environment. TypeScript can be integrated into various development workflows, including web development with frameworks like Angular.',
    ),
    OutlineItem(
      title: 'TypeScript Programming Concepts:',
      description: '''
    1. Variable Declarations:
      Syntax: let variable: type = value;
      Description: Variables can be declared with a specific type, and TypeScript will enforce that the variable holds values of that type.

    2. Data Types:
      Syntax: number, string, boolean, any, etc.
      Description: TypeScript supports various data types, including primitives like numbers and strings, as well as more complex types.

    3. Functions:
      Syntax:
      function add ( x: number, y: number ):number{
        return x + y;
      }
      Description: Functions can have defined input and output types. TypeScript checks that function calls match the expected types.

    4. Interfaces:
      Syntax:
      interface Person {
        name: string;
        age: number;
      }
      Description: Interfaces define a contract for the structure of an object. Objects implementing an interface must adhere to its structure.

    5. Arrays:
      Syntax: let numbers: number[] = [1, 2, 3];
      Description: Arrays can be typed to enforce that they only contain elements of a certain type.

    6. Union and Intersection Types:
      Syntax: let value: string : number;
      Description: Union types allow a variable to hold values of multiple types, while intersection types combine multiple types into one.

    7. Type Assertions:
      Syntax: let strLength: number = (<string>someValue).length;
      Description: Type assertions allow you to override TypeScript's inferred or expected type.

    8. Enums:
      Syntax:
      enum Color {
        Red,
        Green
      } 
      Description: Enums allow you to define a set of named numeric constants.
  ''',
    ),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              'Angular: A widely-used web application framework developed by Google. Angular is built with TypeScript and provides a structured and scalable way to build dynamic web applications.',
          imagePath: 'assets/typescript/angular.png',
        ),
        AppData(
          description:
              'Microsoft Office Online: TypeScript is extensively used in the development of Microsoft Office Online applications, such as Word and Excel, enhancing code maintainability and enabling efficient collaboration.',
          imagePath: 'assets/typescript/msoffice.png',
        ),
        AppData(
          description:
              'Asana: A popular project management tool that utilizes TypeScript for its web application, ensuring a robust and scalable codebase for managing tasks and projects.',
          imagePath: 'assets/typescript/asana.png',
        ),
        AppData(
          description:
              'Slack: The team collaboration platform uses TypeScript for its frontend development, enabling a more structured and error-resistant codebase for the user interface.',
          imagePath: 'assets/typescript/slack.png',
        ),
        AppData(
          description:
              "VS Code: Microsoft's Visual Studio Code, a widely-used code editor, is written in TypeScript. TypeScript's features contribute to the development experience within the editor, providing features like intelligent code completion and error checking.",
          imagePath: 'assets/typescript/vscode.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> scalaContent() {
  return [
    OutlineItem(
      imagePath: 'assets/scala/scala.png',
    ),
    OutlineItem(
      title: 'What is Scala?',
      description:
          'Scala is a powerful and statically-typed programming language that combines functional and object-oriented programming paradigms. Designed to be concise and expressive, Scala runs on the Java Virtual Machine (JVM) and seamlessly integrates with existing Java code. Developed by Martin Odersky and his team, Scala emphasizes the importance of scalability, making it suitable for a wide range of applications, from small scripts to large-scale, distributed systems.',
    ),
    OutlineItem(
      title: 'Why use Scala?',
      description:
          "Scala is chosen for its versatility, conciseness, and compatibility with Java. It provides strong support for functional programming, allowing developers to write expressive and concise code. Additionally, Scala's seamless interoperability with Java enables easy integration with existing Java libraries and frameworks. Its scalability and support for concurrent programming make it well-suited for building robust and high-performance applications.",
    ),
    OutlineItem(
      title: 'How to use Scala?',
      description:
          "To use Scala, you need to have the Scala compiler installed on your system. Scala code can be written in a text editor or an integrated development environment (IDE), saved with a .scala extension, and compiled using the 'scalac' command. The resulting bytecode can be run on the JVM using the 'scala' command. Scala supports both scripting and application development.",
    ),
    OutlineItem(
      title: 'Scala Programming Concepts:',
      description: r'''
    1. Variable Declarations:
      Syntax: val x: Int = 10
      Description: Variables can be declared using val (immutable) or var (mutable), with an explicit type annotation.

    2. Data Types:
      Syntax: Int, String, Boolean, Any, etc.
      Description: Scala supports a variety of data types, including both primitive types and reference types.

    3. Functions:
      Syntax:
      def add(x: Int, y: Int): Int = {
        x + y
      }
      Description: Functions are defined using the def keyword. Scala allows the type to be inferred, but you can also specify it explicitly.

    4. Classes and Objects:
      Syntax:
      class Person(name: String, age: Int) {
        def greet(): Unit = {
          println(s"Hello, my name is $name and I am $age years old.")
        }
      }
      Description: Classes encapsulate data and behavior. Objects can be created from classes.

    5. Traits:
      Syntax:
      trait Printable {
        def print(): Unit
      }
      Description: Traits are similar to interfaces in other languages and can be mixed into classes to provide additional functionality.

    6. Pattern Matching:
      Syntax:
      val result = value match {
        case 0 => "Zero"
        case 1 => "One"
        case _ => "Other"
      }
      Description: Pattern matching is a powerful feature used for matching values against patterns.

    7. Collections:
      Syntax:
      val list = List(1, 2, 3, 4, 5) 
      val map = Map("a" -> 1, "b" -> 2)
      Description: Scala has a rich set of collection types, including lists, sets, maps, etc.

    8. Higher-Order Functions:
      Syntax:
      def operateOnList(list: List[Int], f: Int => Int): List[Int] = {
        list.map(f)
      }
      Description: Scala supports higher-order functions, allowing functions to be passed as arguments or returned as results.

    9. Option and Some/None:
      Syntax:
      val maybeValue: Option[Int] = Some(42)
      Description: Scala uses Option to handle the presence or absence of a value, with Some representing a value and None representing the absence.

    10. Case Classes:
      Syntax:
      case class Point(x: Int, y: Int)
      Description: Case classes are immutable and come with built-in support for pattern matching.

    11. Implicits:
      Syntax:
      implicit def intToString(x: Int): String = x.toString
      Description: Implicits are used for automatic conversions and parameters passed automatically.
  ''',
    ),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              "Twitter: Scala is extensively used in the development of Twitter's backend infrastructure. The language's concurrency and scalability features contribute to handling the high traffic and real-time nature of the social media platform.",
          imagePath: 'assets/scala/twtr.png',
        ),
        AppData(
          description:
              "LinkedIn: The professional networking platform employs Scala for its backend services, demonstrating the language's suitability for building robust and scalable enterprise applications.",
          imagePath: 'assets/scala/linked_in.png',
        ),
        AppData(
          description:
              "Apache Spark: A distributed data processing engine for big data analytics, Apache Spark is developed in Scala. Scala's functional programming capabilities are crucial for Spark's expressive and efficient data processing.",
          imagePath: 'assets/scala/apache.png',
        ),
        AppData(
          description:
              "Coursera: The online learning platform uses Scala in its backend services, showcasing the language's applicability in providing scalable and reliable educational platforms.",
          imagePath: 'assets/scala/coursera.png',
        ),
        AppData(
          description:
              "Etsy: The e-commerce platform utilizes Scala for various components of its infrastructure, emphasizing the language's effectiveness in building large-scale, transactional systems.",
          imagePath: 'assets/scala/etsy.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> sqlContent() {
  return [
    OutlineItem(
      imagePath: 'assets/sql/sql.png',
    ),
    OutlineItem(
      title: 'What is SQL?',
      description:
          'SQL, or Structured Query Language, is a domain-specific programming language designed for managing and manipulating relational databases. Developed in the 1970s, SQL provides a standardized way to interact with relational database management systems (RDBMS). It enables users to perform tasks such as querying data, inserting, updating, and deleting records, defining and modifying database structures, and managing access permissions. SQL is used by developers, database administrators, and analysts for working with data stored in relational databases.',
    ),
    OutlineItem(
      title: 'Why use SQL?',
      description:
          'SQL is essential for database management and data manipulation in relational databases. It offers a declarative syntax that allows users to express complex queries and operations in a concise and readable manner. SQL provides a standardized way to interact with various relational database systems, making it a crucial skill for anyone dealing with data management, analytics, and application development involving databases.',
    ),
    OutlineItem(
      title: 'How to use SQL?',
      description:
          'Using SQL involves writing queries and statements to interact with a relational database. SQL commands can be executed through database management systems (DBMS) like MySQL, PostgreSQL, Microsoft SQL Server, or Oracle. SQL statements can be issued through command-line interfaces, graphical user interfaces (GUIs), or integrated into application code to perform various operations on the data.',
    ),
    OutlineItem(title: 'SQL Statements and Clauses:', description: '''
    1. SELECT Statement:
      Syntax: SELECT column1, column2 FROM table WHERE condition;
      Description: Retrieves data from one or more tables based on specified columns and conditions.

    2. INSERT INTO Statement:
      Syntax: INSERT INTO table (column1, column2) VALUES (value1, value2);
      Description: Adds new records to a table with specified column values.

    3. UPDATE Statement:
      Syntax: UPDATE table SET column1 = value1 WHERE condition;
      Description: Modifies existing records in a table based on a specified condition.

    4. DELETE FROM Statement:
      Syntax: DELETE FROM table WHERE condition;
      Description: Removes records from a table based on a specified condition.

    5. CREATE TABLE Statement:
      Syntax: CREATE TABLE table_name (column1 datatype, column2 datatype, ...);
      Description: Defines a new table with specified columns and data types.

    6. ALTER TABLE Statement:
      Syntax: ALTER TABLE table_name ADD COLUMN column_name datatype;
      Description: Adds a new column to an existing table.

    7. DROP TABLE Statement:
      Syntax: DROP TABLE table_name;
      Description: Deletes an existing table and its data.

    8. CREATE INDEX Statement:
      Syntax: CREATE INDEX index_name ON table_name (column1, column2);
      Description: Creates an index on specified columns to improve query performance.

    9. SELECT DISTINCT Clause:
      Syntax: SELECT DISTINCT column FROM table;
      Description: Retrieves unique values from a specified column.

    10. WHERE Clause:
      Syntax: SELECT * FROM table WHERE condition;
      Description: Filters records based on a specified condition in the WHERE clause.

    11. ORDER BY Clause:
      Syntax: SELECT column FROM table ORDER BY column [ASC|DESC];
      Description: Sorts the result set in ascending or descending order.

    12. GROUP BY Clause:
      Syntax: SELECT column, COUNT(*) FROM table GROUP BY column;
      Description: Groups rows with the same values in specified columns, often used with aggregate functions.

    13. HAVING Clause:
      Syntax: SELECT column, COUNT(*) FROM table GROUP BY column HAVING COUNT(*) > 1;
      Description: Filters grouped results based on a specified condition.

    14. JOIN Clause:
      Syntax: SELECT table1.column, table2.column FROM table1 JOIN table2 ON table1.common_column = table2.common_column;
      Description: Combines rows from multiple tables based on related columns.
  '''),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              'MySQL Workbench: A visual database design tool and SQL development environment used for managing and developing MySQL databases.',
          imagePath: 'assets/sql/mysqlworkbench.png',
        ),
        AppData(
          description:
              'Microsoft SQL Server Management Studio (SSMS): A tool for managing, configuring, and administering Microsoft SQL Server databases, providing a comprehensive interface for SQL-related tasks.',
          imagePath: 'assets/sql/smms.png',
        ),
        AppData(
          description:
              'Oracle SQL Developer: An integrated development environment for Oracle databases, allowing developers to manage and query Oracle databases efficiently.',
          imagePath: 'assets/sql/oracle.png',
        ),
        AppData(
          description:
              'phpMyAdmin: A web-based administration tool for MySQL databases, enabling users to manage their MySQL databases through a web interface using SQL commands.',
          imagePath: 'assets/sql/phpmyadmin.png',
        ),
        AppData(
          description:
              'SQLite Database Browser: A desktop application that allows users to browse, create, and manage SQLite database files, providing a graphical interface for SQL operations on SQLite databases.',
          imagePath: 'assets/sql/sqlite.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> htmlContent() {
  return [
    OutlineItem(
      imagePath: 'assets/html/html.png',
    ),
    OutlineItem(
      title: 'What is HTML?',
      description:
          'HTML, or HyperText Markup Language, is not a traditional programming language but a markup language used to structure content on the web. Developed by Tim Berners-Lee in the early 1990s, HTML provides a standardized way to create documents containing text, images, links, and other media elements. HTML uses a system of tags to define the structure of a document, with each tag indicating the role of the enclosed content, such as paragraphs, headings, lists, and links. It serves as the foundation for building web pages and is often used in conjunction with CSS (Cascading Style Sheets) for styling and JavaScript for interactivity.',
    ),
    OutlineItem(
      title: 'Why use HTML?',
      description:
          'HTML is essential for creating web pages and is the backbone of the World Wide Web. It provides a structured way to organize and present content, ensuring consistency and compatibility across different web browsers. HTML enables the creation of accessible and well-organized documents, forming the basis for a user-friendly and standardized web experience.',
    ),
    OutlineItem(
      title: 'How to use HTML?',
      description:
          'Using HTML involves writing markup code that defines the structure and content of a web page. HTML documents are plain text files with a .html extension. A basic HTML document consists of opening and closing tags that wrap around content to indicate its type and purpose. HTML can be written in a simple text editor and saved with a .html extension. The HTML file can then be opened in a web browser to view the rendered web page.',
    ),
    OutlineItem(title: 'HTML Elements and Structures:', description: '''
    1. Document Structure:
      Syntax:
      <!DOCTYPE html>
      <html>
        <head>
          <title> Page Title</title>
        </head>
        <body>
          <!-- Content goes here -->
        </body>
      </html>
      Description: Defines the basic structure of an HTML document.

    2. Headings:
      Syntax: <h1>Heading 1</h1> to <h6>Heading 6</h6>
      Description: Defines headings with varying levels of importance.

    3. Paragraphs:
      Syntax: <p>This is a paragraph.</p>
      Description: Represents text paragraphs.

    4. Links:
      Syntax: <a href="https://example.com">Visit Example</a>
      Description: Creates hyperlinks to navigate to other web pages or resources.

    5. Images:
      Syntax: <img src="image.jpg" alt="Description">
      Description: Embeds images into the webpage.

    6. Lists:
      Unordered List Syntax: <ul><li>Item 1</li><li>Item 2</li></ul> 
      Ordered List Syntax: <ol><li>Item 1</li><li>Item 2</li></ol>
      Description: Creates unordered (bulleted) or ordered (numbered) lists.

    7. Tables:
      Syntax:
      <table>
        <tr>
          <th>Header 1</th>
          <th>Header 2</th>
        </tr>
      </table>
      Description: Defines tables with rows and cells.

    8. Forms:
      Syntax:
      <form action="/submit" method="post">
        <label for="username"> Username: </label>
        <input type="text" id="username" name="username" required>
        <input type="submit" value="Submit">
      </form>
      Description: Creates input forms for user interaction.

    9. Input Elements:
      Syntax:
      <input type="checkbox" name="subscribe" checked>
      <input type="text" name="firstname" placeholder="First Name">
      Description: Various input elements for user input.

    10. Divisions:
      Syntax: <div>This is a division.</div>
      Description: Defines a generic container for styling and layout purposes.

    11. Comments:
      Syntax: <!-- This is a comment -->
      Description: Comments for adding notes to the code.

    12. Style and Formatting:
      Syntax: <em>Italic Text</em>
      Description: Provides styling and formatting for text.

    13. Attributes:
      Syntax: <tagname attribute="value">Content</tagname>
      Description: HTML elements can have attributes providing additional information.
  '''),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              'Google Docs: While not a traditional app, Google Docs is a web-based word processing application that extensively uses HTML for rendering documents in the browser.',
          imagePath: 'assets/html/gdocs.png',
        ),
        AppData(
          description:
              'WordPress: A popular content management system (CMS) for creating and managing websites. WordPress themes and content are built using HTML.',
          imagePath: 'assets/html/wordpress.png',
        ),
        AppData(
          description:
              'Slack: The team collaboration platform utilizes HTML for its web-based interface, allowing users to interact with channels, messages, and other features.',
          imagePath: 'assets/html/slack.png',
        ),
        AppData(
          description:
              'Trello: A project management tool that uses HTML to structure and render boards, cards, and other elements in a visually appealing way.',
          imagePath: 'assets/html/trello.png',
        ),
        AppData(
          description:
              'Evernote Web: The web version of the note-taking application Evernote uses HTML to structure and present notes, allowing users to access their content through a web browser.',
          imagePath: 'assets/html/evernote.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> cssContent() {
  return [
    OutlineItem(
      imagePath: 'assets/css/css.png',
    ),
    OutlineItem(
      title: 'What is CSS?',
      description:
          'CSS stands for Cascading Style Sheets, is a stylesheet language used to describe the presentation and formatting of a document written in HTML or XML. It plays a crucial role in web development by allowing developers to control the layout, appearance, and styling of web pages. CSS is used to define how HTML elements should be displayed on different devices and screen sizes.',
    ),
    OutlineItem(
      title: 'Why use CSS?',
      description:
          'CSS is a critical technology in modern web development, working alongside HTML and JavaScript to create visually appealing and interactive web pages. It allows developers to control the aesthetics of a website, ensuring a consistent and user-friendly experience across different devices and platforms.',
    ),
    OutlineItem(
      title: 'How to use CSS?',
      description:
          'Using CSS involves writing style rules that define how HTML elements should be presented and styled on a web page. Create a new text file with a .css extension. You can use a text editor or a code editor like Visual Studio Code, Sublime Text, or Atom. Open your HTML file in a web browser to see the styled output. Make sure your CSS file is saved and linked correctly. Experiment with different styles, layouts, and properties. As you become more proficient, explore advanced CSS concepts such as flexbox, grid layout, animations, and CSS preprocessors.',
    ),
    OutlineItem(title: 'CSS Basics:', description: '''
    1. Selector:
      Syntax: selector { /* styles */ }
      Description: Targets HTML elements to apply styles.

    2. Declaration Block:
      Syntax: selector { property: value; }
      Description: Contains style declarations defining properties and values.

    3. Property and Value:
      Syntax: property: value;
      Description: Specifies a style property and its corresponding value.

    4. Comments:
      Syntax: /* This is a comment */
      Description: Used for additional information in CSS code.

    5. Color:
      Syntax: color: red;
      Description: Sets text color using various formats like names, hex codes, RGB, RGBA, HSL, HSLA.

    6. Background:
      Syntax: background-color: lightblue;
      Description: Sets the background color of an element.

    7. Font:
      Syntax: font-family: "Arial", sans-serif;
      Description: Defines the font family for text.

    8. Text:
      Syntax:
        text-align: center;
        text-decoration: underline;
      Description: Controls text alignment, decoration, and other text-related properties.

    9. Display:
      Syntax: display: block;
      Description: Specifies the display behavior of an element.

    10. Positioning:
      Syntax: position: relative;
      Description: Defines the positioning method for an element.
  ''')
  ];
}

List<OutlineItem> nosqlContent() {
  return [
    OutlineItem(
      imagePath: 'assets/nosql/nosql.png',
    ),
    OutlineItem(
      title: 'What is NoSQL?',
      description:
          'NoSQL, which stands for "not only SQL," is not a programming language but rather a category of databases that diverge from traditional relational databases. NoSQL databases are designed to handle large volumes of unstructured or semi-structured data and offer a flexible schema, allowing for horizontal scalability. Unlike SQL databases, NoSQL databases can store and retrieve data in various formats, such as key-value pairs, document-oriented collections, graph structures, or wide-column stores. NoSQL databases aim to address the shortcomings of traditional relational databases in terms of scalability, flexibility, and performance in certain use cases.',
    ),
    OutlineItem(
      title: 'Why use NoSQL?',
      description:
          'NoSQL databases are used to address specific challenges related to handling massive amounts of unstructured or semi-structured data and achieving horizontal scalability. They are suitable for applications with evolving schemas, high write throughput, and requirements for flexible data models. NoSQL databases excel in scenarios like big data analytics, real-time applications, content management systems, and situations where traditional relational databases may face performance bottlenecks',
    ),
    OutlineItem(
      title: 'How to use NoSQL?',
      description:
          'Using NoSQL involves selecting the appropriate type of NoSQL database based on the data model and requirements of the application. Common types of NoSQL databases include document stores, key-value stores, wide-column stores, and graph databases. Developers interact with NoSQL databases through APIs or query languages specific to each database type. Data is typically stored in a format compatible with the chosen NoSQL database, and queries are executed using the provided tools or libraries.',
    ),
    OutlineItem(title: 'NoSQL Databases Syntax Elements:', description: r'''
    Document-Oriented Databases (e.g., MongoDB):
    1. Insert Document:
      Syntax: db.collection.insert({ key: "value", key2: "value2" });
      Description: Inserts a new document into a collection.

    2. Find Documents:
      Syntax: db.collection.find({ key: "value" });
      Description: Retrieves documents from a collection based on specified criteria.

    3. Update Document:
      Syntax: db.collection.update({ key: "value" }, { $set: { newKey: "newValue" } });
      Description: Modifies an existing document in a collection.

    4. Remove Document:
      Syntax: db.collection.remove({ key: "value" });
      Description: Deletes documents from a collection based on specified criteria.

    Key-Value Stores (e.g., Redis):
    1. Set Key-Value Pair:
      Syntax: SET key value
      Description: Sets a key to hold a string value.

    2. Get Value by Key:
      Syntax: GET key
      Description: Retrieves the value associated with a given key.

    3. Delete Key:
      Syntax: DEL key
      Description: Removes a key and its associated value.

    4. Increment/Decrement:
      Syntax: INCR key or DECR key
      Description: Increments or decrements the integer value of a key.

    Wide-Column Stores (e.g., Apache Cassandra):
    1. Create Keyspace:
      Syntax: CREATE KEYSPACE keyspace_name WITH replication = {...};
      Description: Defines a keyspace (similar to a database in relational databases).

    2. Create Table:
      Syntax: CREATE TABLE table_name (column1 data_type, column2 data_type, PRIMARY KEY (column1));
      Description: Defines a table within a keyspace.

    3. Insert Data:
      Syntax: INSERT INTO table_name (column1, column2) VALUES (value1, value2);
      Description: Adds data to a table.

    4. Query Data:
      Syntax: SELECT * FROM table_name WHERE column1 = value;
      Description: Retrieves data from a table based on specified conditions.

    Graph Databases (e.g., Neo4j):
    1. Create Node:
      Syntax: CREATE (node:Label {key: "value"});
      Description: Adds a node to the graph.

    2. Create Relationship:
      Syntax: MATCH (node1:Label1), (node2:Label2) CREATE (node1)-[:RELATIONSHIP]->(node2);
      Description: Establishes a relationship between nodes.

    3. Query Nodes and Relationships:
      Syntax: MATCH (node:Label)-[relationship]->(otherNode) RETURN node, relationship, otherNode;
      Description: Retrieves nodes and relationships based on specified criteria.
  '''),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              'CouchDB: A NoSQL database that uses a document-oriented model. It is used in applications requiring offline access to data and decentralized architectures.',
          imagePath: 'assets/nosql/couchdb.png',
        ),
        AppData(
          description:
              "MongoDB Atlas: MongoDB's cloud-based database service is widely used for scalable and flexible data storage. It is used in various applications, including content management systems and e-commerce platforms.",
          imagePath: 'assets/nosql/mongodb.png',
        ),
        AppData(
          description:
              'Apache Cassandra: A highly scalable and distributed NoSQL database that is utilized in applications requiring high availability and fault tolerance, such as in financial services and healthcare.',
          imagePath: 'assets/nosql/apache.png',
        ),
        AppData(
          description:
              'Amazon DynamoDB: A managed NoSQL database service provided by Amazon Web Services (AWS). DynamoDB is commonly used in serverless architectures and applications with unpredictable workloads.',
          imagePath: 'assets/nosql/amazon.png',
        ),
        AppData(
          description:
              'Neo4j: A graph database used for applications involving complex relationships, such as social networks, recommendation engines, and fraud detection systems.',
          imagePath: 'assets/nosql/neo4j.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> rustContent() {
  return [
    OutlineItem(
      imagePath: 'assets/rust/rust.png',
    ),
    OutlineItem(
      title: 'What is Rust?',
      description:
          'Rust is a systems programming language that emphasizes performance, reliability, and safety. Developed by Mozilla, Rust provides low-level control over system resources without sacrificing memory safety. It features a modern syntax, borrowing and ownership system to manage memory, and zero-cost abstractions. Rust is designed for building fast and reliable software, particularly in areas such as operating systems, embedded systems, and high-performance applications.',
    ),
    OutlineItem(
      title: 'Why use Rust?',
      description:
          "Rust is chosen for its ability to provide low-level control over system resources while preventing common programming errors like null pointer dereferences and data races. It offers a unique ownership system that ensures memory safety without relying on garbage collection, making it suitable for building high-performance and reliable systems. Rust's strong focus on preventing bugs and ensuring thread safety makes it an attractive choice for systems programming.",
    ),
    OutlineItem(
      title: 'How to use Rust?',
      description:
          'To use Rust, you need to install the Rust compiler, commonly known as rustc, and the package manager called Cargo. Rust code can be written in a text editor or an integrated development environment (IDE), saved with a .rs extension, and compiled using the rustc command. Cargo simplifies the process of managing dependencies, building projects, and running tests in Rust.',
    ),
    OutlineItem(title: 'Rust Programming Concepts:', description: '''
    Variables and Data Types:
    Variable Declaration:
      let variable_name = value;
      Description: Rust uses the let keyword for variable declaration, and it's immutable by default. Use mut for mutable variables.

    Data Types:
      let number: i32 = 42;
      let text: &str = "Hello";
      let is_true: bool = true;
      Description: Rust has a strong static typing system. Types can be explicitly annotated or inferred.

    Functions:
    Function Declaration:
      fn add(x: i32, y: i32) -> i32 { x + y }
      Description: Functions are declared using the fn keyword. The arrow (->) indicates the return type.

    Control Flow:
      if-else:
        if condition {
          // code block
        } else {
          // code block
        }
        Description: Rust uses if and else for conditional statements.

    Ownership:
      let string = String::from("Hello");
      let length = string.len();
      Description: Rust's ownership system ensures memory safety without garbage collection.

    Structs and Enums:
    Structs:
      struct Point {
        x: f64,
        y: f64,
      }
      Description: Structs allow you to create custom data types with named fields.

    Enums:
      enum Direction {
        Up,
        Down,
        Left,
        Right,
      }
      let player_direction = Direction::Up;
      Description: Enums define a type by enumerating its possible values.

    Pattern Matching:
      match value {
        1 => println!("One"),
        2 | 3 => println!("Two Three"),
        _ => println!("other"),
      }
      Description: match allows pattern matching on values.
  '''),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              "Mozilla Firefox: Parts of the Firefox web browser are written in Rust, specifically in the Servo browser engine. Rust's memory safety features contribute to building a secure and robust browser.",
          imagePath: 'assets/rust/mozilla.png',
        ),
        AppData(
          description:
              'Dropbox: The cloud storage service uses Rust in its backend infrastructure for optimizing performance and reliability in certain components.',
          imagePath: 'assets/rust/dropbox.png',
        ),
        AppData(
          description:
              'Cloudflare: The networking and security company utilizes Rust in the development of components such as the BoringTun VPN and other performance-critical networking applications.',
          imagePath: 'assets/rust/cloudflare.png',
        ),
        AppData(
          description:
              'Redox OS: An experimental operating system written in Rust, aiming to provide a secure and modern alternative to traditional operating systems.',
          imagePath: 'assets/rust/redox.png',
        ),
        AppData(
          description:
              'xi-editor: A fast and minimalistic text editor developed in Rust, known for its efficient performance and extensibility.',
          imagePath: 'assets/rust/xi.png',
        ),
      ],
    ),
  ];
}

List<OutlineItem> perlContent() {
  return [
    OutlineItem(
      imagePath: 'assets/perl/perl.png',
    ),
    OutlineItem(
      title: 'What is Perl?',
      description:
          "Perl, Practical Extraction and Reporting Language, is a high-level, general-purpose programming language known for its versatility and powerful text-processing capabilities. Developed by Larry Wall in the late 1980s, Perl is designed to be easy to use for a wide range of tasks, including text processing, system administration, web development, and network programming. Perl's syntax, influenced by various languages, emphasizes flexibility and expressiveness, making it well-suited for tasks involving regular expressions and string manipulation.",
    ),
    OutlineItem(
      title: 'Why use Perl?',
      description:
          "Perl is used for its strong text-processing capabilities and rapid development features. It excels in tasks that involve handling and manipulating text, making it a popular choice for tasks such as parsing log files, data extraction, and report generation. Perl's extensive library of modules, combined with its regular expression support, simplifies complex text-processing tasks, making it a pragmatic choice for various scripting and automation needs.",
    ),
    OutlineItem(
      title: 'How to use Perl?',
      description:
          'Using Perl involves writing scripts or programs that can be executed from the command line or integrated into larger applications. Perl scripts are plain text files with a .pl extension. Perl code can be written in a simple text editor and saved with the .pl extension. The Perl interpreter (perl) is then used to execute the script, producing the desired output.',
    ),
    OutlineItem(title: 'Perl Programming Concepts:', description: r'''
    Hello World:
      Syntax:
        #!/usr/bin/perl
        print "Hello, World!\\n";
      Description: Perl scripts often start with a shebang line (#!/usr/bin/perl) and use print to output text.

    Variables:
      Syntax:
        my $variable = "value";
      Description: Perl uses the my keyword to declare variables. Variables start with a sigil ($ for scalars, @ for arrays, % for hashes).

    Data Types:
      Syntax:
        my $scalar = 4;
        my @array = (1, 2, 3);
        my %hash = ('key' => 'value', 'another' => 'entry');
      Description: Perl has scalars, arrays, and hashes. Scalars can hold numbers or strings.

    Control Structures:
      Syntax:
        if ($condition) {
          # code block
        } elsif ($another_condition) {
          # code block
        } else {
          # code block
        }
        for my $element (@array) {
          # code block
        }
        while ($condition) {
          # code block
        }
      Description: Perl supports if, elsif, else, for, and while control structures.

    Subroutines:
      Syntax:
        sub greet {
          my ($name) = @_;
          print "hi $name";
        }
        greet("Alice");
      Description: Subroutines are defined with sub and called with parameters.

    Regular Expressions:
      Syntax:
        my $string = "Hello, World!";
        if ($string =~ /Hello/) {
          # code block
        }
      Description: Perl has strong support for regular expressions using the =~ operator.

    File Handling:
      Syntax:
        open(my $file_handle, '<', 'filename.txt') or die "Cannot open file: $!";
        while (my $line = <$file_handle>) {
          chomp($line);
          # code block
        }
        close($file_handle);
      Description: open, close, and file input/output operations are commonly used for file handling.

    Hashes:
      Syntax:
        my %grades = ('Alice' => 90, 'Bob' => 85, 'Charlie' => 95);
      Description: Hashes (associative arrays) use key-value pairs and are declared with %.

    Modules:
      Syntax:
        use MyModule;
      Description: Perl uses modules to organize code. Modules can be created and reused.

    References:
      Syntax:
        my $array_ref = [1, 2, 3];
        my $hash_ref = {'key' => 'value'};
      Description: References provide a way to work with complex data structures.

    Error Handling:
      Syntax:
        die "Error message" unless $condition;
      Description: die is used for raising exceptions and terminating the program.

    Environment Variables:
      Syntax:
        my $value = $ENV{'MY_VARIABLE'};
      Description: Perl can access environment variables using %ENV.

    Special Variables:
      Syntax:
        my $program_name = $0;
        my $number_of_arguments = $#ARGV + 1;
      Description: Perl has a set of special variables like $0 (program name) and @ARGV (command-line arguments).
  '''),
    OutlineItem(
      title: 'Known apps:',
      appDataList: [
        AppData(
          description:
              'cPanel: A widely-used web hosting control panel that simplifies website and server management. cPanel uses Perl extensively for its backend scripts and automation tasks.',
          imagePath: 'assets/perl/cpanel.png',
        ),
        AppData(
          description:
              'BioPerl: A collection of Perl tools and modules for bioinformatics and computational biology. BioPerl is utilized for tasks such as sequence analysis and manipulation.',
          imagePath: 'assets/perl/perl.png',
        ),
        AppData(
          description:
              'Bugzilla: An open-source bug tracking system developed in Perl. Bugzilla is used by various organizations to manage and track software defects and enhancements.',
          imagePath: 'assets/perl/bugzilla.png',
        ),
        AppData(
          description:
              'Request Tracker (RT): A ticketing system for tracking tasks, issues, and support requests. RT is written in Perl and is often used for managing customer support workflows.',
          imagePath: 'assets/perl/request_tracker.png',
        ),
        AppData(
          description:
              'Movable Type: A popular blogging platform that utilizes Perl for content management and dynamic page generation. Movable Type is known for its flexibility and extensibility through Perl plugins.',
          imagePath: 'assets/perl/movable.png',
        ),
      ],
    ),
  ];
}

class OutlineItem extends StatelessWidget {
  final String? title;
  final String? description;
  final String? imagePath;
  final List<AppData>? appDataList;

  const OutlineItem({
    this.title,
    this.description,
    this.imagePath,
    this.appDataList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: const Color(0xFFD7B9FD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null && imagePath == null) // Show title if no image
            Container(
              margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 4.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              child: Text(
                title!,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          if (description != null)
            Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: const Color(0xFFD7B9FD),
              ),
              child: Text(
                description!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          if (imagePath != null) // Show image if available
            Center(
              child: Image.asset(
                imagePath!,
                width: 100, // Adjust the width as needed
                height: 100, // Adjust the height as needed
              ),
            ),
          if (appDataList != null && appDataList!.isNotEmpty)
            Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null && imagePath != null)
                    Container(
                      margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 4.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: const Color(0xFFD7B9FD),
                      ),
                      child: Text(
                        title!,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: appDataList!
                        .map((appData) => Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 12.0), // Add bottom padding
                              child: Row(
                                children: [
                                  if (appData.imagePath != null)
                                    Image.asset(
                                      appData.imagePath!,
                                      width: 50, // Adjust the width as needed
                                      height: 50, // Adjust the height as needed
                                    ),
                                  SizedBox(width: 10),
                                  Flexible(
                                    child: Text(
                                      appData.description!,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class AppData {
  final String? imagePath;
  final String? description;

  AppData({
    this.imagePath,
    this.description,
  });
}

class LanguageTile extends StatelessWidget {
  final String language;
  final List<OutlineItem> content;
  final String imageAsset;

  LanguageTile({
    required this.language,
    required this.content,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: CustomColorScheme.colorScheme.primary,
          width: 5.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0), // Adjust the padding as needed
        child: ListTile(
          leading: Image.asset(
            imageAsset,
            width: 50,
            height: 50,
          ),
          title: Text(
            language,
            style: TextStyle(
              color: CustomColorScheme.colorScheme.onPrimary,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LanguageLesson(
                  language: language,
                  content: content,
                  imageAsset: imageAsset,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class LanguageLesson extends StatelessWidget {
  final String language;
  final List<OutlineItem> content;
  final String imageAsset;

  LanguageLesson({
    required this.language,
    required this.content,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              imageAsset,
              width: 30, // Adjust size as needed
              height: 30, // Adjust size as needed
            ),
            SizedBox(width: 10), // Add some space between image and title
            Text(language),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: content.map((item) => item.build(context)).toList(),
        ),
      ),
    );
  }
}

class VideoLectures extends StatelessWidget {
  final Map<String, String> programmingLanguages = {
    'JAVASCRIPT': 'PL4cUxeGkcC9i9Ae2D9Ee1RvylH38dKuET',
    'PYTHON': 'PLsyeobzWxl7poL9JTVyndKe62ieoN-MZ3',
    'GO': 'PL4cUxeGkcC9gC88BEo9czgyS72A3doDeM',
    'JAVA': 'PLBlnK6fEyqRjKA_NuK9mHmlk0dZzuP1P5',
    'KOTLIN': 'PLsyeobzWxl7rooJFZhc3qPLwVROovGCfh',
    'PHP': 'PL0eyrZgxdwhwwQQZA79OzYwl5ewA7HQih',
    'C#': 'PL0eyrZgxdwhxD9HhtpuZV22KxEJAZ55X-',
    'SWIFT': 'PL5PR3UyfTWvfacnfUsvNcxIiKIgidNRoW',
    'R': 'PLjVLYmrlmjGdmPrz0Lx7smkd0qIKHInOF',
    'RUBY': 'PLS1QulWo1RIbNBXZAeVbkkHEj9zsEbXQK',
    'C AND C++': 'PLWKjhJtqVAbmUE5IqyfGYEYjrZBYzaT4m',
    'MATLAB': 'PLho7ncbqgQbviwKeoJybXPnFY5t590dRJ',
    'TYPESCRIPT': 'PL4cUxeGkcC9gUgr39Q_yD6v-bSyMwKPUI',
    'SCALA': 'PLS1QulWo1RIagob5D6kMIAvu7DQC5VTh3',
    'SQL': 'PLavw5C92dz9Ef4E-1Zi9KfCTXS_IN8gXZ',
    'HTML': 'PLr6-GrHUlVf_ZNmuQSXdS197Oyr1L9sPB',
    'CSS': 'PLr6-GrHUlVf8JIgLcu3sHigvQjTw_aC9C',
    'NOSQL': 'PLsyeobzWxl7r0bn6dzVA8bQNxcx7DRl5F',
    'RUST': 'PLzMcBGfZo4-nyLTlSRBvo0zjSnCnqjHYQ',
    'PERL': 'PL1h5a0eaDD3rTG1U7w9wmff6ZAKDN3b16',
    // ... rest of your programming languages
  };

  String getImageAssetPath(String language) {
    return 'assets/${language.toLowerCase()}/${language.toLowerCase()}.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: Color(0xFFD7B9FD),
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/video_course.png',
                    width: 40.0, // Adjust the width as needed
                    height: 40.0, // Adjust the height as needed
                  ),
                  SizedBox(width: 12.0), // Add space between image and text
                  Text(
                    'VIDEO COURSES',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: programmingLanguages.length,
              itemBuilder: (context, index) {
                final language = programmingLanguages.keys.elementAt(index);
                final playlistId = programmingLanguages[language];

                if (playlistId != null) {
                  return LanguageButton(
                    language: language,
                    imageAsset: getImageAssetPath(language),
                    playlistName: getPlaylistName(language),
                    onTapPlaylist: () {
                      launchPlaylist(playlistId);
                    },
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

String getPlaylistName(String language) {
  // Map each language to its specific playlist name
  switch (language) {
    case 'JAVASCRIPT':
      return 'JavaScript Tutorials for Beginners - YouTube';
    case 'PYTHON':
      return 'Python for Beginners (Full Course) | Programming Tutorial - YouTube';
    case 'GO':
      return 'Go Tutorial (Golang) for Beginners - YouTube';
    case 'JAVA':
      return 'Java Programming - YouTube';
    case 'KOTLIN':
      return 'Kotlin Tutorial - YouTube';
    case 'PHP':
      return 'PHP Course for Beginners - YouTube';
    case 'C#':
      return 'C# Tutorials - YouTube';
    case 'SWIFT':
      return 'Swift 5 for Beginners (2022) - YouTube';
    case 'R':
      return 'Complete R Programming Tutorial for Beginners to Pro [HINDI] - YouTube';
    case 'RUBY':
      return 'Ruby Tutorial For Beginners - YouTube';
    case 'C AND C++':
      return 'C / C++ - YouTube';
    case 'MATLAB':
      return 'MATLAB Tutorial - YouTube';
    case 'TYPESCRIPT':
      return 'TypeScript Tutorial - YouTube';
    case 'SCALA':
      return 'Scala Tutorial - YouTube';
    case 'SQL':
      return 'Learn Complete SQL (Beginner to Advance) - YouTube';
    case 'HTML':
      return 'HTML Tutorial for Beginners - YouTube';
    case 'CSS':
      return 'CSS Tutorial for Beginners - YouTube';
    case 'NOSQL':
      return 'NoSQL Tutorial for Beginners - YouTube';
    case 'RUST':
      return 'Rust Programming Tutorial - YouTube';
    case 'PERL':
      return 'Perl Tutorial: Basics to Advanced - YouTube';
    default:
      return 'Default Playlist Name';
  }
}

void launchPlaylist(String playlistId) async {
  final url = 'https://www.youtube.com/playlist?list=$playlistId';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class LanguageButton extends StatelessWidget {
  final String language;
  final String imageAsset;
  final String playlistName;
  final VoidCallback onTapPlaylist;

  const LanguageButton({
    required this.language,
    required this.imageAsset,
    required this.playlistName,
    required this.onTapPlaylist,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: CustomColorScheme.colorScheme.primary,
          width: 5.0,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(12.0), // Increase padding here
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            imageAsset,
            width: 50,
            height: 50,
          ),
          title: Text(
            language,
            style: TextStyle(
              color: CustomColorScheme.colorScheme.onPrimary,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: GestureDetector(
            onTap: onTapPlaylist,
            child: Text(
              playlistName,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14.0,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VideoPlaylist extends StatelessWidget {
  final String playlistId;
  final String language;

  VideoPlaylist({required this.playlistId, required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videos - $language'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            launchPlaylist(playlistId);
          },
          child: Text('Open $language Playlist'),
        ),
      ),
    );
  }

  void launchPlaylist(String playlistId) async {
    final url = 'https://www.youtube.com/playlist?list=$playlistId';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorScheme.colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: Color(0xFFD7B9FD),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/about_us.png',
                      width: 40.0,
                      height: 40.0,
                    ),
                    SizedBox(width: 12.0),
                    Text(
                      'ABOUT US',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContainerWithImage(
                    title: 'Hello, we are CodaHub!',
                    content:
                        'At Coda Hub, we\'re passionate about empowering the next generation of creators, innovators, and problem-solvers through the world of coding. Our platform is designed to make learning to code fun, engaging, and accessible for learners of all ages and skill levels.',
                    imagePath: 'assets/codabot.png',
                  ),
                  SizedBox(height: 20.0),
                  _buildRoundedSection(
                    title: 'The CodaHub Story',
                    content:
                        'Coda Hub was born out of a shared vision among a group of students, developers, and tech enthusiasts who recognized the growing importance of coding literacy in today\'s digital landscape. We saw an opportunity to create an inclusive and dynamic learning environment where anyone with a curiosity for coding could thrive.',
                  ),
                  SizedBox(height: 20.0),
                  _buildRoundedSection(
                    title: 'The CodaHub Mission',
                    content:
                        'At Coda Hub, our mission is to ignite a passion for coding in beginners by providing an accessible and engaging platform. We strive to demystify programming, fostering confidence and skills through interactive learning experiences. Our goal is to empower individuals with the foundational knowledge needed to embark on their coding journey confidently, creating a diverse community of aspiring coders ready to shape the future.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerWithImage({
    required String title,
    required String content,
    required String imagePath,
  }) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: CustomColorScheme.colorScheme.primary,
          width: 5.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            width: 90.0, // Adjust the width as needed
            height: 250.0, // Adjust the height as needed
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  content,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundedSection(
      {required String title, required String content}) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: CustomColorScheme.colorScheme.primary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Center(
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
