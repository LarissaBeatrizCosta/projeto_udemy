import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:get/get.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:udemy_curso_app/controllers/user_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final Rx<bool>_isLoading = true.obs;

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      final user = await Get.find<UserController>().getUser;
      if (user != '') {
        Get.offNamed('/home');
      } else {
        _isLoading.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading.value) {
      return Scaffold(
        body: Center(
          child: SimpleCircularProgressBar(
            animationDuration: 100,
            maxValue: 100,
            progressColors: const [
              Colors.orange,
              Colors.orangeAccent,
              Colors.deepOrange,
              Colors.deepOrangeAccent,
            ],
            backColor: Colors.black,
          ),
        ),
      );
    }

    final providers = [EmailAuthProvider()];

    return SignInScreen(
      headerBuilder: (context, constraints, shrinkOffset) {
        return Container(
          width: double.infinity,
          height: 100,
          color: Colors.amber[400],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/dog.png",
                height: 50,
                width: 50,
              ),
              SizedBox(width: 15),
              Text(
                "Seja Bem Vindo!",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        );
      },
      //Quando rotaciona a tela para o lado
      sideBuilder: (context, constraints) {
        return Image.asset(
          "assets/images/dog.png",
          height: constraints.maxHeight,
          width: constraints.maxWidth,
        );
      },
      subtitleBuilder: (context, action) {
        final actionText = switch (action) {
          AuthAction.signIn => 'Insira seus dados.',
          AuthAction.signUp => 'Cadastre-se.',
          _ => throw Exception('Inválido: $action'),
        };
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(actionText),
        );
      },
      providers: providers,
      actions: [
        AuthStateChangeAction<UserCreated>((context, state) {
          Get.offNamed('/home');
        }),
        AuthStateChangeAction<SignedIn>((context, state) async {
          Get.find<UserController>().setUserToken =
              await state.user?.getIdToken();
          Get.offNamed('/home');
        }),
      ],
    );
  }
}
