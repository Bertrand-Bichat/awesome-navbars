## Le Wagon's navbar

Choose one of our templates:

- HTML template: you can find it on [Le Wagon's components library](http://lewagon.github.io/ui-components/#navbar)
- [ERB template without login](https://github.com/Bertrand-Bichat/awesome-navbars/blob/master/templates/_navbar_wagon_without_login.html.erb)
- [ERB template with login](https://github.com/Bertrand-Bichat/awesome-navbars/blob/master/templates/_navbar_wagon.html.erb) using [Devise](https://github.com/plataformatec/devise) helpers.

This last navbar with login add some custom personal additions (French translation + edit account in dropdown +
root_path with logo & home link_to + image alt + some additions for accessibility as header tag,
nav tag, role="navigation", aria-label).

## Custom footer

I added a footer ERB template with Bootstrap + social media links + internal pages links + copyright +
link to website author + accessibility (footer tag, role="contentinfo", aria-label) +
French translation + security for external links with target="blank" and rel="noopener noreferrer"
