import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset('assets/logo.png'),
          nextScreen: const MainScreen(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.lightGreen),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;

  final List<Widget> _widgetOptions = <Widget>[
    const Center(child: Icon(Icons.calendar_month_outlined)),
    const Center(child: Icon(Icons.home)),
    const Center(child: Icon(Icons.attach_money)),
  ];

  void _navigatorTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: '시간표',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: '시급',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _navigatorTap,
      ),
    );
  }
}
