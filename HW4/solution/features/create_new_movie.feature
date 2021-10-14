Feature: create movies

  As a movie buff
  So that I can update the movie list
  I want to be able to add a new movie

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: add a movie
  When I am on the home page
  And  I follow "Add new movie"
  And  I fill in "Title" with "Hangover"
  And  I fill in "Director" with "Todd Phillips"
  Then I press "Save Changes"
  And  I should see "Hangover was successfully created."
  