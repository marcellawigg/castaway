##Introduction

Castaway is a Rails app using the [Audiosear.ch](https://www.audiosear.ch/) API to create a marketplace that connects potential advertisers and podcasters. Podcasters can claim their podcast, verified by their email domain name matching the domain of the podcast, and set the price they wish advertisers to pay for a short advertising spot. Then, advertisers can purchase advertisements using Braintree Payments. This site utilizes third-party API consumption (uses EmailHunter to find primary contacts at different podcasts), custom rake tasks to seed a PostgreSQL database, Isotope to display images, PG Search to efficiently search a database, Braintree Payments to make purchases, and Bootstrap for styling.

##Development

This project utilizes Ruby on Rails as a web app framework, [Braintree](https://github.com/lyang/braintree-rails) for its payment system, [Isotope](http://isotope.metafizzy.co/) for displaying images, [Cloudinary](http://cloudinary.com/) for fomratting images, and [Bootstrap](http://getbootstrap.com/) for styling.

##Production

Visit my live app at [Cast-Away](cast-away-app.herokuapp.com/)!
