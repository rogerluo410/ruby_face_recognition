# RubyFaceRecognition

[![Gem Version](https://badge.fury.io/rb/ruby_face_recognition.svg)](https://badge.fury.io/rb/ruby_face_recognition.svg)
[![GitHub license](https://img.shields.io/github/license/rogerluo410/ruby_face_recognition)](https://img.shields.io/github/license/rogerluo410/ruby_face_recognition)

A Ruby wrapper for recognize and manipulate faces.  

## Enables

  * Fetch face encoding.    
  * Get distance between two face encodings.  
  * Compare two faces are same person.  

## Dependencies

 - pycall >= 1.4.1, see https://github.com/mrkn/pycall.rb for more.

 - python 3
    
    * Install python 3.7 and face recognition

        1) If use `pyenv`, install python with command to load libpython in pycall:

            ```
            envPYTHON_CONFIGURE_OPTS="--enable-framework" CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install 3.7.0
            ```

        2) Export LIBPYTHON environment variable:

            ```
            export LIBPYTHON="/Users/xxx/.pyenv/versions/3.7.0/lib/libpython3.7m.a"
            ```

        3) Install face recognition tool, see https://github.com/ageitgey/face_recognition:

            ```
            pip3 install face_recognition
            ```

    * Another way for ubuntu

        1) Install python3 and pip3  

        2) Install dlib
         
            ```
            git clone https://github.com/davisking/dlib.git
            ```
            
            ```
            cd dlib
            ```
            
            ```
            mkdir build; cd build; cmake ..; cmake --build .
            ```
            
            ```
            cd ..
            ```
            
            ```
            python3 setup.py install
            ```       

        3) Install plugin

            ```
            pip3 install face_recognition
            ```    

 - face_recognition, see https://github.com/ageitgey/face_recognition for more.

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

```ruby
  require 'ruby_face_recognition'

  # See ./examples folder for images
  wdz1_doubles = FaceRecognition.fetch_face_encoding('./wdz1.jpeg')
  wdz2_doubles = FaceRecognition.fetch_face_encoding('./wdz2.jpeg')
  ycg1_doubles = FaceRecognition.fetch_face_encoding('./ycg1.jpeg')
  ycg2_doubles = FaceRecognition.fetch_face_encoding('./ycg2.jpeg')

  pp "wdz1 and wdz2 is same: #{FaceRecognition.same_person?(wdz1_doubles,
                                                          wdz2_doubles)}, tolerant is #{FaceRecognition.get_tolerant(
                                                              wdz1_doubles, wdz2_doubles
                                                          )}"
  pp "wdz1 and ycg1 is same: #{FaceRecognition.same_person?(wdz1_doubles,
                                                          ycg1_doubles)}, tolerant is #{FaceRecognition.get_tolerant(
                                                              wdz1_doubles, ycg1_doubles
                                                          )}"
  pp "ycg1 and ycg2 is same: #{FaceRecognition.same_person?(ycg1_doubles,
                                                          ycg2_doubles)}, tolerant is #{FaceRecognition.get_tolerant(
                                                              ycg1_doubles, ycg2_doubles
                                                          )}"

  #Output:
  "wdz1 and wdz2 is same: true, tolerant is 0.31643992115339953"
  "wdz1 and ycg1 is same: false, tolerant is 1.1141872408732252"
  "ycg1 and ycg2 is same: true, tolerant is 0.338220706580959"

```

### Use in Rails

Assuming Database is postgresql: 

  - Create column to save face encoding.   

    ```   
    add_column :table_name, :column_name, :float, array: true, comment: 'face encoding'
    ```  

  - Create calculating distance function script to Database.   

    ```ruby
      class AddDistanceFunctionToDb < ActiveRecord::Migration[6.1]
          def self.up
              execute "CREATE OR REPLACE FUNCTION distance(l double precision[], r double precision[]) RETURNS double precision AS $$
              DECLARE
                  s double precision;
              BEGIN
                  s := 0;
                  FOR i IN 1..128 LOOP
                  s := s + power(l[i] - r[i], 2);
                  END LOOP;
                  RETURN sqrt(s);
              END;
              $$ LANGUAGE plpgsql;"
          end
          def self.down
              execute "drop function distance(l double precision[], r double precision[]) cascade"
          end
      end

    ```  

  - Use distance function in SQL  

    ```sql
    tolerant = ActiveRecord::Base.connection.exec_query("select distance(ARRAY#{face_encoding1}, ARRAY#{face_encoding2})").rows[0][0]
    ```  

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby_face_recognition. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/ruby_face_recognition/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RubyFaceRecognition project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ruby_face_recognition/blob/master/CODE_OF_CONDUCT.md).
