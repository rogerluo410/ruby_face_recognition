require 'pycall'
require 'pycall/import'
require 'logger'

PyCall.init('python3')

LOGGER = Logger.new(STDOUT)

# wrapper for face_recognition
class FaceRecognition
  class << self
    def fetch_face_encoding(image_full_path)
      begin # rubocop:disable Style/RedundantBegin
        face_recognition = PyCall.import_module('face_recognition') # use python wrap in ruby class domain
        known_image = face_recognition.load_image_file(image_full_path)
        face_encoding = face_recognition.face_encodings(known_image)[0]
        list = face_encoding.tolist() # rubocop:disable Style/MethodCallWithoutArgsParentheses
        list.to_a
      rescue PyCall::PyError => e
        LOGGER.fatal e
      end
    end

    def same_person?(l_doubles, r_doubles)
      raise 'l_doubles must be Array' unless l_doubles.is_a? Array
      raise 'r_doubles must be Array' unless r_doubles.is_a? Array

      # If the tolerant value less than 0.55, judge they are same person.
      get_tolerant(l_doubles, r_doubles) < 0.55
    end

    def get_tolerant(l_doubles, r_doubles)
      raise 'l_doubles must be Array' unless l_doubles.is_a? Array
      raise 'r_doubles must be Array' unless r_doubles.is_a? Array
      raise 'l_doubles must have 128 doubles' unless l_doubles.length == 128
      raise 'r_doubles must have 128 doubles' unless r_doubles.length == 128

      s = 0
      (0..127).to_a.each do |i|
        s += (l_doubles[i] - r_doubles[i]) * 2
      end

      Math.sqrt(s)
    end
  end
end
