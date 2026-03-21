class Note {
  final int id;
  String title;
  String text;
  DateTime updatedAt;

  Note(this.id, this.title, this.text, this.updatedAt);

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      json['id'] as int,
      json['title'] as String,
      json['text'] as String,
      DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'text': text,
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
