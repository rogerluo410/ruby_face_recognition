require 'ruby_face_recognition'

wdz1_doubles = RubyFaceRecognition.fetch_face_encoding('./wdz1.jpeg')
wdz2_doubles = RubyFaceRecognition.fetch_face_encoding('./wdz2.jpeg')
ycg1_doubles = RubyFaceRecognition.fetch_face_encoding('./ycg1.jpeg')
ycg2_doubles = RubyFaceRecognition.fetch_face_encoding('./ycg2.jpeg')

pp wdz1_doubles
pp wdz2_doubles
pp ycg1_doubles
pp ycg2_doubles
