
Feature: Test for the home page

    Background: Define URL
        Given url 'https://conduit-api.bondaracademy.com/api/'

    Scenario: Get all tags
        Given path 'tags'
        When method Get
        Then status 200
        And match response.tags contains ['Test', 'Coding']
        And match response.tags !contains 'truck'
        And match response.tags == '#array'

    Scenario: Get 10 articles
        Given params {limit:10, offset: 0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles == '#[10]'
        And match response.articlesCount == 10
  