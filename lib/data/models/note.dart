class Note {
  const Note(this.title, this.text);
  final String title;
  final String text;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        json['title'] as String,
        json['text'] as String,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'text': text,
      };
}
