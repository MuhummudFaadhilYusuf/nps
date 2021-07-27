class PersonMailer < ApplicationMailer

    def nps(person)
        @person = person

        mail to: @person.email
    end
end
