import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';
import 'package:cicada_ascii_art/models/art.dart';
import 'package:cicada_ascii_art/global_providers.dart';

class ArtServices {
  final Ref container;
  final List<Art> _artworks = [];

  ArtServices(this.container);

  void addArtwork(
      {required String title,
      required String artistName,
      required String artwork}) {
    final artistService = container.read(artistServiceProvider);
    final artService = container.read(artServiceProvider);

    try {
      final artist = artistService.artists.firstWhere(
        (artist) => artist.name == artistName,
      );

      try {
        final artworkTitle =
            artService.artworks.firstWhere((artwork) => artwork.title == title);

        print('\nArtwork title already taken.');
      } catch (error) {
        final newArtwork = Art(title, artist, dateFormat(), artwork);
        _artworks.add(newArtwork);
        print('\nYour artwork $title has been added!');
      }
    } catch (error) {
      print('\nCannot find artist.');
    }
  }

  void viewAllArtworks() {
    if (_artworks.isEmpty) {
      print("\nNo artworks added.");
      return;
    }

    print("\n[ Artworks ]");
    for (var artwork in _artworks) {
      print(artwork);
    }
  }

  void viewArtwork(String artistName, artworkTitle) {
    final artistService = container.read(artistServiceProvider);
    final artService = container.read(artServiceProvider);
    if (_artworks.isEmpty) {
      print("\nNo artworks added.");
      return;
    }

    var artwork;

    try {
      final artist = artistService.artists.firstWhere(
        (artist) => artist.name == artistName,
      );

      try {
        artwork = artService.artworks.firstWhere((artwork) =>
            artwork.title == artworkTitle && artwork.artist.name == artistName);
        print(artwork);
      } catch (error) {
        print('\nArtwork not found.');
      }
    } catch (error) {
      print('\nCannot find artist.');
    }
  }

  String dateFormat() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('MMMM d, y HH:mm:ss');
    return formatter.format(now);
  }

  List<Art> get artworks => _artworks;
}
