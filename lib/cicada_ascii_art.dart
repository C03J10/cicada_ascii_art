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
      //Add Artwork
      case '1':
        print("\nLet's add some artwork.");
        print("Press Enter to finish artwork");

        String? artwork = stdin.readLineSync();

        if (!(artwork != null && artwork.isNotEmpty)) {
          print('Art must not be empty.');
          return;
        }

        print('Enter artist\'s name:');
        String? artistName = stdin.readLineSync();

        if (artistName != null && artistName.isNotEmpty) {
          print('Name the artwork: ');
          String? title = stdin.readLineSync();

          if (title != null && title.isNotEmpty) {
            artServices.addArtwork(
                artistName: artistName, artwork: artwork, title: title);
          } else {
            artServices.addArtwork(artistName: artistName, artwork: artwork);
          }
        } else {
          print('Artist\'s name must not be filled blank.');
        }

      //View All Artwork
      case '2':
        artServices.viewAllArtworks();
        break;

      //View Artwork
      case '3':
        artServices.viewAllArtworks();
        break;

      case '4':
        print("Press Enter the artist's name: ");

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
          print('Artist name must not be empty.');
        }

      //View All Artists
      case '5':
        artServices.viewAllArtworks();
        break;

      //View Artist
      case '6':
        artServices.viewAllArtworks();
        break;

      //Exit
      case '7':
        print("\nHope I can see you again!");
        sleep(Duration(seconds: 3));
        //clear console
        print("\x1B[2J\x1B[0;0H");
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}
