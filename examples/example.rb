require 'ruby_face_recognition'

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
