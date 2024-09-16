import 'package:riverpod/riverpod.dart';
import 'package:cicada_ascii_art/models/artist.dart';
import 'package:cicada_ascii_art/global_providers.dart';

class ArtistServices {
  final Ref container;
  final List<Artist> _artists = [];

  ArtistServices(this.container);

  void addArtist({required String name, String description = "None"}) {
    final artistService = container.read(artistServiceProvider);

    try {
      final artistName =
          artistService.artists.firstWhere((artist) => artist.name == name);

      print('\nArtist name already taken.');
    } catch (error) {
      final newArtist = Artist(name, description);
      _artists.add(newArtist);
      print('\nArtist $name has been added!');
    }
  }

  void viewAllArtists() {
    if (_artists.isEmpty) {
      print("No artists added.");
      return;
    }

    print("\n[ Artists ]");

    for (var artist in _artists) {
      print(artist);
    }
  }

  void viewArtist(String artistName) {
    final artistService = container.read(artistServiceProvider);

    if (_artists.isEmpty) {
      print("No artists added.");
      return;
    }

    var artist;

    try {
      artist = artistService.artists
          .firstWhere((artist) => artist.name == artistName);
      print(artist);
    } catch (error) {
      print('\nArtist not found.');
    }
  }

  List<Artist> get artists => _artists;
}
