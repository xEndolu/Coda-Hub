import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFD7B9FD),
        scaffoldBackgroundColor: Color(0xFFDFDFDF),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFD7B9FD),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Lessons(),
    VideoLectures(),
    AboutUs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CODA HUB'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Lessons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Video Lectures',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to CODA HUB!',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class Lessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        LanguageTile(language: 'JavaScript', content: javascriptContent()),
        LanguageTile(language: 'Python', content: pythonContent()),
        LanguageTile(language: 'Go', content: goContent()),
        LanguageTile(language: 'Java', content: javaContent()),
        LanguageTile(language: 'Kotlin', content: kotlinContent()),
        LanguageTile(language: 'PHP', content: phpContent()),
        LanguageTile(language: 'C#', content: csharpContent()),
        LanguageTile(language: 'Swift', content: swiftContent()),
        LanguageTile(language: 'R', content: rContent()),
        LanguageTile(language: 'Ruby', content: rubyContent()),
        LanguageTile(language: 'C and C++', content: cAndcplusplusContent()),
        LanguageTile(language: 'Matlab', content: matlabContent()),
        LanguageTile(language: 'TypeScript', content: typescriptContent()),
        LanguageTile(language: 'Scala', content: scalaContent()),
        LanguageTile(language: 'SQL', content: sqlContent()),
        LanguageTile(language: 'HTML', content: htmlContent()),
        LanguageTile(language: 'CSS', content: cssContent()),
        LanguageTile(language: 'NoSQL', content: nosqlContent()),
        LanguageTile(language: 'Rust', content: rustContent()),
        LanguageTile(language: 'Perl', content: perlContent()),
      ],
    );
  }

  List<OutlineItem> javascriptContent() {
    return [
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
      OutlineItem(
        title: 'Known apps:',
        description:
            '- Gmail: A widely used email service developed by Google, offering a dynamic and responsive user interface.\n- Slack: A popular team collaboration platform utilizing JavaScript for real-time messaging and interactive features.\n- Facebook: The leading social media platform, leveraging JavaScript for its dynamic and user-friendly interface.\n- Twitter: A microblogging platform that employs JavaScript for seamless and responsive tweet updates.\n- Instagram: A photo and video sharing platform using JavaScript for its interactive and visually engaging features.',
      ),
    ];
  }
}

List<OutlineItem> pythonContent() {
  return [
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
    OutlineItem(
      title: 'Known apps:',
      description:
          "- Instagram: A widely-used photo and video-sharing platform developed using Django, a Python web framework, showcasing Python's effectiveness in web development.\n- Dropbox: A cloud storage service that heavily relies on Python for both server-side and client-side development, highlighting Python's versatility.\n- Spotify: The popular music streaming service utilizes Python for backend services, contributing to its robust and scalable architecture.\n- YouTube: Python is used in various components of YouTube's backend, demonstrating its suitability for handling large-scale web applications.\n- Reddit: A social news aggregation and discussion platform developed with Python, emphasizing its role in creating dynamic and interactive web applications.",
    ),
  ];
}

List<OutlineItem> goContent() {
  return [
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
    OutlineItem(
      title: 'Known apps:',
      description:
          "- Docker: A platform for developing, shipping, and running applications in containers. Go's efficiency and concurrency support contribute to Docker's robust performance.\n- Kubernetes: An open-source container orchestration platform. Go's simplicity and concurrent programming features play a key role in managing and scaling containerized applications.\n- Prometheus: A monitoring and alerting toolkit designed for reliability and scalability. Go's efficiency makes it suitable for handling large-scale monitoring tasks.\n- InfluxDB: A high-performance, distributed, and scalable time-series database. Go's speed and simplicity are advantageous for handling time-series data efficiently.\n- Terraform: An infrastructure as code (IaC) tool for building, changing, and versioning infrastructure. Go's efficiency and readability contribute to Terraform's success in managing complex infrastructure configurations.",
    ),
  ];
}

List<OutlineItem> javaContent() {
  return [
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
    OutlineItem(
      title: 'Known apps:',
      description:
          "- Android OS: Java is a key language for developing Android applications, making it the foundation for a vast ecosystem of mobile apps.\n- Eclipse IDE: An integrated development environment widely used for Java development, showcasing Java's versatility in building powerful tools for developers.\n- Apache Hadoop: A distributed storage and processing framework for big data applications. Java's scalability is crucial for handling large-scale data processing tasks.\n- LinkedIn: The social networking platform relies on Java for its backend services, contributing to the scalability and reliability of the site.\n- Minecraft: A popular sandbox video game written in Java, highlighting the language's suitability for gaming and multimedia applications.",
    ),
  ];
}

List<OutlineItem> kotlinContent() {
  return [
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
    OutlineItem(
      title: 'Known apps:',
      description:
          "- Trello: A popular project management tool that uses Kotlin for its Android application, highlighting Kotlin's suitability for modern mobile app development.\n- Coursera: The online learning platform employs Kotlin for its Android app, showcasing the language's capabilities in delivering a seamless and interactive educational experience.\n- Evernote: A note-taking app utilizing Kotlin for Android development, reflecting Kotlin's ability to enhance the efficiency and maintainability of mobile applications.\n- Square: The payment processing company employs Kotlin for various Android applications, emphasizing its use in creating secure and efficient financial software.\n- Slack: The team collaboration platform uses Kotlin in its Android app, demonstrating the language's versatility in building robust and user-friendly mobile applications.",
    ),
  ];
}

List<OutlineItem> phpContent() {
  return [
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
    OutlineItem(
      title: 'Known apps:',
      description:
          "- WordPress: WordPress is a popular content management system (CMS) written in PHP. It's widely used for creating blogs, websites, and online stores.\n- Joomla: Joomla is another CMS written in PHP, known for its flexibility and extensibility. It is often used for building websites and online applications.\n- Drupal: Drupal is a robust CMS written in PHP that is used for building highly customizable websites and web applications.\n- Magento: Magento is an open-source e-commerce platform written in PHP. It is widely used for building online stores and managing e-commerce websites.\n- phpBB: phpBB is a popular open-source forum software written in PHP. It provides a platform for creating online discussion forums.",
    ),
  ];
}

List<OutlineItem> csharpContent() {
  return [
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
      title: 'Known apps:',
      description:
          "- Microsoft Office Suite: C# is used extensively in developing applications within the Microsoft Office Suite, including Microsoft Word, Excel, and Outlook.\n- Visual Studio IDE: The official integrated development environment for C# itself, showcasing the language's capability in building powerful development tools.\n- Unity3D Game Engine: C# is the primary scripting language for developing games and interactive experiences using the Unity game engine.\n- Azure DevOps: A suite of development tools and services by Microsoft, utilizing C# for building a comprehensive platform for software development.\n- Stack Overflow: The popular programming Q&A community employs C# for its backend development, demonstrating the language's suitability for large-scale web applications.",
    ),
  ];
}

List<OutlineItem> swiftContent() {
  return [
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
      title: 'Known apps:',
      description:
          "- Instagram: The popular photo and video-sharing app's iOS version is developed using Swift, emphasizing the language's capabilities in building responsive and visually appealing mobile applications.\n- Uber: Swift is used in the development of Uber's iOS app, contributing to the app's smooth user experience and real-time navigation features.\n- LinkedIn: The professional networking platform utilizes Swift for its iOS app, showcasing the language's suitability for creating robust and feature-rich mobile applications.\n- Waze: The navigation and traffic app uses Swift for its iOS version, highlighting the language's effectiveness in building location-based and real-time traffic applications.\n- Duolingo: The language learning app employs Swift for its iOS application, demonstrating the language's utility in creating interactive and educational mobile experiences.",
    ),
  ];
}

List<OutlineItem> rContent() {
  return [
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
      title: 'Known apps:',
      description:
          '- RStudio: While not an app per se, RStudio is a widely used integrated development environment (IDE) for R that supports coding, debugging, and visualization, making it an essential tool for R developers.\n- Shiny: An R package that allows the creation of interactive web applications directly from R, providing a platform for sharing data analyses and visualizations.\n- Bioconductor: An open-source project for the analysis and comprehension of genomic data, utilizing R for bioinformatics and computational biology.\n- ggplot2: A data visualization package for R that enables the creation of highly customizable and publication-quality graphics.\n- dplyr: A popular R package for data manipulation and analysis, offering a set of functions for efficiently filtering, grouping, and summarizing data in a user-friendly manner.',
    ),
  ];
}

List<OutlineItem> rubyContent() {
  return [
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
      title: 'Known apps:',
      description:
          "- Ruby on Rails (RoR): While not an app itself, Ruby on Rails is a popular web application framework developed in Ruby. It has been used to build numerous web applications, including Basecamp, GitHub, and Shopify.\n- GitHub: A web-based platform for version control using Git, GitHub is a widely used service developed using Ruby on Rails, showcasing the language's effectiveness in building scalable and collaborative development tools.\n- Shopify: An e-commerce platform that utilizes Ruby on Rails for its backend, demonstrating the language's suitability for creating robust and scalable online shopping experiences.\n- Airbnb: The online marketplace for lodging and travel uses Ruby on Rails, highlighting its use in creating dynamic and user-friendly platforms.\n- Discourse: An open-source discussion platform for community forums, developed using Ruby on Rails, emphasizing Ruby's applicability in building interactive and scalable web applications.",
    ),
  ];
}

List<OutlineItem> cAndcplusplusContent() {
  return [
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
      title: 'Known apps:',
      description:
          "- Microsoft Windows Operating System: The core components of the Windows operating system are developed using a combination of C and C++, showcasing their efficiency in building complex and high-performance software.\n- Adobe Systems Software Suite: Applications like Adobe Photoshop and Adobe Illustrator are developed using C++ for their graphical and computational intensity.\n- Mozilla Firefox: The popular web browser is primarily developed using C++ for its rendering engine and core functionalities, emphasizing the language's use in building browser technologies.\n- MySQL Database: A widely-used relational database management system that is implemented in C++ for its performance and efficiency in handling large datasets.\n- Game Engines (e.g., Unreal Engine): Many game engines, including Unreal Engine, use C++ for developing video games due to its performance and ability to directly interact with hardware components.",
    ),
  ];
}

List<OutlineItem> matlabContent() {
  return [
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
      title: 'Known apps:',
      description:
          "- Simulink: An add-on product for MATLAB, Simulink is widely used for modeling, simulating, and analyzing multi domain dynamical systems. It finds applications in control systems, signal processing, and communications.\n- MATLAB Mobile: The mobile version of MATLAB allows users to access MATLAB on smartphones and tablets, providing a portable platform for data analysis and visualization.\n- Image Processing Toolbox: MATLAB's Image Processing Toolbox is used in various applications, including medical imaging, remote sensing, and computer vision, enabling developers to perform advanced image analysis and manipulation.\n- Aerospace Toolbox: MATLAB's Aerospace Toolbox is utilized in the aerospace industry for modeling and simulating aircraft and spacecraft dynamics, control systems, and orbital mechanics.\n- MATLAB Compiler: MATLAB Compiler enables the creation of standalone executables or web applications from MATLAB code, allowing users to deploy their MATLAB applications without requiring a MATLAB installation.",
    ),
  ];
}

List<OutlineItem> typescriptContent() {
  return [
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
      title: 'Known apps:',
      description:
          "Angular: A widely-used web application framework developed by Google. Angular is built with TypeScript and provides a structured and scalable way to build dynamic web applications.\n- Microsoft Office Online: TypeScript is extensively used in the development of Microsoft Office Online applications, such as Word and Excel, enhancing code maintainability and enabling efficient collaboration.\n- Asana: A popular project management tool that utilizes TypeScript for its web application, ensuring a robust and scalable codebase for managing tasks and projects.\n- Slack: The team collaboration platform uses TypeScript for its frontend development, enabling a more structured and error-resistant codebase for the user interface.\n- VS Code: Microsoft's Visual Studio Code, a widely-used code editor, is written in TypeScript. TypeScript's features contribute to the development experience within the editor, providing features like intelligent code completion and error checking.",
    ),
  ];
}

List<OutlineItem> scalaContent() {
  return [
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
      title: 'Known apps:',
      description:
          "Twitter: Scala is extensively used in the development of Twitter's backend infrastructure. The language's concurrency and scalability features contribute to handling the high traffic and real-time nature of the social media platform.\n- LinkedIn: The professional networking platform employs Scala for its backend services, demonstrating the language's suitability for building robust and scalable enterprise applications.\n- Apache Spark: A distributed data processing engine for big data analytics, Apache Spark is developed in Scala. Scala's functional programming capabilities are crucial for Spark's expressive and efficient data processing.\n- Coursera: The online learning platform uses Scala in its backend services, showcasing the language's applicability in providing scalable and reliable educational platforms.\n- Etsy: The e-commerce platform utilizes Scala for various components of its infrastructure, emphasizing the language's effectiveness in building large-scale, transactional systems.",
    ),
  ];
}

List<OutlineItem> sqlContent() {
  return [
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
    OutlineItem(
      title: 'Knonw apps:',
      description:
          '- MySQL Workbench: A visual database design tool and SQL development environment used for managing and developing MySQL databases.\n- Microsoft SQL Server Management Studio (SSMS): A tool for managing, configuring, and administering Microsoft SQL Server databases, providing a comprehensive interface for SQL-related tasks.\n- Oracle SQL Developer: An integrated development environment for Oracle databases, allowing developers to manage and query Oracle databases efficiently.\n- phpMyAdmin: A web-based administration tool for MySQL databases, enabling users to manage their MySQL databases through a web interface using SQL commands.\n- SQLite Database Browser: A desktop application that allows users to browse, create, and manage SQLite database files, providing a graphical interface for SQL operations on SQLite databases.',
    ),
  ];
}

List<OutlineItem> htmlContent() {
  return [
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
    OutlineItem(
      title: 'Known apps:',
      description:
          '- Google Docs: While not a traditional app, Google Docs is a web-based word processing application that extensively uses HTML for rendering documents in the browser.\n- WordPress: A popular content management system (CMS) for creating and managing websites. WordPress themes and content are built using HTML.\n- Slack: The team collaboration platform utilizes HTML for its web-based interface, allowing users to interact with channels, messages, and other features.\n- Trello: A project management tool that uses HTML to structure and render boards, cards, and other elements in a visually appealing way.\n- Evernote Web: The web version of the note-taking application Evernote uses HTML to structure and present notes, allowing users to access their content through a web browser.',
    ),
  ];
}

List<OutlineItem> cssContent() {
  return [
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
  ];
}

List<OutlineItem> nosqlContent() {
  return [
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
    OutlineItem(
      title: 'Known apps:',
      description:
          "- CouchDB: A NoSQL database that uses a document-oriented model. It is used in applications requiring offline access to data and decentralized architectures.\n- MongoDB Atlas: MongoDB's cloud-based database service is widely used for scalable and flexible data storage. It is used in various applications, including content management systems and e-commerce platforms.\n- Apache Cassandra: A highly scalable and distributed NoSQL database that is utilized in applications requiring high availability and fault tolerance, such as in financial services and healthcare.\n- Amazon DynamoDB: A managed NoSQL database service provided by Amazon Web Services (AWS). DynamoDB is commonly used in serverless architectures and applications with unpredictable workloads.\n- Neo4j: A graph database used for applications involving complex relationships, such as social networks, recommendation engines, and fraud detection systems.",
    ),
  ];
}

List<OutlineItem> rustContent() {
  return [
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
    OutlineItem(
      title: 'Known apps:',
      description:
          "- Mozilla Firefox: Parts of the Firefox web browser are written in Rust, specifically in the Servo browser engine. Rust's memory safety features contribute to building a secure and robust browser.\n- Dropbox: The cloud storage service uses Rust in its backend infrastructure for optimizing performance and reliability in certain components.\n- Cloudflare: The networking and security company utilizes Rust in the development of components such as the BoringTun VPN and other performance-critical networking applications.\n- Redox OS: An experimental operating system written in Rust, aiming to provide a secure and modern alternative to traditional operating systems.\n- xi-editor: A fast and minimalistic text editor developed in Rust, known for its efficient performance and extensibility.",
    ),
  ];
}

List<OutlineItem> perlContent() {
  return [
    OutlineItem(
      title: 'What is Perl?',
      description:
          "Perl, Practical Extraction and Reporting Language, is a high-level, general-purpose programming language known for its versatility and powerful text-processing capabilities. Developed by Larry Wall in the late 1980s, Perl is designed to be easy to use for a wide range of tasks, including text processing, system administration, web development, and network programming. Perl's syntax, influenced by various languages, emphasizes flexibility and expressiveness, making it well-suited for tasks involving regular expressions and string manipulation.",
    ),
    OutlineItem(
      title: 'What is Perl?',
      description:
          "Perl is used for its strong text-processing capabilities and rapid development features. It excels in tasks that involve handling and manipulating text, making it a popular choice for tasks such as parsing log files, data extraction, and report generation. Perl's extensive library of modules, combined with its regular expression support, simplifies complex text-processing tasks, making it a pragmatic choice for various scripting and automation needs.",
    ),
    OutlineItem(
      title: 'What is Perl?',
      description:
          'Using Perl involves writing scripts or programs that can be executed from the command line or integrated into larger applications. Perl scripts are plain text files with a .pl extension. Perl code can be written in a simple text editor and saved with the .pl extension. The Perl interpreter (perl) is then used to execute the script, producing the desired output.',
    ),
    OutlineItem(
      title: 'What is Perl?',
      description:
          '- cPanel: A widely-used web hosting control panel that simplifies website and server management. cPanel uses Perl extensively for its backend scripts and automation tasks.\n- BioPerl: A collection of Perl tools and modules for bioinformatics and computational biology. BioPerl is utilized for tasks such as sequence analysis and manipulation.\n- Bugzilla: An open-source bug tracking system developed in Perl. Bugzilla is used by various organizations to manage and track software defects and enhancements.\n- Request Tracker (RT): A ticketing system for tracking tasks, issues, and support requests. RT is written in Perl and is often used for managing customer support workflows.\n- Movable Type: A popular blogging platform that utilizes Perl for content management and dynamic page generation. Movable Type is known for its flexibility and extensibility through Perl plugins.',
    ),
  ];
}

class LanguageTile extends StatelessWidget {
  final String language;
  final List<OutlineItem> content;

  LanguageTile({required this.language, required this.content});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(language),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                LanguageLesson(language: language, content: content),
          ),
        );
      },
    );
  }
}

class LanguageLesson extends StatelessWidget {
  final String language;
  final List<OutlineItem> content;

  LanguageLesson({required this.language, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: content,
        ),
      ),
    );
  }
}

class VideoLectures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Video Lectures will be available soon!',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'About Us information will be added here!',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}

class OutlineItem extends StatelessWidget {
  final String title;
  final String description;

  const OutlineItem({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
