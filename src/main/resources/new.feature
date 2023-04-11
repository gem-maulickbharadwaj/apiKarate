Feature: new

  Scenario: Get Company
    Given url https://apis-beta.gemecosystem.com/company
    Given method get
    Given Print #(response)
    Given Print #(status)
    Given Print #(responseMessage)
    Given Assert : verify status : #(status) EQUALS 200
    Given Assert : verify response data : #(response.data[1]) EQUALS Gemini

  Scenario: Create New User
    Given url https://apis-beta.gemecosystem.com/user
    Given headers Authorization = Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYXVsaWNrX3Rlc3QiLCJhdWQiOiJDT1JQT1JBVEUiLCJpYXQiOjE2ODExOTQ4MzIsImV4cCI6MTY4MTIzODAzMn0.yyhvg5hXqCJVDv0JFKI61dgh_kbyYVB6OeXHLq900-r5Xj23-wFjOjyYOYT0iNaoDR2wM7SOeCLKLxGqzi1d_A
    Given requestBody {"username":"#epoch#","firstName":"test","lastName":"user","email":"#epoch#@geminisolutions.com","password":"abcd","company":"Dummy"}
    Given method post
    Given Print #(response)
    Given Print #(status)
    Given Print #(responseMessage)
    Given Print #(errorMessage)
    Given Assert : verify responseMessage : #(responseMessage) EQUALS Created
    Given Assert : verify response data : #(response.data) CONTAINS bridgeToken
    Given Assert : verify response data : #(response.operation) EQUAL success
#    Given Assert : verify response data : #(response.operation) NOT_EQUALS success

  Scenario: Create new project
    Given url https://apis.gemecosystem.com/v2/project
    Given headers Authorization = Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYXVsaWNrX3Rlc3QiLCJpYXQiOjE2ODExOTc4NzAsImV4cCI6MTY4MTI0MTA3MH0.rjUYqZecEq-wfvxXd-8xPe8vveNpe1kR4zyujwD9Oju__8cosyW1D_4HkHQHuitC_98_Kz19vQR91ij-GYdIJA
    Given requestBody {"projectName": "test#uuid#","description": "sample","managers": [],"qaLead": [],"devTeam": [],"qaTeam": [],"env": ["prod"]}
    Given method post
    Given Print #(response)
    Given Print #(status)
    Given Print #(responseMessage)
    Given Print #(errorMessage)
    Given Assert : verify responseMessage : #(response.operation) EQUALS Success
    Given Assert : verify responseMessage : #(response.operation) NOT_EQUALS Success
    Given Assert : verify responseMessage : #(response.operation) NOT_EQUALS success
    Given Assert : verify responseMessage : #(response.operation) NOT_EQUALS xyz
    Given Assert : verify responseMessage : #(response) CONTAINS operation
    Given Assert : verify responseMessage : #(response) NOT_CONTAINS operation
#    Given Assert : verify responseMessage : #(response) IN operation
#    Given Assert : verify responseMessage : #(response.operation) TO Success







