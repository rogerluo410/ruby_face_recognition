# RubyFaceRecognition

A wrapper for recognize and manipulate faces of Ruby version.

## Dependencies

 - python 3
    
   * Install python 3.7 and face recognition

        1) If use `pyenv`, install python with command to load libpython in pycall:

            envPYTHON_CONFIGURE_OPTS="--enable-framework" CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install 3.7.0


        2) Export LIBPYTHON environment variable:

            export LIBPYTHON="/Users/roger/.pyenv/versions/3.7.0/lib/libpython3.7m.a"

        3) Install face recognition tool, see https://github.com/ageitgey/face_recognition:

            pip3 install face_recognition

  * Another way for ubuntu

        1) Make install python3 and pip3

        2) Install dlib

            ```
            git clone https://github.com/davisking/dlib.git
            cd dlib
            mkdir build; cd build; cmake ..; cmake --build .
            cd ..
            python3 setup.py install
            ```

        3) Install plugin

            pip3 install face_recognition

 - pip3 install face_recognition, see https://github.com/ageitgey/face_recognition for more.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_face_recognition'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ruby_face_recognition

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby_face_recognition. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/ruby_face_recognition/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RubyFaceRecognition project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ruby_face_recognition/blob/master/CODE_OF_CONDUCT.md).
