 Feature: Articles

    Background: Define URL
        Given url 'https://conduit-api.bondaracademy.com/api/'
        * def tokenResponse = call read('classpath:helpers/CreateToken.feature') {"email": "test@test.it","password":"karate123"}
        * def token = tokenResponse.authToken
        
        
    Scenario: Create a new articles
        Given header Authorization  = 'Token ' + token
        Given path 'articles'
        And request {"article": {"title": "Articolo Prova 3","description": "La prova di creazione dell'articolo 2","body": "Lorem ipsum ","tagList": ["test-articolo 2"]}}
        When method Post
        Then status 201
        And match response.article.title  == 'Articolo Prova 3'