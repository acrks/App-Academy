module ApplicationHelper
    def auth_token
        str ="<input
            type="hidden"
            name="authenticity_token"
            #{ form_authenticity_token }
            /> "
    end
end
