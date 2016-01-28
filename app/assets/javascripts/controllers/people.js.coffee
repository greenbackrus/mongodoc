(->
  # controller definition 
  PeopleCtrl = (Restangular, $state) ->
    restPeople = Restangular.all('people')
    @people = restPeople.getList().$object
    share = this
    @editPerson = (person) ->
      $state.go('people.editPerson')
      person.date_of_birth = new Date(person.date_of_birth)
      share.activePerson = person
    @addPeople = ->
      restPeople.post(@newPeople).then($state.reload())
    @patchPerson = (person) ->
      person.save().then($state.reload())
    @delPerson = (person) ->
      person.remove().then($state.reload())
    @showInfo = (person) ->
      $state.go('people.personInfo')
      share.activePerson = person
    return
  # dependencies inject
  PeopleCtrl.$inject = ['Restangular', '$state']
 
  angular.module('mongodoc')
  .controller('PeopleCtrl', PeopleCtrl)
)()