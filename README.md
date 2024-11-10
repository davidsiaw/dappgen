# Dappgen

Welcome to Dappgen! David's APPlication Generator for generating gems (for now), rails apps (hopefully) and many more things to come!

## Installation

Install it yourself as:

    $ gem install dappgen

## Usage

Generate a gem to try it out!

```
dappgen gem --gem-name=my_test_gem -m execute
```

What do those parameters do?

- `--gem-name=my_test_gem` tells the generator to generate a gem with the name `my_test_gem`, and creates a base module for the gem named `MyTestGem`
- `-m` sets the mode of the generator. By default this is set to `-m dry_run`
 which will show you the resulting directory tree to be created, so you do not accidentally over write anything.

Use

```
dappgen gem --help
```

For more information on what each thing does!

## Development

Check out the repo with

```
git clone https://github.com/davidsiaw/dappgen --recursive
```

After checking out the repo, run `bundle install` to install dependencies. Then, run `bundle exec rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/davidsiaw/dappgen. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/davidsiaw/dappgen/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Dappgen project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/davidsiaw/dappgen/blob/master/CODE_OF_CONDUCT.md).

## TODO

- generate rails app
