# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
(1..4).each do |i|
	User.create(:first_name => "nombre de usuario #{i}",:last_name => "apellido de usuario #{i}",:email => "usuario#{i}@example.com", :password => "usuario#{i}@example.com", :password_confirmation => "usuario#{i}@example.com", :days => 15)
end

Client.delete_all
Holiday.delete_all
User.all.each do | user|
	user.clients.create(:company_name =>"Comunidad XXI", :contact_name => "Emanuel ", :contact_surname => "Alarcón", :email=>"emanuel_cadems@hotmail.com")
	user.clients.create(:company_name =>"Universidad Tecnológica", :contact_name => "Jose Arcadio ", :contact_surname => "Buen Día", :email=>"utn.frt.dspace@gmail.com")	
	user.clients.create(:company_name =>"Soft Tachi", :contact_name => "Juan Pablo ", :contact_surname => "Alarcón", :email=>"j.u.a.n_p.a.b.l.o_@hotmail.com")	
	user.clients.create(:company_name =>"Reparciones eléctricas S.A. ", :contact_name => "Mariano ", :contact_surname => "Alarcón", :email=>"r.u.b_16@hotmail.com")	
	# (1..10).each do |index|
 #   		user.clients.create(:company_name =>"company client #{index}", :contact_name => "client #{index}", :contact_surname => "client surname#{index}", :email=>"client#{index}@example.com")
 #   	end	
   	(1..5).each do |index|
   		user.holidays.create(:description => "feriado #{index}", :date=> Date.today + rand(99))
   	end
end
#Holiday.delete_all


