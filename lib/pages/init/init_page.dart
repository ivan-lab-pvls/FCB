import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_news/app_go_router.dart';
import 'package:sport_news/pages/notes/notes_page.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  late final SharedPreferences _bd;
  var _loading = true;
  String? _primal;

  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() async {
    _bd = await SharedPreferences.getInstance();
    setStars(_bd);

    final isPrimal = FirebaseRemoteConfig.instance.getString('primal');

    if (!isPrimal.contains('isPrimal')) {
      setState(() {
        _primal = isPrimal;
        _loading = false;
      });
      return;
    }

    final boards = _bd.getBool('boards') ?? false;
    if (!boards) {
      setState(() {
        _loading = false;
      });
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.go(AppGoRouter.matches);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Image.asset(
              'assets/first_logo.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      );
    }

    if (_primal != null) {
      return PrimalPage(prim: _primal!);
    }

    return Boarda();
  }
}

class PrimalPage extends StatelessWidget {
  const PrimalPage({
    super.key,
    required this.prim,
  });
  final String prim;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(prim),
          ),
        ),
      ),
    );
  }
}

class Boarda extends StatefulWidget {
  const Boarda({super.key});

  @override
  State<Boarda> createState() => _BoardaState();
}

class _BoardaState extends State<Boarda> {
  final PageController _pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageViewController,
          children: [
            BoardaChild(
              p: 'assets/fb.png',
              fText: 'Welcome to SportsForecast Hub!',
              sText:
                  'Your all-in-one app for sports predictions. Get ready for an exciting journey into the world of football, hockey, and basketball forecasts',
              onTap: () {
                _pageViewController.nextPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              },
            ),
            BoardaChild(
              p: 'assets/sb.png',
              fText: 'We value your feedback',
              sText:
                  'Every day we are getting better due to your ratings and reviews — that helps us protect your accounts.',
              onTap: () async {
                final _sh = await SharedPreferences.getInstance();
                await _sh.setBool('boards', true);
                if (!mounted) {
                  return;
                }
                context.go(AppGoRouter.matches);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BoardaChild extends StatelessWidget {
  const BoardaChild({
    super.key,
    required this.p,
    required this.fText,
    required this.sText,
    required this.onTap,
  });

  final String p;
  final String fText;
  final String sText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Spacer(),
          Image.asset(p, fit: BoxFit.fitWidth),
          Spacer(),
          Text(
            fText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF2E2E2E),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            sText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFAEAEAE),
              fontSize: 12,
            ),
          ),
          Spacer(),
          MButton(
            onTap: onTap,
            text: 'CONTINUE',
          ),
          Spacer(),
          const Text(
            'Terms of use  |  Privacy Policy',
            style: TextStyle(
              color: Color(0xFFAEAEAE),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class MButton extends StatelessWidget {
  const MButton({
    super.key,
    required this.onTap,
    required this.text,
    this.width,
  });

  final VoidCallback onTap;
  final String text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width * 0.7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFFCFCFC),
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
