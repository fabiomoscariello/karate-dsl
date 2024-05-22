 Feature: Articles

    Background: Define URL
        Given url 'https://conduit-api.bondaracademy.com/api/'
        
        
    Scenario: Create a new articles
        Given path 'users/login'
        And request {"user": {"email": "test@test.it","password": "karate123"}}
        When method post
        Then status 200
        * def token = response.user.token

        Given header Authorization  = 'Token ' + token
        Given path 'articles'
        And request {"article": {"title": "Articolo Prova 2","description": "La prova di creazione dell'articolo 2","body": "Lorem ipsum ","tagList": ["test-articolo 2"]}}
        When method Post
        Then status 201
        And match response.article.title  == 'Articolo Prova 2'