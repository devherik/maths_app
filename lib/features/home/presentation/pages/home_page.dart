import 'package:flutter/material.dart';
import 'package:maths_app/features/home/presentation/widgets/form_calc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Widget> forms = [
    FormCalcWidgets().squareForm(),
    FormCalcWidgets().cubicForm(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background/mint_wallpaper.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 113, 147, 164)),
          padding: const EdgeInsets.all(15),
          margin:
              const EdgeInsets.only(top: 200, bottom: 10, right: 10, left: 10),
          child: IndexedStack(
            index: index,
            children: forms,
          ),
        ), //use ShellRouter here to show square and cubic pages without context.go
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        onTap: (value) => setState(() {
          index = value;
        }),
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.two_k), label: 'Quadrados'),
          BottomNavigationBarItem(icon: Icon(Icons.three_k), label: 'Cúbico'),
        ],
      ),
    );
  }
}
