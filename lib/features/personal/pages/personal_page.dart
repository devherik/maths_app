import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maths_app/config/database/app_userstate.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  final User? _user = UserState().currentUser;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: Align(
          alignment: Alignment.center,
          child: ListView(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 206, 228, 180),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/svg/svg_drinkcoffee.svg',
                    semanticsLabel: 'Coffee Person',
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              TextFormField(
                controller: _emailController,
                enabled: isEditing,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: _user?.email,
                ),
              ),
              TextFormField(
                controller: _nameController,
                enabled: isEditing,
                maxLines: 1,
                decoration: const InputDecoration(
                  labelText: 'Nome atual',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              OutlinedButton(
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(5),
                  padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.only(
                      top: 20, bottom: 20, left: 80, right: 80)),
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromARGB(255, 206, 228, 180),
                  ),
                ),
                onPressed: () {
                  if (isEditing) {
                    setState(() {
                      // add here logic for edit profile
                      isEditing = !isEditing;
                    });
                  } else {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  }
                },
                child: Text(isEditing ? 'SALVAR' : 'EDITAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
