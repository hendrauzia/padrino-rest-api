# padrino-rest-api

This is an example of rest api using padrino. You can find an online version of
this application at http://padrino-rest-api.herokuapp.com/ with the deployed
version refers to the HEAD of this repository.

# Usage

Following you can find the usage of this rest-api complete with request and
response example. You can use the server in
[Heroku](http://padrino-rest-api.herokuapp.com/) or you can also use local
version of the server using this repository running in your local workstation.

## Installation

Installation step should be fairly simple, please install the following
requirements of this application before moving forward to the next step.

* Ruby 2.2.2
* Bundler
* PostgreSQL

To run this application, first install the dependencies.

    bundle install

Make sure you set database user to the right user in the `config/database.rb`
by changing the `username`, and setup the database.

    bundle exec rake ar:setup

Run the test to make sure things run correctly.

    bundle exec rspec

If all goes well, run the application.

    bundle exec padrino start

## Company

There is 2 api in total on manipulating the company data, following are the api
that you can use.

### Retrieve all companies

    GET /api/companies

**Example**

    curl http://127.0.0.1:3000/api/companies

**Response**

```json
[
  {
    "id": 9,
    "name": "Rohan and Sons",
    "address": "2882 Solon Cape",
    "city": "Lake Sherwoodland",
    "country": "Uganda",
    "email": null,
    "phone": null,
    "created_at": "2015-04-23T00:58:57.583Z",
    "updated_at": "2015-04-23T00:58:57.583Z"
  }
]
```

### Create a company

    POST /api/companies

**Input**

| Name    | Type   | Description                                  |
| ------- | ------ | -------------------------------------------- |
| name    | string | **Required**. The name of the company.       |
| address | string | **Required**. Street address of the company. |
| city    | string | **Required**. City name of the company.      |
| country | string | **Required**. Country name of the company.   |
| email   | string | Company email address.                       |
| phone   | string | Company phone number.                        |

**Example**

Let's put the json data to be posted in a file named `body.json`.

```json
{
  "name": "Rohan and Sons",
  "address": "2882 Solon Cape",
  "city": "Lake Sherwoodland",
  "country": "Uganda",
  "email": null,
  "phone": null
}
```

And you can use curl with json above as the data to be posted.

    curl -H "Content-Type: application/json" -X POST -d @body.json http://127.0.0.1:3000/api/companies

**Response**

```json
{
  "id": 9,
  "name": "Rohan and Sons",
  "address": "2882 Solon Cape",
  "city": "Lake Sherwoodland",
  "country": "Uganda",
  "email": null,
  "phone": null,
  "created_at": "2015-04-24T02:48:33.767Z",
  "updated_at": "2015-04-24T02:48:33.767Z"
}
```

### Retrieve a company

    GET /api/companies/:id

**Example**

    curl http://127.0.0.1:3000/api/companies/9

**Response**

```json
{
  "id": 9,
  "name": "Rohan and Sons",
  "address": "2882 Solon Cape",
  "city": "Lake Sherwoodland",
  "country": "Uganda",
  "email": null,
  "phone": null,
  "created_at": "2015-04-24T02:48:33.767Z",
  "updated_at": "2015-04-24T02:48:33.767Z"
}
```
