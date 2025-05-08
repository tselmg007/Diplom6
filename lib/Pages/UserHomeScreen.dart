import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traffic/Pages/AdminHomeScreenPage.dart';
import 'package:traffic/Pages/SelectQuestionCount.dart';
import 'package:traffic/Pages/BottomNavigationBarChange.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseEight.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseEighteen.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseEleven.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseFifteen.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseFive.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseFour.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseFourteen.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseNine.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseNineteen.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseOne.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseSeven.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseSeventeen.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseSix.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseSixteen.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseTen.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseThirteen.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseThree.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseTwenty.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseTwentyFour.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseTwentyOne.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseTwentyThree.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseTwentyTwo.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseTwelve.dart';
import 'package:traffic/Pages/SignUpAndLogin/LoginPage.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseTwo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(UserHomeScreenPage());
}

class UserHomeScreenPage extends StatefulWidget {
  @override
  State<UserHomeScreenPage> createState() => _UserHomeScreenPageState();
}

class _UserHomeScreenPageState extends State<UserHomeScreenPage> {
  bool isDarkMode = false;
  String selectedLanguage = 'English';
  Color selectedHeaderColor = Colors.orange; // Header-ний өнгө
  Color selectedFooterColor = Colors.orange; // Footer-ний өнгө (ижил байна)
 

  // Key combination state to detect if A+D+M+I+N are pressed
  List<LogicalKeyboardKey> pressedKeys = [];

  // Create FocusNode
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  // Function to load the saved preferences from SharedPreferences
  _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;  
      selectedHeaderColor = Color(prefs.getInt('headerColor') ?? Colors.orange.value);
      selectedFooterColor = Color(prefs.getInt('footerColor') ?? Colors.orange.value); // Footer өнгө
    });
  }

  void toggleTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = value;
    });
    prefs.setBool('isDarkMode', value); 
  }

  void changeLanguage(String language) async {
    setState(() {
      selectedLanguage = language;
    });
  }

 void changeHeaderColor(Color color) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setInt('headerColor', color.value);
  await prefs.setInt('footerColor', color.value); // Footer color-ийг ч хадгална

  setState(() {
    selectedHeaderColor = color;
    selectedFooterColor = color;
  });

  void _logoutAndRedirectToLogin(BuildContext context) {
  SharedPreferences.getInstance().then((prefs) {
    prefs.clear();
  });

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),  
  );
}

  // Footer өнгө шинэчлэгдэхийн тулд дахин навигаци хийх
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const BottomNavigationBarChange()),
  );
}

void changeFooterColor(Color color) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    selectedFooterColor = color;
  });
  prefs.setInt('footerColor', color.value);
}

void _logoutAndRedirectToLogin(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.clear();
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Theme Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: selectedHeaderColor, 
          title: Text(
            "Smart Test",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) => 
            PopupMenuButton<String>(
  icon: Icon(Icons.home),
  onSelected: (String value) {
    if (value == 'admin') {
      _showPasswordDialog(context);  
    } else if (value == 'drawer') {
      Scaffold.of(context).openDrawer();
    }
  },
  itemBuilder: (BuildContext context) {
    return [
      PopupMenuItem<String>(
        value: 'admin',
        child: Row(
          children: [
            Icon(Icons.admin_panel_settings),
            SizedBox(width: 10),
            Text('Admin'),
          ],
        ),
      ),
      PopupMenuItem<String>(
        value: 'drawer',
        child: Row(
          children: [
            Icon(Icons.menu),
            SizedBox(width: 10),
            Text('Menu'),
          ],
        ),
      ),
    ];
  },
)

          ),
        ),
        
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 180),
                // Language and Color Selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.language, size: 24), // Icon before the text
                    SizedBox(width: 8),
                    Text(
                      "Language",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 32),
                    DropdownButton<String>(
                      value: selectedLanguage,
                      items: <String>['English', 'Mongolian']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        changeLanguage(newValue!);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.color_lens, size: 24), // Icon before the text
                    SizedBox(width: 8),
                    Text(
                      "Application Color",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            changeHeaderColor(Colors.black); // Change header color to orange
                          },
                          child: Container(
                            width: 10,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.all(0),
                            elevation: 0,
                          ),
                        ),
                        SizedBox(width: 2),
                        ElevatedButton(
                          onPressed: () {
                            changeHeaderColor(Colors.orange); // Change header color to orange
                          },
                          child: Container(
                            width: 10,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.all(0),
                            elevation: 0,
                          ),
                        ),
                        SizedBox(width: 2),
                        ElevatedButton(
                          onPressed: () {
                            changeHeaderColor(Colors.green); // Change header color to green
                          },
                          child: Container(
                            width: 10,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.all(0),
                            elevation: 0,
                          ),
                        ),
                        SizedBox(width: 2),
                        ElevatedButton(
                          onPressed: () {
                            changeHeaderColor(Colors.purple); // Change header color to purple
                          },
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              shape: BoxShape.circle,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            padding: EdgeInsets.all(0),
                            elevation: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
               SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.dark_mode, size: 24), // Icon before the text
                    Expanded(
                      child: SwitchListTile(
                        title: Text('Dark Mode', style: TextStyle(fontSize: 18),),
                        value: isDarkMode,
                        onChanged: toggleTheme,
                      ),
                    ),
                  ],
                )
                
              ],
            ),
          ),
        ),
        body: RawKeyboardListener(
          focusNode: _focusNode, // Assign the FocusNode to RawKeyboardListener
          onKey: (RawKeyEvent event) {
            if (event is RawKeyDownEvent) {
              setState(() {}); 
            }
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Асуултууд",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),
            ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputOneCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseOne(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/1.png', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Нэр томьёоны тодорхойлолт",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 5),
        ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputTwoCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseTwo(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/3.png', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Механикжсан тээврийн хэрэгслийн ангилал",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputThreeCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseThree(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/4.png', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Жолоочийн үүрэг",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputFourCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseFour(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/5.png', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "усгай дуут болон гэрлэн дохио ажиллулсан тээврийн хэрэгслийн хөдөлгөөн",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputFiveCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseFive(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/6.png', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Замын тэмдэг",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputSixCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseSix(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/7.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Замын тэмдэглэл",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputSevenCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseSeven(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/8.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Замын хөдөлгөөн зохицуулах дохио",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputEightCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseEight(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/9.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Анхааруулах дохио ба таних тэмдэг",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputNineCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseNine(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/10.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Хөдөлгөөн эхлэх болон чиг өөрчлөх",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputTenCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseTen(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/11.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Тээврийн хэрэгсэл байрлан явах",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputElevenCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseEleven(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/12.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Тээврийн хэрэгслийн хурд",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputTwelveCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseTwelve(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/13.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Гүйцэж түрүүлэх ба гүйцэх",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputThirteenCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseThirteen(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/14.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Түр ба удаан зогсох",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputFourteenCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseFourteen(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/15.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Уулзвар нэвтрэх",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputFifteenCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseFifteen(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/16.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Явган хүний гарц нэвтрэх",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputSixteenCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseSixteen(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/17.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Төмөр замын гарам нэвтрэх",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
  ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputSeventeenCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseSeventeen(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/18.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          " Гадна талын гэрэлтүүлэх хэрэгслийг хэрэглэх",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputEighteenCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseEighteen(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/19.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Хорооллын доторх хөдөлгөөн",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputNineteenCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseNineteen(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/20.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Тууш замын хөдөлгөөн",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
  ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputTwentyCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseTwenty(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/21.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Механикжсан тээврийн хэрэгслийг чирэх",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputTwentyOneCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseTwentyOne(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/22.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Хүн ба ачаа тээвэрлэх",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
    ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputTwentyTwoCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseTwentyTwo(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/23.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Тээврийн хэрэгслийн эвдрэл гэмтэл, техникийн зөрчил",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
  ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputTwentyThreeCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseTwentyThree(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/2.png', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Тээврийн хэрэгслийг аюулгүй жолоодох онол",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () async {
    try {
      // Fetch the count of documents from the SmartTrafficInputOneCollection
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputTwentyFourCollection')
          .get();
      final totalQuestions = snapshot.size;  // Get the count of documents

      // Show the dialog to select the number of questions
      final selectedCount = await showDialog<int>(
        context: context,
        builder: (context) => DynamicQuestionSelectDialog(totalQuestions: totalQuestions), // Pass the totalQuestions
      );

      // If a count is selected, navigate to the next page with the selected number of questions
      if (selectedCount != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserExerciseTwentyFour(selectedQuestions: selectedCount), // Pass the selected count
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching total questions: $e')),
      );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/24.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Эмнэлгийн анхны тусламж",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.deepPurple,
    minimumSize: const Size.fromHeight(50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  },
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(Icons.exit_to_app, color: Colors.white),  // The icon
      SizedBox(width: 10),  // Space between icon and text
      Text("Гарах", style: TextStyle(color: Colors.white)),  // Text
    ],
  ),
)

              ],
            ),
          ),
        ),
      ),
    );
  }

  // Show password dialog
  void _showPasswordDialog(BuildContext context) {
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            content: TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Админ нууц үг',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  String password = _passwordController.text.trim();
                  if (password == '123') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminHomeScreenPage(),
                      ),
                    );
                  } else {
                    Navigator.pop(context);
                    _showErrorDialog(context);
                  }
                },
                child: Text('Submit'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                },
                child: Text('Cancel'),
              ),
            ],
          );
        },
      );
    },
  );
}

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Алдаа'),
          content: Text('Нууц үг буруу байна.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}  