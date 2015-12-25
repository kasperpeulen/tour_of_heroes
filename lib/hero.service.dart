import 'dart:async';

import 'package:angular2/angular2.dart';

import 'hero.dart';
import 'mock_heroes.dart';

@Injectable()
class HeroService {
  Future<List<Hero>> getHeroes() => new Future(() => mockHeroes);

  Future<List<Hero>> getHeroesSlowly() {
    return new Future.delayed(const Duration(seconds: 2), () => mockHeroes);
  }
}
