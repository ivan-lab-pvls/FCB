import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_news/data/models/note.dart';
import 'package:sport_news/pages/init/init_page.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Scaffold(
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: UnconstrainedBox(
                child: MButton(
                  onTap: () {
                    if (_textController.text.isEmpty ||
                        _titleController.text.isEmpty) {
                      return;
                    }

                    context.pop(
                      Note(
                        _titleController.text,
                        _textController.text,
                      ),
                    );
                  },
                  text: 'CONTINUE',
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () => context.pop(),
                    child: UnconstrainedBox(
                      child: Image.asset(
                        'assets/back_button.png',
                        height: 50,
                      ),
                    ),
                  ),
                  title: const Text(
                    'New Note',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2E2E2E),
                    ),
                  ),
                  pinned: true,
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _titleController,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF131313),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Note title',
                            hintStyle: TextStyle(
                              color: Color(0xFFAEAEAE),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _textController,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF131313),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Note text',
                            hintStyle: TextStyle(
                              color: Color(0xFFAEAEAE),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
