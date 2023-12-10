import 'package:hockey_quiz/models/question_model.dart';
import 'package:hockey_quiz/models/quiz_model.dart';

class HockeyQuizes {
  static final List<QuizModel> quizes = [
    ///Football History
    const QuizModel(
      title: 'História do Hóquei',
      questions: [
        QuestionModel(
          question: 'Quem é considerado o “Grande” do hóquei?',
          answers: ['Mario Lemieux', 'Wayne Gretzky', 'Bobby Orr'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question: 'Em que ano foi fundada a National Hockey League (NHL)?',
          answers: ['1925', '1917', '1932'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question: 'Qual time ganhou a primeira Copa Stanley em 1893?',
          answers: [
            'Montreal Canadiens',
            'Montreal Hockey Club',
            'Toronto Arenas'
          ],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Quem é o maior artilheiro de todos os tempos do hóquei no gelo olímpico?',
          answers: ['Sidney Crosby', 'Teemu Selänne', 'Jaromír Jágr'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Em que ano ocorreu o "Milagre no Gelo" nas Olimpíadas de Inverno?',
          answers: ['1976', '1980', '1984'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question: 'Quem é a primeira mulher a jogar um jogo da NHL?',
          answers: ['Angela Ruggiero', 'Manon Rhéaume', 'Hayley Wickenheiser'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question: 'Qual país ganhou mais campeonatos mundiais IIHF?',
          answers: ['Canada', 'Soviet Union/Russia', 'Sweden'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Quem detém o recorde de mais gols em uma única temporada da NHL?',
          answers: ['Wayne Gretzky', 'Brett Hull', 'Maurice Richard'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              "Em que ano a NHL se expandiu além dos times “Original Six”?",
          answers: ['1957', '1967', '1974'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question: 'Qual jogador é conhecido como "Sr. Hockey"?',
          answers: ['Bobby Hull', 'Gordie Howe', 'Phil Esposito'],
          rightAnswerIndex: 1,
        ),
      ],
    ),

    ///Football clubs & trophies
    const QuizModel(
      title: 'Times e troféus de hóquei',
      questions: [
        QuestionModel(
          question: 'Qual time ganhou mais campeonatos da Stanley Cup?',
          answers: [
            'Detroit Red Wings',
            'Montreal Canadiens',
            'Toronto Maple Leafs'
          ],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Em que ano os Pittsburgh Penguins entraram na NHL como um time de expansão?',
          answers: ['1966', '1967', '1974'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question: 'Qual time da NHL é conhecido como "Broad Street Bullies"?',
          answers: [
            'Chicago Blackhawks',
            'Philadelphia Flyers',
            'Boston Bruins'
          ],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question: 'Em que ano os Edmonton Oilers ingressaram na NHL?',
          answers: ['1972', '1979', '1983'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question: "Qual time ganhou mais Troféus de Presidentes?",
          answers: [
            'Boston Bruins',
            'Washington Capitals',
            'Chicago Blackhawks'
          ],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Em qual time Wayne Gretzky estava jogando quando estabeleceu o recorde de pontos em uma única temporada?',
          answers: ['Los Angeles Kings', 'Edmonton Oilers', 'New York Rangers'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question: 'Qual time ganhou o primeiro Draft Lottery da NHL em 1963?',
          answers: [
            'Montreal Canadiens',
            'Detroit Red Wings',
            'Toronto Maple Leafs'
          ],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Em que ano os Vegas Golden Knights ingressaram na NHL como uma equipe de expansão?',
          answers: ['2016', '2017', '2018'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Qual time derrotou o Detroit Red Wings na final da Stanley Cup de 2008?',
          answers: [
            'Pittsburgh Penguins',
            'Tampa Bay Lightning',
            'Chicago Blackhawks'
          ],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Em qual time Mark Messier estava jogando quando garantiu a vitória nos playoffs de 1994?',
          answers: ['Edmonton Oilers', 'New York Rangers', 'Vancouver Canucks'],
          rightAnswerIndex: 1,
        ),
      ],
    ),

    /// Player records
    const QuizModel(
      title: 'Registros de jogadores de hóquei',
      questions: [
        QuestionModel(
          question:
              'Quem detém o recorde de mais pontos em uma única temporada da NHL?',
          answers: ['Lionel Messi', 'Wayne Gretzky', 'Mario Lemieux'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Qual jogador tem mais gols na carreira na história da NHL?',
          answers: ['Wayne Gretzky', 'Wayne Gretzky', 'Gordie Howe'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Quem é o jogador mais jovem a marcar 50 gols em uma temporada da NHL?',
          answers: ['Sidney Crosby', 'Wayne Gretzky', 'Alexander Ovechkin'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Em que ano Bobby Orr se tornou o único defensor a ganhar o título de artilheiro da NHL?',
          answers: ['1968-69', '1969-70', '1970-71'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Quem é o líder de todos os tempos em minutos de pênalti na NHL?',
          answers: ['Chris Nilan', 'Tiger Williams', 'Dave Schultz'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Qual goleiro detém o recorde de maior número de derrotas na carreira na NHL?',
          answers: ['Patrick Roy', 'Martin Brodeur', 'Dominik Hašek'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Quem é o único goleiro a marcar um gol tanto na temporada regular quanto nos playoffs?',
          answers: ['Patrick Roy', 'Ron Hextall', 'Martin Brodeur'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Qual jogador detém o recorde de mais assistências em uma única temporada da NHL?',
          answers: ['Patrick Roy', 'Wayne Gretzky', ' Bobby Orr'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Quem é o líder de todos os tempos em gols nos playoffs da NHL?',
          answers: ['Ron Hextall', 'Wayne Gretzky', 'Mark Messier'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question: 'Qual jogador era conhecido como "The Finnish Flash"?',
          answers: ['Jari Kurri', 'Teemu Selänne', 'Saku Koivu'],
          rightAnswerIndex: 1,
        ),
      ],
    ),

    /// National Team
    const QuizModel(
      title: 'Seleções Nacionais de Hóquei',
      questions: [
        QuestionModel(
          question:
              'Qual país ganhou mais campeonatos mundiais juniores da IIHF?',
          answers: ['Russia', 'Canada', 'Sweden'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Em que ano os Estados Unidos conquistaram sua primeira medalha de ouro olímpica no hóquei no gelo?',
          answers: ['2010', '2002', '1998'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Em que ano os Estados Unidos conquistaram sua primeira medalha de ouro olímpica no hóquei no gelo?',
          answers: ['1956', '1960', '1964'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Quem é o maior artilheiro de todos os tempos na história do Campeonato Mundial IIHF?',
          answers: ['Teemu Selänne', 'Pavel Bure', 'Wayne Gretzky'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Qual país ganhou mais medalhas de ouro olímpicas no hóquei no gelo feminino?',
          answers: ['United States', 'Canada', 'Sweden'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Qual país asiático ganhou mais vezes a Copa Asiática de Seleções?',
          answers: ['Japan', 'South Korea', 'Iran'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Em que ano a seleção da União Soviética participou pela primeira vez nas Olimpíadas?',
          answers: ['1948', '1952', '1956'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Qual país ganhou o primeiro Campeonato Mundial Feminino de Hóquei no Gelo em 1990?',
          answers: ['United States', 'Canada', 'Sweden'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Em que ano a seleção da República Checa conquistou a sua primeira medalha de ouro olímpica?',
          answers: ['1992', '1998', '2002'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Qual nação ganhou mais campeonatos mundiais da IIHF no hóquei no gelo feminino?',
          answers: ['United States', 'Canada', 'Finland'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Quem é o maior artilheiro de todos os tempos do hóquei no gelo feminino olímpico?',
          answers: ['Angela James', 'Meghan Agosta', 'Hayley Wickenheiser'],
          rightAnswerIndex: 1,
        ),
        QuestionModel(
          question:
              'Qual país sediou o primeiro Campeonato Mundial Masculino de Hóquei no Gelo em 1920?',
          answers: ['Sweden', 'Czechoslovakia', 'Switzerland'],
          rightAnswerIndex: 1,
        ),
      ],
    ),
  ];
}
