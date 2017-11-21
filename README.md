# Face Recognition Server Rails

## Requirements

Tested on Ubuntu 16.04 and 17.04

* Ruby >= 2.4
* Rails >= 5.1
* MySQL (Credentials in config/database.yml)
* Python Services (https://github.com/firemind/face-recog-server-python)

## Setup

### Read Database Schema

```bash
rake db:schema:load
```

### Starting the Webserver

```bash
rails s
```

This starts the server on http://localhost:3000

### Starting the Python Services

```bash
docker-compose up
```

For details refer to Python Services README (https://github.com/firemind/face-recog-server-python)


## Architecture

![Diagram](https://github.com/firemind/face-recog-server/raw/master/figures/face_recog_full.png "Architecture")

