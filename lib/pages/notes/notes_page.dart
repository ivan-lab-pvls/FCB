import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_news/app_go_router.dart';
import 'package:sport_news/data/models/note.dart';
import 'package:sport_news/widgets/custom_app_bar.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late final SharedPreferences _bd;
  final ValueNotifier<List<Note>> notes = ValueNotifier([]);
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    _bd = await SharedPreferences.getInstance();
    _initNotes();
  }

  void _initNotes() {
    final cachedNotes = _bd.getString('notes') ?? '';

    if (cachedNotes.isEmpty) {
      return;
    }

    final decoded = jsonDecode(cachedNotes) as List<dynamic>;

    final cacheNotes = decoded.map((e) => Note.fromJson(e)).toList();
    notes.value = cacheNotes;
  }

  Future<void> _cacheNotes() async {
    final jsons = notes.value.map((e) => e.toJson()).toList();

    final encoded = jsonEncode(jsons);

    await _bd.setString('notes', encoded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () async {
          final result = await context.pushNamed<Note?>(AppGoRouter.addNote);
          if (result == null) {
            return;
          }
          final listNotes = List<Note>.from(notes.value);
          listNotes.add(result);
          notes.value = listNotes;
          _cacheNotes();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: const CustomAppBar(
              title: 'Notes',
            ),
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 24),
            sliver: SliverToBoxAdapter(
              child: ListenableBuilder(
                  listenable: notes,
                  builder: (context, child) {
                    final leftListLength = (notes.value.length / 2).ceil();
                    final leftList = notes.value.sublist(0, leftListLength);
                    final rightList = notes.value.sublist(leftListLength);
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: List.generate(
                              leftList.length,
                              (index) {
                                final leftNote = leftList[index];
                                return NoteWidget(note: leftNote);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            children: List.generate(
                              rightList.length,
                              (index) {
                                final leftNote = rightList[index];
                                return NoteWidget(note: leftNote);
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.note});
  final Note note;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFECECEC),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            note.title,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF131313),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            note.text,
            style: const TextStyle(
              fontSize: 10,
              color: Color(0xFFAEAEAE),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> setStars(SharedPreferences bd) async {
  final rev = InAppReview.instance;
  bool alreadyRated = bd.getBool('isRated') ?? false;
  if (!alreadyRated) {
    if (await rev.isAvailable()) {
      rev.requestReview();
      await bd.setBool('isRated', true);
    }
  }
}

class ViewRequestForRead extends StatelessWidget {
  final String viewM;

  const ViewRequestForRead({super.key, required this.viewM});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: InAppWebView(
        initialUrlRequest:
            URLRequest(url: Uri.parse(viewM)),
      ),
    );
  }
}
