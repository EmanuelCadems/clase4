#encoding=utf-8
desc "This task is called by the Heroku scheduler add-on"
task :automatic_notification => :environment do 
	puts "Enviando emails de notificación de proximos feriados"
	a = 2 + 3
	User.envio_masivo
	puts"done.#{a}"
end