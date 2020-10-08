# Postdict
Postdict is the online dictionary that focuses on the noun forms.

## Hacking
### Install Dependencies on macOS
Install dependencies needed during building:

```bash
$ brew install node yarn
```

### Install Dependencies on Ubuntu
Install dependencies needed during building:

```bash
$ sudo apt install -y libsqlite3-dev nodejs curl
# Install yarn
$ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
$ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
$ sudo apt update && sudo apt install -y yarn
```

### Build the project
Install dependencies listed in `Gemfile`:

```bash
$ bundle config set --local without 'production'
$ bundle install
```

Install dependencies listed in `package.json`:

```bash
$ yarn install
```

Perform a migration:

```bash
$ rails db:migrate
```

Use `rails s` to start the server:

```bash
$ rails s
```

Open your browser and visit `localhost:3000` to see the top page.

## Contribution
This project is in the early development. If you liked it or interested in, consider contributing to the project!

You can contribute to the project by filing feature requests, reporting bugs, or creating pull requests.
