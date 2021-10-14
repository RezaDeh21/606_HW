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

Scenario: delete a movie
  When I am on the details page for "Blade Runner"
  And  I follow "Delete"
  Then I should be on the home page
  And  I should not see "Movie 'Alien'"
  And  I should not see "Ridley Scott"