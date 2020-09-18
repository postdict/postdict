# Postdict
Postdict is the online dictionary that focuses on the noun forms.

## Hacking
### macOS
Install dependencies needed during building:

    brew install node yarn

Install dependencies listed in Gemfile:

    bundle install --path vendor/bundle

Install webpacker:

    yarn install
    bundle exec rails webpacker:install

Use `rails s` to start the server:

    bundle exec rails s

Open your browser and visit `localhost:3000` to see the login page.

### Linux
Install dependencies needed during building:

    sudo apt install -y libsqlite3-dev nodejs curl
    # Install yarn
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt update && sudo apt install -y yarn

Install dependencies listed in Gemfile:

    bundle install --path vendor/bundle

Install webpacker:

    yarn install
    bundle exec rails webpacker:install

Use `rails s` to start the server:

    bundle exec rails s

Open your browser and visit `localhost:3000` to see the login page.

## Contribution
This project is in the early development. If you liked it or interested in, consider contributing to the project!

You can contribute to the project by filing feature requests, reporting bugs, or creating pull requests.
