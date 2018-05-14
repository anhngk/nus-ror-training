person[address][23][city]

= form_for @person do |person_form|
    = person_form.text_field :name
    @person.addresses.each do |address|
      = person_form.fields_for address, index: address.id do |address_form|
        address_form.text_field :city
    end
  end

Form to external resources
  = form_tag 'bla.com', authencity_token: '' do
    end