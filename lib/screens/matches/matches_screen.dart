import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hockey_quiz/base/app_theme.dart';
import 'package:hockey_quiz/models/hockey_rep.dart';
import 'package:intl/intl.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  _MatchesScreenState createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  final HockeyRep hockeyRep = HockeyRep();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: UnconstrainedBox(
            child: SvgPicture.asset('images/back_arrow.svg'),
          ),
        ),
        title: const Text(
          'JOGOS DE HÓQUEI',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 13,
            color: AppTheme.black,
          ),
        ),
      ),
      body: FutureBuilder(
        future: hockeyRep.matches(),
        builder: (context, snapshot) {
          final List<Match> matchData = snapshot.data ?? [];
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Nenhuma partida hoje!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
            );
          }

          if (matchData.isEmpty) {
            return const Center(
              child: Text(
                'Nenhuma partida hoje!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
                width: MediaQuery.of(context).size.width,
                child: const Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          'Partidas de hóquei',
                          style: TextStyle(
                            color: AppTheme.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  10,
                  (index) => MatchItem(
                    match: matchData[index],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}

class MatchItem extends StatelessWidget {
  const MatchItem({super.key, required this.match});

  final Match match;
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = match.time;
    Duration remainingTime = dateTime.difference(DateTime.now());

    int hrs = remainingTime.inHours;
    int mins = remainingTime.inMinutes.remainder(60);
    final bool isAgo = hrs < 0;

    final timeL =
        '${hrs.abs()} h ${mins.abs()} min${isAgo ? ' atrás' : ''}';

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: context.theme.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    timeL,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 30,
                    width: 30,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        match.homeTeamLogo,
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Icon(Icons.people);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    match.homeTeamTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                DateFormat('HH:mm').format(match.time),
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    match.league,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 30,
                    width: 30,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        match.awayTeamLogo,
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Icon(Icons.people);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    match.awayTeamTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
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
