(->
  # controller definition 
  AuthCtrl = ($auth) ->
    @submitLogin = (auth)->
      $auth.submitLogin(auth)
    @submitRegistration = ->
      $auth.submitRegistration(auth)
    return
  # dependencies inject
  AuthCtrl.$inject = ['$auth']
 
  angular
  .module('mongodoc')
  .controller('AuthCtrl', AuthCtrl)
)()