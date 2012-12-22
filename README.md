# RLS [Release]

Heroku deployment wrapper (rubygem). RLS aims at making Heroku deploys a bit
easier

What it currently does/support:

* deploys you app to Heroku
* Notifies NewRelic of the deployment

## Things to come (todo)

* push to origin
* create diff/changelog
* notify airbrake
* tests!
* run migrations

## Installation

`gem install rls` or add `gem 'rls'` to your `Gemfile`

## Usage

    Usage: rls [options]
    Defaults to: rls -r heroku -b master -e production -a off -f false -d false
    where [options] are:
        --remote, -r <s>:   Remote git repo (default: heroku)
        --branch, -b <s>:   Branch to push (default: master)
           --env, -e <s>:   Environment (default: production)
      --app-name, -a <s>:   Newrelic app name (default: off)
             --force, -f:   Force push update
             --debug, -d:   Only print, not perform actions
           --version, -v:   Print version and exit
              --help, -h:   Show this message

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b release-brainz`)
3. Commit your changes (`git commit -am 'Add mega release brainz!!!'`)
4. Push to the branch (`git push origin release-brainz`)
5. Create new Pull Request
6. Go buy a Porche (you've earned it!)
