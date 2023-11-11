class Task {
  String id;
  String title;
  String description;
  bool isCompleted;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      this.isCompleted = false});

  // Convert Task to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
}
