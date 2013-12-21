@c=Course.create(title:"Foundations of Christian Thought",letters:"IAS",number:110)
@p=@c.professors.build(title:"Dr.",first_name:"Mark",last_name:"Cosgrove",department:"Phsychology") 
@c.save
@t=@c.textbooks.create(title:"Brave New World",authors:"Aldous Huxley",edition: "1",published:"1932",price:9.99,isbn:"9780060929879",description:"This is a description of Brave New World",image_url:"http:/files.adam-keenan.net/Images/Geff2.gif")

@s=Student.create(email:"adam_keenan@taylor.edu",password:"nike27",password_confirmation:"nike27",admin:true,year:Date.new(2015),verified:true)

Vote.create(method:"Download")

puts "Creating a rating!!!"
@r=@c.course_textbooks.find_by(textbook:@t).ratings.create(content:"This is the content for the rating.",vote:Vote.first,student:@s)