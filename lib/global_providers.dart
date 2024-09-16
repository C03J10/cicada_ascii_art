import 'package:cicada_ascii_art/services/art_services.dart';
import 'package:cicada_ascii_art/services/artist_services.dart';
import 'package:riverpod/riverpod.dart';

final artServiceProvider = Provider((ref) => ArtServices(ref));
final artistServiceProvider = Provider((ref) => ArtistServices(ref));
