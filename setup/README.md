# Clock check

There are two ways to get checked/clocked in. If the job manager has allowed Staff to clock themselves in, Staff members will be able to access the check-in tile in the job page. If not, the job Manager will have to appoint a Check-in Administrator who has the ability to check-in all Staff members. 

## Requirements

-- Ruby 2.7.1
-- Rails 6.0.3.4
-- PostgreSQL 12+ 

## Installation

Access the clock folder and run the following commands in the terminal:

```bash
rails db:create
```

```bash
rails db:migrate
```

With these commands, it will allow the generation of the database in Postgresql.

## Usage

Access the clock folder and run the following commands in the terminal:

```bash
rails s
```

With these commands, localhost:3000 can be accessed through the browser.

You can also try the demo at this link:

https://check-clock.herokuapp.com/

## Authors

**Gilberto A. Aguirre** - [YilKanda](https://github.com/YilKanda)
**Pedro Chavez** - [PeterChav01](https://github.com/PeterChav01)
**Jacqueline Flores Mendez** - [JacquelineFloresMendez](https://github.com/JacquelineFloresMendez)
