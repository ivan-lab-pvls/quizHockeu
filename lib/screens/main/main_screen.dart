import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hockey_quiz/base/app_theme.dart';
import 'package:hockey_quiz/models/hockey_quizes.dart';
import 'package:hockey_quiz/screens/matches/matches_screen.dart';
import 'package:hockey_quiz/screens/news/news_screen.dart';
import 'package:hockey_quiz/screens/vicorine/victorine_screen.dart';
import 'package:hockey_quiz/screens/params/params_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Teste de hóquei',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppTheme.black,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ParamsScreen(),
                      ),
                    ),
                    child: SvgPicture.asset('images/params.svg'),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 12,
              ),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final quiz = HockeyQuizes.quizes[index];

                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => VictorineScreen(quiz: quiz),
                        ),
                      ),
                      child: Container(
                        color: AppTheme.greyL,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${quiz.questions.length} questões',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: context.theme.primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              quiz.title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: AppTheme.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: HockeyQuizes.quizes.length,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NewsScreen(),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  height: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/hockey_news.png'),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MatchesScreen(),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(12),
                  height: 120,
                  color: context.theme.primaryColor,
                  alignment: Alignment.center,
                  child: const Text(
                    'Partidas de Hóquei',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
