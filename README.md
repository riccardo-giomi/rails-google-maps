# Rails Google Maps application

A Ruby on Rails 7.0.6 application that uses the Google Maps API to find and save
places.

It is an exercised based on this [video tutorial](https://www.youtube.com/watch?v=UtgwdLiJ5hA)
from Drifting Ruby.

## Versions and requirements

The current Ruby on Rails version is 7.0.6

|       | Required | Recommended |
| ----- | -------- | ----------- |
| Ruby  | ~> 3.0   | ~> 3.2      |
| Rails | ~> 7.0   | 7.0.6       |

The application is configured to use PostgreSQL, but it is just one edit of
`config/database.yml` away from using whichever DB manager you prefer.
See the
[Rails guide](https://guides.rubyonrails.org/configuring.html#configuring-a-database)
for instructions on how to configure a specific DBMS.

|               | Required | Recommended |
| ------------- | -------- | ----------- |
| PostgreSQL \* | ~> 9.3   | ~> 15       |

- \* **with headers, -dev packages, etc.**

## Local installation

Create the database with:

```bash
bin/rails db:prepare
```

The local server can be started with:

```bash
bin/dev
```

By default the application will be available at `http://localhost:3000`.

The port can be changed by editing `Procfile.dev` and changing the `3000` value
to the desired port number in the following line:

```
web: bin/rails server -p 3000
```
