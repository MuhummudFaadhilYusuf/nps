class PersonMailer < ApplicationMailer

    def nps(person)
        @person = person

        mail to: @person.email, subject: "Hello"
    end
end
