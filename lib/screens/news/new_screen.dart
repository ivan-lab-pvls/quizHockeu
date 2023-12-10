import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hockey_quiz/base/app_theme.dart';
import 'package:hockey_quiz/models/event.dart';
import 'package:intl/intl.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key, required this.event});
  final Event event;

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
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      event.title,
                      style: context.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      DateFormat('dd.MM.yyyy').format(event.time),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppTheme.greyD),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 24),
              sliver: SliverToBoxAdapter(
                child: Image.network(
                  event.url,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.text,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
