import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hockey_quiz/base/app_theme.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParamsScreen extends StatelessWidget {
  const ParamsScreen({super.key});

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
          'Configurações',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 13,
            color: AppTheme.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SettingTile(
                text: 'Privacy Policy',
                onTap: () {},
              ),
              SettingTile(
                text: 'Terms of Use',
                onTap: () {},
              ),
              SettingTile(
                text: 'Support',
                onTap: () {},
              ),
              SettingTile(
                text: 'Rate app',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppTheme.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> rati(SharedPreferences bd) async {
  final rev = InAppReview.instance;
  bool alreadyRated = bd.getBool('isRated') ?? false;
  if (!alreadyRated) {
    if (await rev.isAvailable()) {
      rev.requestReview();
      await bd.setBool('isRated', true);
    }
  }
}

class GenScreen extends StatefulWidget {
  const GenScreen({super.key, required this.g});
  final String g;

  @override
  State<GenScreen> createState() => _GenScreenState();
}

class _GenScreenState extends State<GenScreen> {
  var _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            InAppWebView(
              onLoadStop: (controller, url) {
                controller.evaluateJavascript(
                    source:
                        "javascript:(function() { var ele=document.getElementsByClassName('docs-ml-header-item docs-ml-header-drive-link');ele[0].parentNode.removeChild(ele[0]);var footer = document.getelementsbytagname('footer')[0];footer.parentnode.removechild(footer);})()");
              },
              onProgressChanged: (controller, progress) => setState(() {
                _progress = progress;
              }),
              initialUrlRequest: URLRequest(
                url: Uri.parse(widget.g),
              ),
            ),
            if (_progress != 100)
              Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
