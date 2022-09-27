require 'pycall'
require 'pycall/import'
require 'logger'

PyCall.init('python3')

LOGGER = Logger.new(STDOUT)

# wrapper for face_recognition
class RubyFaceRecognition
  class << self
    def fetch_face_encoding(image_full_path)
      begin # rubocop:disable Style/RedundantBegin
        face_recognition = PyCall.import_module('face_recognition') # use python wrap in ruby class domain
        known_image = face_recognition.load_image_file(image_full_path)
        face_encoding = face_recognition.face_encodings(known_image)[0]
        face_encoding.tolist() # rubocop:disable Style/MethodCallWithoutArgsParentheses
      rescue PyCall::PyError => e
        LOGGER.fatal e
      end
    end

    def get_distance(l_doubles: [], r_doubles: [])
      s = 0
      (1..128).to_a.each do |i|
        s += (l_doubles[i] - r_doubles[i]) * 2
      end

      Math.sqrt(s)
    end
  end
end
