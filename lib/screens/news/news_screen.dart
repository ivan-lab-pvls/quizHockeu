import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hockey_quiz/base/app_theme.dart';
import 'package:hockey_quiz/models/hockey_news.dart';
import 'package:hockey_quiz/models/event.dart';
import 'package:hockey_quiz/screens/news/new_screen.dart';
import 'package:intl/intl.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

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
          'NEWS',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 13,
            color: AppTheme.black,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              sliver: SliverList.builder(
                itemCount: HockeyNews.news.length,
                itemBuilder: (context, index) {
                  final event = HockeyNews.news[index];
                  return EventItem(event: event);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => NewScreen(event: event),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
          right: 16,
          left: 24,
        ),
        color: AppTheme.greyL,
        child: IntrinsicHeight(
          child: Row(
            children: [
              Image.network(
                event.url,
                fit: BoxFit.cover,
                height: 150,
                width: 120,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      event.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: AppTheme.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      event.text,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.black,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            event.theme,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppTheme.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            DateFormat('dd.MM.yyyy').format(event.time),
                            style: TextStyle(
                              fontSize: 12,
                              color: AppTheme.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
