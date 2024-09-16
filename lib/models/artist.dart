class Artist {
  String name;
  String description;

  Artist(this.name, this.description);

  @override
  String toString() {
    return '\nArtist: $name\nDescription: $description';
  }
}
