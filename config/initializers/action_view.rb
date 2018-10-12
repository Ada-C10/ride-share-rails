Rails.application.config.action_view.form_with_generates_remote_forms = false
#this tells rails that
#form_with will not generate those XHR requests anymore
#to the backend without reloading the whole page
# aka it will make a full form submission

#before when Chris hit create/the form submission button
# instead of reloading the whole page the browser?
#make an XHR request (basically rails produces javascript
#to make the request from the backend so it doesn't
#have to reload everything which is a problem because
# the form view is not reloaded along with the error
#messages)
