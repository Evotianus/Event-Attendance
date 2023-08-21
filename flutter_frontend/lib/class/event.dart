class Event {
  String? eventId;
  String? title;
  String? content;
  String? image;
  String? location;
  String? date;
  String? time;
  String? createdAt;

  Event({
    this.eventId,
    this.title,
    this.content,
    this.image,
    this.location,
    this.date,
    this.time,
    this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        'id': eventId,
        'title': title,
        'content': content,
        'image': image,
        'location': location,
        'date': date,
        'time': time,
        'created_at': createdAt,
      };

  Event.fromJson(Map<String, dynamic> json)
      : eventId = json['id'],
        title = json['title'],
        content = json['content'],
        image = json['image'],
        location = json['location'],
        date = json['date'],
        time = json['time'],
        createdAt = json['created_at'];
}
