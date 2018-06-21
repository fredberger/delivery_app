# DELIVERY APP

API to create, fetch and search PDV's

## Dependencies
#### Ruby
    2.5.0
#### Rails
    5.2.0
#### Postgres
    9.4+
#### PostGis Extension
    2.2+

## Run local

#### Download and install rvm

    http://rvm.io/

#### Install Ruby version 2.5.0

    rvm install 2.5.0

#### Create gemset

    rvm gemset create delivery_app
    rvm gemset use delivery_app

#### Install dependencies

    gem install bundler
    bundle install

#### Configure database

    bundle exec rails db:create
    bundle exec rails db:migrate
    bundle exec rails db:seed # To populate PDV list

#### Start server

    bundle exec rails s

## Tests

To run tests and generate coverage report:

    RAILS_ENV=test bundle exec rails db:migrate
    bundle exec rails spec


## Deploy

Master branch are setted to continuos delivery when build success


# Consume API's

## REST

#### Create PDV

Send a request:

    POST http://127.0.0.1:3000/pdvs

With Body:

    {
      "tradingName": "Adega da Cerveja - Pinheiros",
      "ownerName": "Zé da Silva",
      "document": "1432132123891/0001",
      "coverageArea": {
        "type": "MultiPolygon",
        "coordinates": [[[[30, 20],[45, 40],[10, 40],[30, 20]]]]
      },
      "address": {
        "type": "Point",
        "coordinates": [20, 35]
      }
    }

Response 200 ok:

    {
      "pdv": {
        "id": 3,
        "tradingName": "Adega da Cerveja - Pinheiros",
        "ownerName": "Zé da Silva",
        "document": "1432132123891/0001",
        "coverageArea": {
          "type": "MultiPolygon",
          "coordinates": [[[[30,20],[45,40],[10,40],[30,20]]]]
        },
        "address": {
          "type": "Point",
          "coordinates": [20,35]
        }
      },
      "successful": true
    }

#### Get PDV by id

Send a request:

    GET http://127.0.0.1:3000/pdvs/:id

Response 200 ok:

    {
      "pdv": {
        "id": 3,
        "tradingName": "Adega da Cerveja - Pinheiros",
        "ownerName": "Zé da Silva",
        "document": "1432132123891/0001",
        "coverageArea": {
          "type": "MultiPolygon",
          "coordinates": [[[[30,20],[45,40],[10,40],[30,20]]]]
        },
        "address": {
          "type": "Point",
          "coordinates": [20,35]
        }
      },
      "successful": true
    }

#### Search PDV

Send a request:

    GET http://127.0.0.1:3000/pdvs/search?lng=-43.29&lat=-23.01

Response 200 ok:

    {
      "pdv": {
        "id": 3,
        "tradingName": "Adega da Cerveja - Pinheiros",
        "ownerName": "Zé da Silva",
        "document": "1432132123891/0001",
        "coverageArea": {
          "type": "MultiPolygon",
          "coordinates": [[[[30,20],[45,40],[10,40],[30,20]]]]
        },
        "address": {
          "type": "Point",
          "coordinates": [20,35]
        }
      },
      "successful": true
    }

## GraphQL

#### Endpoint

    /graphql

#### Get PDV by id

    query {
        pdv(id: 51) {
            id
            tradingName
            ownerName
            document
        }
    }

#### Search PDV

    query {
        searchPdv(lng: -43.29, lat: -23.01) {
            id
            tradingName
            ownerName
            document
        }
    }

