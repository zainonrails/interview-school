Rails.logger = Logger.new(STDOUT)
Rake::Task['db:fixtures:load'].invoke

class_room1 = ClassRoom.create(name: 'C1')
class_room2 = ClassRoom.create(name: 'C2')

Student.create(name: 'Student 1')

# Monday, Wednesday, Friday
Section.create(teacher_id: Teacher.first.id, class_room_id: class_room1.id, subject_id: Subject.first.id,
                       start_time: DateTime.now.in_time_zone.change(hour: 8, min: 30),
                       end_time: DateTime.now.in_time_zone.change(hour: 9, min: 20),
                       days: :mwf)
# Tuesday, Thursday
Section.create(teacher_id: Teacher.first.id, class_room_id: class_room1.id, subject_id: Subject.second.id,
                       start_time: DateTime.now.in_time_zone.change(hour: 8, min: 0),
                       end_time: DateTime.now.in_time_zone.change(hour: 8, min: 50),
                       days: :tt)

# Daily
Section.create(teacher_id: Teacher.second.id, class_room_id: class_room2.id, subject_id: Subject.third.id,
                       start_time: DateTime.now.in_time_zone.change(hour: 8, min: 0),
                       end_time: DateTime.now.in_time_zone.change(hour: 8, min: 50),
                       days: :d)
