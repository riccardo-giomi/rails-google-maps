# Rails Google Maps application

A Ruby on Rails 7.0.7 application that uses the Google Maps API to find and save
places.

It's an exercise based on this
[tutorial](https://www.driftingruby.com/episodes/google-maps-api-with-stimulusjs)
from Drifting Ruby.

## Versions and requirements

The current Ruby on Rails version is 7.0.6

|       | Required | Recommended  |
| ----- | -------- | ------------ |
| Ruby  | ~> 3.0   | ~> 3.2       |
| Rails | ~> 7.0   | Latest 7.0.x |

The application is configured to use PostgreSQL, but it is just one edit of
`config/database.yml` away from using whichever DB manager you prefer.
See the
[Rails guide](https://guides.rubyonrails.org/configuring.html#configuring-a-database)
for instructions on how to configure a specific DBMS.

|               | Required | Recommended |
| ------------- | -------- | ----------- |
| PostgreSQL \* | ~> 9.3   | ~> 15       |

- \* **with headers, -dev packages, etc.**

### A Google API key is required

The application requires a valid Google API key.
The corresponding account will require the following services to be active:

- Maps JavaScript API
- Maps Static API
- Places API

If the key has restrictions, as it should have, then the previous services will
need to be enable for the API key as well.

Additionally _Website restrictions_ will need to allow for the application URL,
which locally is going to be `http://localhost:3000`, assuming the server uses
the default Rails port.

## Local installation

Provide a Google API key.

The application expects an environment variable called `GOOGLE_API_KEY` to work
and it should be set to a valid key.

There are multiple ways and tools to set environment variables in a Rails
project, but the application provides the option to create a
`config/local_env.yml` file that will be used _in development only_ to create
environment variables as defined:

```yaml
GOOGLE_API_KEY: "my-api-key"
```

The `config/local_env.yml` file is already ignored by git in the application
`.gitignore` file.

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
