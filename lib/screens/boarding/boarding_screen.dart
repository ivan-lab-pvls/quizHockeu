import 'package:flutter/material.dart';
import 'package:hockey_quiz/base/core_widgets/custom_button.dart';
import 'package:hockey_quiz/base/app_theme.dart';
import 'package:hockey_quiz/screens/main/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final PageController _controller = PageController();
  late final SharedPreferences _bd;

  @override
  void initState() {
    super.initState();
    _bd = context.read<SharedPreferences>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          BoardingChild(
            onTap: () {
              _controller.nextPage(
                duration: const Duration(milliseconds: 350),
                curve: Curves.ease,
              );
            },
            asset: 'images/on_boarding_first.png',
            title: 'Desafie seu QI de hóquei',
            text:
                'Prepare-se para mergulhar no emocionante mundo das curiosidades do hóquei. Quer você seja um fã obstinado ou esteja apenas começando, nosso aplicativo foi projetado para desafiar e entreter você com uma variedade de categorias e perguntas.',
          ),
          BoardingChild(
            onTap: () async {
              await _bd.setBool('onBoard', true);
              if (!mounted) {
                return;
              }
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
            },
            asset: 'images/on_boarding_second.png',
            title: 'Escolha uma categoria',
            text:
                'Explore tópicos como história do hóquei, recordes de jogadores, equipes e troféus e seleções nacionais. Teste seus conhecimentos com 10 questões em cada categoria.',
          ),
        ],
      ),
    );
  }
}

class BoardingChild extends StatelessWidget {
  const BoardingChild(
      {super.key,
      required this.asset,
      required this.title,
      required this.text,
      required this.onTap});
  final String asset;
  final String title;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Image.asset(
            asset,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          flex: 4,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: context.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    text,
                    style: context.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  CustomButton(
                    title: 'CONTINUAR',
                    onTap: onTap,
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  const Terms(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Ao clicar no botão “Continuar”, você concorda com nossos ',
        style: const TextStyle(
          color: AppTheme.grey,
          fontSize: 9,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: 'Termos de uso ',
            style: TextStyle(color: context.theme.primaryColor),
          ),
          const TextSpan(
            text: 'e ',
          ),
          TextSpan(
            text: 'Restauração da Política de Privacidade',
            style: TextStyle(color: context.theme.primaryColor),
          ),
        ],
      ),
    );
  }
}
