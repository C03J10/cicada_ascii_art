import 'dart:io';
import 'package:cicada_ascii_art/global_providers.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  final container = ProviderContainer();
  final artServices = container.read(artServiceProvider);
  final artistServices = container.read(artistServiceProvider);

  while (true) {
    print(
        '\nWelcome to Cicada: The ASCII Art Collector. I\'m here to collect digital drawings.');
    print('[1] Add Artwork');
    print('[2] View All Artworks');
    print('[3] View Artwork');
    print('[4] Add Artist');
    print('[5] View All Artists');
    print('[6] View Artist');
    print('[7] Exit');
    print('Enter your choice: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print("\nPress Enter to finish artwork");

        List<String> art = [];

        while (true) {
          String? line = stdin.readLineSync();
          if (line != null && line.isNotEmpty) {
            art.add(line);
          } else {
            break;
          }
        }

        if (art.isEmpty) {
          print('\nArt must not be empty.');
          continue;
        }

        String artwork = art.join('\n');
        print('Enter artist\'s name:');
        String? artistName = stdin.readLineSync();

        if (artistName != null && artistName.isNotEmpty) {
          print('Name the artwork: ');
          String? title = stdin.readLineSync();

          if (title != null && title.isNotEmpty) {
            artServices.addArtwork(
                artistName: artistName, artwork: artwork, title: title);
          } else {
            print('\nTitle must not be empty.');
          }
        } else {
          print('\nArtist\'s name must not be empty.');
        }

      case '2':
        artServices.viewAllArtworks();
        break;

      case '3':
        print('\nEnter artist name: ');
        String? artistName = stdin.readLineSync();

        if (artistName != null && artistName.isNotEmpty) {
          print('Enter artwork title: ');
          String? artworkTitle = stdin.readLineSync();

          if (artworkTitle != null && artworkTitle.isNotEmpty) {
            artServices.viewArtwork(artistName, artworkTitle);
          } else {
            print('\nArtwork title must not be empty.');
          }
        } else {
          print('\nArtist name must not be empty.');
        }

        break;

      case '4':
        print("\nPress Enter the artist's name: ");

        String? name = stdin.readLineSync();

        if (name != null && name.isNotEmpty) {
          print('Give the artist a description: ');
          String? description = stdin.readLineSync();

          if (description != null && description.isNotEmpty) {
            artistServices.addArtist(name: name, description: description);
          } else {
            artistServices.addArtist(name: name);
          }
        } else {
          print('\nArtist name must not be empty.');
        }

      case '5':
        artistServices.viewAllArtists();
        break;

      case '6':
        print('\nEnter artist name: ');
        String? artistName = stdin.readLineSync();

        if (artistName != null && artistName.isNotEmpty) {
          artistServices.viewArtist(artistName);
        } else {
          print('\nArtist name must not be empty.');
        }

        break;

      case '7':
        print("\nHope I can see you again!");
        sleep(Duration(seconds: 3));

        print("\x1B[2J\x1B[0;0H");
        return;

      default:
        print('\nInvalid choice. Please try again.');
    }
  }
}
