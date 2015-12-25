import 'package:angular2/angular2.dart';

import 'hero.dart';

@Component(
    selector: 'hero-detail',
    templateUrl: 'hero_detail.component.html',
    directives: const [CORE_DIRECTIVES, FORM_DIRECTIVES],
    styleUrls: const ['hero_detail.component.css'],
    encapsulation: ViewEncapsulation.None)
class HeroDetailComponent {
  @Input() Hero hero;
}
