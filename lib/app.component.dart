import 'dart:async';

import 'package:angular2/angular2.dart';

import 'hero.dart';
import 'hero.service.dart';
import 'hero_detail.component.dart';

@Component(
    selector: 'app',
    templateUrl: 'app.component.html',
    styleUrls: const ['app.component.css'],
    providers: const [HeroService],
    directives: const [HeroDetailComponent, CORE_DIRECTIVES, FORM_DIRECTIVES],
    encapsulation: ViewEncapsulation.None)
class AppComponent implements OnInit {
  final String title = 'Tour of Heroes';

  // "final" initialized in ngOnInit
  List<Hero> heroes;

  Hero selectedHero;

  final HeroService _heroService;

  AppComponent(this._heroService);

  Future getHeroes() async {
    heroes = await this._heroService.getHeroes();
  }

  void ngOnInit() {
    getHeroes();
  }

  void onSelect(Hero hero) {
    selectedHero = hero;
  }
}
