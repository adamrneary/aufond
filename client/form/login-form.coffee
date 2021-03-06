class @LoginForm extends Form
  template: Template.loginForm

  submit: ->
    data = @getDataFromForm()
    @updateFormData(data)

    trackAction('login', handle: data.handle)

    Meteor.loginWithPassword data.handle, data.password, (error) =>
      if error
        # XXX send custom error to users
        @onError(error.reason)
      else if _.isFunction(@onSuccess)
        @onSuccess()
