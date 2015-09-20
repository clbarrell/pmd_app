$("#project_contact_id").empty().append("<%= escape_javascript(render(:partial => "contact_options")) %>")
# To update the Contact option dropdown depending on client scope