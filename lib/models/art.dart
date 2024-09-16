import 'package:cicada_ascii_art/models/artist.dart';

class Art {
  String title;
  Artist artist;
  String date;
  String artwork;

  Art(this.title, this.artist, this.date, this.artwork);

  @override
  String toString() {
    return '\nTitle: $title\nMade by: ${artist.name}\nDate: $date\n$artwork';
  }
}
