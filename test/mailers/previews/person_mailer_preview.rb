# Preview all emails at http://localhost:3000/rails/mailers/person_mailer
class PersonMailerPreview < ActionMailer::Preview
    def nps
        person = Person.new(email: "test@gmail.com")
        PersonMailer.nps(person)
    end
end
