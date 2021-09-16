class ContactMailer < ApplicationMailer
    def thanks_mail(customer, order)
      @customer = customer
      @order = order
      mail to: customer.email, subject: 'ご注文確定のお知らせ'
    end
end
