# Voter API

## Description
[ERD Model](https://www.lucidchart.com/documents/view/189a7898-8bc2-445b-8711-91b9cbcf7f0e)

This is a Voter API application that tracks voters, candidates, and votes that voters cast with some light validations. Really, don't use this. I'm just practicing Ruby on Rails.

## Usage
Eventually, just clone the repository and run the rails server and look at the site!

`rake db:setup`
`rails server`
then probably go to http://localhost:3000

Currently serves JSON, YAML, and XML responses. If not specified, the endpoint will serve the unfinished HTML response, so you will most likely need to ask for one of the other supported responses, eg  `GET /votes/index.json`

Once the server is up, you'll be able to use these endpoints:

**Public Endpoints**

- GET /votes/show/:id
- GET /votes/index
- GET /voters/index
- POST /voters/create
- GET /candidates/index
- GET /candidates/show/:id

**Token-required Endpoints**

- DELETE /votes/destroy/:id
- POST /votes/create
- GET /voters/show/:id
- PUT /voters/update/:id

For the Token-required endpoints, add an HTTP Header Key `Authorization` with Value `Token {token}`. The `{token}` should be the appropriate voter's token.


## TODO
- [x] Create ERD Model
- [x] Setup associations in the db
- [x] Create controllers.
- [x] Ensure controllers are properly tested.
- [ ] Provide V in M**V**C (Create HTML pages)
