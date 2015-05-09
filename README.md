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

There are several api that you can use to manipulate the company data,
following are the api that you can use. All api include side-load data to
reduce application requests.

### Retrieve all companies

    GET /api/companies

**Example**

    curl http://127.0.0.1:3000/api/companies

**Response**

```json
{
  "companies": [
    {
      "id": 9,
      "name": "Rohan and Sons",
      "address": "2882 Solon Cape",
      "city": "Lake Sherwoodland",
      "country": "Uganda",
      "email": null,
      "phone": null,
      "created_at": "2015-04-23T00:58:57.583Z",
      "updated_at": "2015-04-23T00:58:57.583Z",
      "employees": [
        9
      ]
    }
  ],
  "positions": [
    {
      "id": 2,
      "name": "Director",
      "created_at": "2015-04-29T02:05:28.092Z",
      "updated_at": "2015-04-29T02:05:28.092Z"
    }
  ],
  "employees": ]
    {
      "id": 9,
      "name": "Halle Kuhlman",
      "position_id": 2,
      "company_id": 9,
      "created_at": "2015-04-29T02:05:28.122Z",
      "updated_at": "2015-04-29T02:05:28.122Z"
    }
  ]
}
```

### Create a company

    POST /api/companies

**Input**

The following input must be put inside json root named `company`.

| Name    | Type   | Description                                  |
| ------- | ------ | -------------------------------------------- |
| name    | string | **Required**. The name of the company.       |
| address | string | **Required**. Street address of the company. |
| city    | string | **Required**. City name of the company.      |
| country | string | **Required**. Country name of the company.   |
| email   | string | Company email address.                       |
| phone   | string | Company phone number.                        |

**Example**

Let's put the json data to be created in a file named `body.json`.

```json
{
  "company": {
    "name": "Rohan and Sons",
    "address": "2882 Solon Cape",
    "city": "Lake Sherwoodland",
    "country": "Uganda",
    "email": null,
    "phone": null
  }
}
```

And you can use curl with json above as the data to be created.

    curl -H "Content-Type: application/json" -X POST -d @body.json http://127.0.0.1:3000/api/companies

**Response**

```json
{
  "company": {
    "id": 9,
    "name": "Rohan and Sons",
    "address": "2882 Solon Cape",
    "city": "Lake Sherwoodland",
    "country": "Uganda",
    "email": null,
    "phone": null,
    "created_at": "2015-04-24T02:48:33.767Z",
    "updated_at": "2015-04-24T02:48:33.767Z",
    "employees": []
  },
  "employees": []
}
```

### Retrieve a company

    GET /api/companies/:id

**Example**

    curl http://127.0.0.1:3000/api/companies/9

**Response**

```json
{
  "company": {
    "id": 9,
    "name": "Rohan and Sons",
    "address": "2882 Solon Cape",
    "city": "Lake Sherwoodland",
    "country": "Uganda",
    "email": null,
    "phone": null,
    "created_at": "2015-04-24T02:48:33.767Z",
    "updated_at": "2015-04-24T02:48:33.767Z",
    "employees": [
      9
    ]
  },
  "positions": [
    {
      "id": 2,
      "name": "Director",
      "created_at": "2015-04-29T02:05:28.092Z",
      "updated_at": "2015-04-29T02:05:28.092Z"
    }
  ],
  "employees": ]
    {
      "id": 9,
      "name": "Halle Kuhlman",
      "position_id": 2,
      "company_id": 9,
      "created_at": "2015-04-29T02:05:28.122Z",
      "updated_at": "2015-04-29T02:05:28.122Z"
    }
  ]
}
```

### Update a company

    PATCH /api/companies/:id

**Input**

The following input must be put inside json root named `company`.

| Name    | Type   | Description                                  |
| ------- | ------ | -------------------------------------------- |
| name    | string | **Required**. The name of the company.       |
| address | string | **Required**. Street address of the company. |
| city    | string | **Required**. City name of the company.      |
| country | string | **Required**. Country name of the company.   |
| email   | string | Company email address.                       |
| phone   | string | Company phone number.                        |


**Example**

Let's put the json data to be updated in a file named `body.json`.

```json
{
  "company" : {
    "name": "Rutherford and Sons",
    "address": "38457 Heaney Ranch",
    "city": "North Autumnport",
    "country": "Sierra Leone",
    "email": "ines@mitchell.name",
    "phone": "311.614.3341 x111"
  }
}
```

And you can use curl with json above as the data to be updated.

    curl -H "Content-Type: application/json" -X PATCH -d @body.json http://127.0.0.1:3000/api/companies/9

**Response**

```json
{
  "company": {
    "id": 9,
    "name": "Rutherford and Sons",
    "address": "38457 Heaney Ranch",
    "city": "North Autumnport",
    "country": "Sierra Leone",
    "email": "ines@mitchell.name",
    "phone": "311.614.3341 x111",
    "created_at": "2015-04-24T02:48:33.767Z",
    "updated_at": "2015-04-24T02:48:33.767Z"
    "employees": [
      9
    ]
  },
  "positions": [
    {
      "id": 2,
      "name": "Director",
      "created_at": "2015-04-29T02:05:28.092Z",
      "updated_at": "2015-04-29T02:05:28.092Z"
    }
  ],
  "employees": ]
    {
      "id": 9,
      "name": "Halle Kuhlman",
      "position_id": 2,
      "company_id": 9,
      "created_at": "2015-04-29T02:05:28.122Z",
      "updated_at": "2015-04-29T02:05:28.122Z"
    }
  ]
}
```

## Employees

Following are api that you can use to manage employees.

### Retrieve an employee

    GET /api/employees/:id

**Example**

    curl http://127.0.0.1:3000/api/employees/9

**Response**

```json
{
  "employees": ]
    {
      "id": 9,
      "name": "Halle Kuhlman",
      "position_id": 2,
      "company_id": 9,
      "created_at": "2015-04-29T02:05:28.122Z",
      "updated_at": "2015-04-29T02:05:28.122Z",
      "passports": [
        9
      ]
    }
  ],
  "positions": [
    {
      "id": 2,
      "name": "Director",
      "created_at": "2015-04-29T02:05:28.092Z",
      "updated_at": "2015-04-29T02:05:28.092Z"
    }
  ],
  "passports": [
    {
      "id": 8,
      "employee_id": 7,
      "upload_id": 8,
      "upload_file_url": "/uploads/passport.pdf",
      "created_at": "2015-04-24T06:22:17.648Z",
      "updated_at": "2015-04-24T06:22:17.648Z"
    }
  ]
}
```


## Passport

Passport is a property of each employee and each employee can have one or more
passport, following are the api available for managing passport.

### Create a passport

    POST /api/passports

**Input**

| Name        | Type            | Description                               |
| ----------- | --------------- | ----------------------------------------- |
| employee_id | integer         | **Required**. The employee id number      |
| file        | application/pdf | **Required**. The pdf file to be uploaded |

**Example**

    curl -X POST -F "passport[file]=@passport.pdf" -F "passport[employee_id]=7" http://127.0.0.1:3000/api/passports

**Response**

```json
{
  "passport": {
    "id": 8,
    "employee_id": 7,
    "upload_id": 8,
    "upload_file_name": "passport-d93ee94d.pdf",
    "upload_file_url": "/uploads/passport-d93ee94d.pdf",
    "created_at": "2015-04-24T06:22:17.648Z",
    "updated_at": "2015-04-24T06:22:17.648Z"
  }
}
```
