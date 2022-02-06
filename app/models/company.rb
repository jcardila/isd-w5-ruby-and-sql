class Company < ApplicationRecord

    # def contacts
    #     Contact.where({ company_id: self.id })
    # end
    #forma mas facil:
    has_many :contacts

end
